#!/usr/bin/env bash
# run_signoff.sh - RCX parasitics + STA (min/typ/max) in the OpenLane container, then the SDF-annotated
# post-layout simulation of the chip top (routed core netlist + OPAD04 / INVR05 models).
# Usage: flow/run_signoff.sh [padmap.json]   (default flow/padmap_pwm8_5mm.json).
set -euo pipefail
. "$(dirname "$0")/env.sh"
cd "$PROJ"
MAP="${1:-flow/padmap_pwm8_5mm.json}"
read -r DESIGN SDC < <(python3 -c "import json;m=json.load(open('$MAP'));print(m['design'],m['sdc'])")
PNR="$PROJ/pnr/$DESIGN"
# DEF for extraction: SCL tech LEF only (the router-only dummy metal3 makes OpenRCX crash) -> drop metal3 tracks
grep -v "LAYER metal3" "$PNR/4_route.def" > "$PNR/4_route_signoff.def"
for CORNER in min typ max; do
  OUT="$PROJ/signoff/$CORNER"; mkdir -p "$OUT"
  CNAME="pwm8flow_$$_$RANDOM"; trap 'docker kill "$CNAME" >/dev/null 2>&1 || true' EXIT
  timeout ${RUN_TIMEOUT:-1200} docker run --rm --name "$CNAME" --memory=${MEM:-8g} --memory-swap=${MEM:-8g} --cpus=8 -v "$HOME:$HOME" ${DOCKER_EXTRA:-} --user "$(id -u):$(id -g)" \
    -e C1D="$C1D" -e CORE_LEF="$PROJ/pnr/lef/core_c1d_gds.lef" -e DEF="$PNR/4_route_signoff.def" \
    -e RCX_LIB="$PDK_ROOT/sclc1d/libs.tech/openrcx/scl_c1d.rcx.lib" -e CORNER="$CORNER" -e OUT="$OUT" \
    -e DESIGN="$DESIGN" -e SDC="$PROJ/$SDC" \
    "$OL_IMAGE" openroad -no_init -exit "$PROJ/flow/rcx_sta.tcl" > "$OUT/signoff.log" 2>&1 || true
  grep -E "^STA |ERROR" "$OUT/signoff.log" || { echo "signoff $CORNER failed, see $OUT/signoff.log"; exit 1; }
done

# SDF back-annotated simulation of the chip top. Each corner's SDF holds its delays as (v::v): -Tmax applies them
# (-Ttyp would read the empty middle field = no delays). EDGE_TOL 25 ns: outputs may follow their clock edge by up
# to 25 ns (CLK half period 50, SCLK half period 200); the largest delays seen are printed.
#: same 55 checks as the RTL / gate-level runs
mkdir -p sim
for CORNER in min typ max; do
  iverilog -g2005 -gspecify -Tmax -Ptb_pwm8_spi_top.EDGE_TOL=25.0 -DCHIP_TOP -DGATE_LEVEL -DSDF_FILE="\"$PROJ/signoff/$CORNER/${DESIGN}_$CORNER.sdf\"" \
    -Ptb_pwm8_spi_top.CLK_HALF=50 -Ptb_pwm8_spi_top.SCLK_HALF=200 -o "sim/postlayout_$CORNER.vvp" \
    tb/tb_pwm8_spi_top.v rtl/chip/pwm8_spi_chip.v "$PNR/${DESIGN}_rt.v" tb/models/scl_tie_cells.v "$C1D_V" 2> "sim/postlayout_$CORNER.compile.log"
  printf "post-layout SDF sim (%s): " "$CORNER"
  vvp -n "sim/postlayout_$CORNER.vvp" > "sim/postlayout_$CORNER.log" 2>&1 || true
  grep -E "ALL TESTS PASSED|TESTS FAILED" "sim/postlayout_$CORNER.log" || { echo "no result"; tail -5 "sim/postlayout_$CORNER.log"; }
done
