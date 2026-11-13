#!/usr/bin/env bash
# make_images.sh - Build the full image set of a chip: layout, layout steps, hierarchy, RTL-level schematics,
# gate-level schematics (real SCL cells) and the layouts of the SCL cells it uses.
# Usage: flow/make_images.sh <config.sh>     (this project: flow/images_pwm8.sh)
#
# The config (bash) sets:
#   NAME            chip name for titles
#   OUT             output folder
#   RTL=(...)       RTL files (all needed by any module below)
#   LIBERTY         liberty used for gate-level schematics (SCL lib, or this project's routable lib)
#   ABC_OPTS        extra abc options (e.g. -dont_use XYZ), may be empty
#   HIER=(...)      modules drawn with their submodules as boxes (folder 3_hierarchy)
#   LEAF=(...)      modules drawn as logic (folder 4_rtl) and as SCL gates (folder 5_gates)
#   SLICES=(...)    optional "file.v:module" extracts, drawn as SCL gates (5_gates/slices)
#   GDS             final chip GDS; CORE_CELL / ART_CELL / BLK for the zoomed views
#   DEFS=(...)      "stage_name:file.def" place-and-route stages (folder 2_layout_steps)
#   NETLIST         routed netlist (its cell types make the cell gallery, folder 6_cells)
#   SRC_ROOT        folder the relative paths above are relative to
# Schematics: Yosys 'show' -> Graphviz. Every schematic is written as .svg (zoom freely) and, when it has fewer
# than PNG_MAX_NODES nodes, also as .png.
set -euo pipefail
. "$(dirname "$0")/env.sh"
FLOW="$(cd "$(dirname "$0")" && pwd)"
CFG="$(realpath "$1")"; . "$CFG"
PNG_MAX_NODES=${PNG_MAX_NODES:-400}
cd "$SRC_ROOT"
mkdir -p "$OUT"/{1_chip,2_layout_steps,3_hierarchy,4_rtl,5_gates,6_cells}
TMP="$OUT/.tmp"; mkdir -p "$TMP"
LYP="$KTECH/scl_c1d.lyp"
RTL_READ=$(printf 'read_verilog -sv %s; ' "${RTL[@]}")
# Yosys takes paths inside its -p script unquoted, so it gets a space-free work folder and its own copy of the
# liberty (project folders may contain spaces, e.g. "ic design"); results are moved into $OUT afterwards.
YT="$(mktemp -d)"; cp "$LIBERTY" "$YT/lib.lib"; YLIB="$YT/lib.lib"; trap 'rm -rf "$YT"' EXIT

render_dot() {   # <yosys dot base in $YT> <output base> : svg always, png if small enough
    local src="$1" base="$2" n
    dot -Tsvg "$src.dot" -o "$base.svg"
    n=$(grep -cE '^\s*[a-z0-9_]+ \[' "$src.dot" || true)
    if [ "$n" -lt "$PNG_MAX_NODES" ]; then dot -Tpng -Gdpi=96 "$src.dot" -o "$base.png"; fi
    rm -f "$src.dot"
    echo "  $(basename "$base"): $n nodes$( [ "$n" -lt "$PNG_MAX_NODES" ] && echo ", svg+png" || echo ", svg only (too large for png)")"
}

echo "== 1_chip: finished layout"
klayout -b -rd gds="$GDS" -rd lyp="$LYP" -rd out="$OUT/1_chip" -rd core="$CORE_CELL" -rd art="$ART_CELL" -rd blk="$BLK" \
        -r "$FLOW/render_images.py" | sed 's/^/  /'

echo "== 2_layout_steps: place-and-route stages (DEF -> GDS with SCL cells)"
k=1
for s in "${DEFS[@]}"; do
    stage="${s%%:*}"; def="${s#*:}"
    grep -v "LAYER metal3" "$def" > "$TMP/stage.def"          # router-only dummy layer, not in SCL's tech LEF
    klayout -b -rd def="$TMP/stage.def" -rd techlef="$C1D/lef/tech_c1d.lef" -rd celllef="$C1D/lef/core_c1d.lef" \
            -rd cellgds="$C1D/gds/core_c1d.gds" -rd map="$KTECH/scl_c1d.map" -rd out="$TMP/stage.gds" \
            -r "$FLOW/def2gds.py" > /dev/null
    klayout -b -rd gds="$TMP/stage.gds" -rd lyp="$LYP" -rd out="$OUT/2_layout_steps/${k}_${stage}.png" -r "$FLOW/img_view.py" | sed 's/^/  /'
    k=$((k + 1))
done

echo "== 3_hierarchy: modules with their submodules as boxes"
for m in "${HIER[@]}"; do
    yosys -q -p "read_liberty -lib $YLIB; $RTL_READ hierarchy -top $m; proc; opt; memory -nomap; opt_clean; show -format dot -prefix $YT/$m -width -stretch -notitle $m" >/dev/null
    render_dot "$YT/$m" "$OUT/3_hierarchy/$m"
done

echo "== 4_rtl: each module as logic (adders, muxes, registers; buses stay single wires)"
for m in "${LEAF[@]}"; do
    yosys -q -p "read_liberty -lib $YLIB; $RTL_READ hierarchy -top $m; proc; opt; memory -nomap; opt; wreduce; opt_clean; show -format dot -prefix $YT/$m -width -stretch -notitle $m" >/dev/null
    render_dot "$YT/$m" "$OUT/4_rtl/$m"
done

echo "== 5_gates: each module in real SCL cells"
gates() {   # <read commands> <module> <out base>
    yosys -q -p "read_liberty -lib $YLIB; $1 hierarchy -top $2; synth -top $2 -flatten; dfflibmap -liberty $YLIB; abc -liberty $YLIB $ABC_OPTS; opt_clean -purge; show -format dot -prefix $YT/$2 -stretch -notitle $2" >/dev/null
    render_dot "$YT/$2" "$3"
}
for m in "${LEAF[@]}"; do gates "$RTL_READ" "$m" "$OUT/5_gates/$m"; done
for s in "${SLICES[@]:-}"; do
    [ -n "$s" ] || continue
    f="${s%%:*}"; m="${s#*:}"; mkdir -p "$OUT/5_gates/slices"
    gates "read_verilog -sv $f;" "$m" "$OUT/5_gates/slices/$m"
done

echo "== 6_cells: layout of every SCL cell type the chip uses"
for c in $(grep -oE '^\s*[A-Z][A-Z0-9]+ ' "$NETLIST" | tr -d ' ' | sort -u); do
    klayout -b -rd gds="$C1D/gds/core_c1d.gds" -rd lyp="$LYP" -rd cell="$c" -rd w=900 -rd out="$OUT/6_cells/$c.png" \
            -r "$FLOW/img_view.py" > /dev/null && echo "  $c"
done

rm -rf "$TMP"
echo "MAKE_IMAGES: done -> $OUT"
