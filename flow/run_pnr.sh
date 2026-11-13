#!/usr/bin/env bash
# run_pnr.sh - Run flow/pnr_core.tcl in the OpenLane container for the design in flow/padmap_*.json
# Usage: [STOP_AFTER=place] [PL_DENSITY=0.35] [RELAX_SLEW=10] [MEM=6g] [SKIP_REPAIR=1] [RSZ_ARGS=...] flow/run_pnr.sh [padmap.json]   (default flow/padmap_pwm8_5mm.json)
# This project path has no spaces, so no space-free link is needed.
set -euo pipefail
. "$(dirname "$0")/env.sh"
cd "$PROJ"
MAP="${1:-flow/padmap_pwm8_5mm.json}"
read -r DESIGN NETLIST SDC DIE_W DIE_H CORE_M OX OY VDD_F VSS_F < <(python3 -c "
import json;m=json.load(open('$MAP'))
print(m['design'],m['netlist'],m['sdc'],m['die_size'][0],m['die_size'][1],m['core_margin'],m['core_origin'][0],m['core_origin'][1],
      m['power']['VDD']['stripe_y_frame'],m['power']['VSS']['stripe_y_frame'])")
OUT="${OUT_DIR:-$PROJ/pnr/$DESIGN}"; mkdir -p "$OUT"; touch "$OUT/via_blockages.txt"
# RELAX_SLEW=<ns> (default 10): size with a copy of the .lib whose 2.5 ns max_transition is relaxed. This OpenROAD
# build loops forever in repair_design when a gate's input slew is already far over the limit (pwm8_spi, see
# docs/FLOW_LOG.md "Step 6 root cause"); with the relaxed copy it buffers the big nets first and finishes.
# Sign-off STA still uses SCL's real libraries. RELAX_SLEW=0 uses the real .lib.
if [ "${RELAX_SLEW:-10}" != 0 ] && [ -z "${PNR_LIB:-}" ]; then
  mkdir -p pnr/lib
  # RELAX_FANOUT=<n> (0 = keep SCL's 2-4): max_fanout is a sizing guideline, not a sign-off rule. Raising it lets
  # max_cap and slew decide the buffering, which roughly halves the buffer count (less 2-metal routing).
  FO="${RELAX_FANOUT:-20}"
  PNR_LIB="$PROJ/pnr/lib/c1d_core_${PNR_CORNER:-typ}_slew${RELAX_SLEW:-10}$( [ "$FO" != 0 ] && echo "_fo$FO").lib"
  sed -E "s/max_transition\s*:\s*2\.5\s*;/max_transition : ${RELAX_SLEW:-10} ;/" "$C1D/lib/c1d_core_${PNR_CORNER:-typ}.lib" \
    | { if [ "$FO" != 0 ]; then sed -E "s/max_fanout\s*:\s*[0-9.]+\s*;/max_fanout : $FO ;/"; else cat; fi; } > "$PNR_LIB"
fi
mkdir -p pnr/lef
python3 flow/snap_lef.py "$C1D/lef/core_c1d.lef" pnr/lef/core_c1d_snapped.lef > /dev/null
[ -f pnr/edge_pins.json ] || { echo "run flow/make_frame.sh first (pnr/edge_pins.json missing)"; exit 1; }
python3 flow/gen_pins.py "$MAP" pnr/edge_pins.json "$OUT/pins.tcl" > "$OUT/pins.txt"
# Edge-stripe centres in core-local coordinates
VDD_Y=$(python3 -c "print(round($VDD_F-$OY,3))")
VSS_Y=$(python3 -c "print(round($VSS_F-$OY,3))")
CNAME="pwm8flow_$$_$RANDOM"; trap 'docker kill "$CNAME" >/dev/null 2>&1 || true' EXIT
timeout ${RUN_TIMEOUT:-1800} docker run --rm --name "$CNAME" --memory=${MEM:-6g} --memory-swap=${MEM:-6g} --cpus=${THREADS:-8} -v "$HOME:$HOME" ${DOCKER_EXTRA:-} --user "$(id -u):$(id -g)" \
  -e C1D="$C1D" -e TECH_LEF="${TECH_LEF:-$PROJ/pnr/lef/tech_c1d_route.lef}" -e CORE_LEF="${CORE_LEF:-$PROJ/pnr/lef/core_c1d_gds.lef}" -e MIN_GAP="${MIN_GAP:-20}" -e PNR_CORNER="${PNR_CORNER:-typ}" \
  -e BLOCKAGES="$OUT/via_blockages.txt" -e NETLIST="$PROJ/$NETLIST" -e SDC="$PROJ/$SDC" -e DESIGN="$DESIGN" -e OUT="$OUT" \
  -e PINS_TCL="$OUT/pins.tcl" -e DIE_W="$DIE_W" -e DIE_H="$DIE_H" -e CORE_M="$CORE_M" \
  -e VDD_Y="$VDD_Y" -e VSS_Y="$VSS_Y" -e PL_DENSITY="${PL_DENSITY:-0.42}" -e STOP_AFTER="${STOP_AFTER:-route}" -e RSZ_ARGS="${RSZ_ARGS:-}" -e SKIP_REPAIR="${SKIP_REPAIR:-0}" -e PNR_LIB="${PNR_LIB:-}" -e MAX_DISP="${MAX_DISP:-3000 1000}" -e DONT_USE_FILE="$PROJ/syn/dont_use.txt" -e THREADS="${THREADS:-8}" -e VIA_IN_PIN="${VIA_IN_PIN:-1}" -e GRT_ADJ="${GRT_ADJ:-0.55}" -e DRT_ITERS="${DRT_ITERS:-64}" ${PRE_RSZ_TCL:+-e PRE_RSZ_TCL=$PRE_RSZ_TCL} \
  "$OL_IMAGE" openroad -no_init -exit "$PROJ/flow/pnr_core.tcl" > "$OUT/pnr.log" 2>&1 && RC=0 || RC=$?
echo "OPENROAD exit code $RC$( [ $RC = 137 ] && echo ' (killed: out of memory or timeout)' ; [ $RC = 139 ] && echo ' (crashed: segmentation fault)' )" >> "$OUT/pnr.log"
grep -E "FLOW:|ERROR|Number of violations|Total wire length =|Design area|OPENROAD exit" "$OUT/pnr.log" | tail -14
