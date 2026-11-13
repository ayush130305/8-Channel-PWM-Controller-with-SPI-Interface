#!/usr/bin/env bash
# run_libtest.sh - Route the library qualification block and check it (DRC, open/short, LVS). ~5 minutes.
set -euo pipefail
. "$(dirname "$0")/../env.sh"; cd "$PROJ"
T=$PROJ/pnr/libtest; mkdir -p $T; : > $T/via_blockages.txt
CELLS="${CELLS:-$(grep -oE '^\s*[A-Z][A-Z0-9]+ ' syn/pwm8_core_netlist.v | sort -u | tr -d ' ' | grep -v VDDCON | paste -sd,),VDDCON,CDRI01,INVR02,INVR04,INVR06}"
python3 flow/libtest/make_libtest.py pnr/lef/core_c1d_gds.lef $T "$CELLS"
cp $T/libtest.v $T/libtest_net.v
PNR_LIB="$PROJ/pnr/lib/c1d_core_typ_slew10_fo20.lib"
docker run --rm --name libtest_$$ --cpus=8 --memory=6g -v "$HOME:$HOME" --user "$(id -u):$(id -g)" \
  -e C1D="$C1D" -e TECH_LEF="$PROJ/pnr/lef/tech_c1d_route.lef" -e CORE_LEF="$PROJ/pnr/lef/core_c1d_gds.lef" -e MIN_GAP=20 \
  -e PNR_CORNER=typ -e BLOCKAGES="$T/via_blockages.txt" -e NETLIST="$T/libtest_net.v" -e SDC="$T/libtest.sdc" -e DESIGN=libtest \
  -e OUT="$T" -e PINS_TCL="$T/pins.tcl" -e DIE_W=1500 -e DIE_H=1500 -e CORE_M=100 -e VDD_Y=219.15 -e VSS_Y=316.55 \
  -e PL_DENSITY=0.5 -e STOP_AFTER=route -e RSZ_ARGS= -e SKIP_REPAIR=1 -e PNR_LIB="$PNR_LIB" -e MAX_DISP="3000 1000" \
  -e THREADS=8 -e GRT_ADJ=0.3 -e DRT_ITERS=64 -e VIA_IN_PIN="${VIA_IN_PIN:-1}" \
  "$OL_IMAGE" openroad -no_init -exit "$PROJ/flow/pnr_core.tcl" > $T/pnr.log 2>&1 || true
grep -E "ERROR|No access|Number of violations|FLOW: done" $T/pnr.log | tail -4
grep -q "FLOW: done" $T/pnr.log || { echo "LIBTEST: routing did not finish"; exit 1; }
klayout -b -rd def=$T/4_route.def -rd techlef=$C1D/lef/tech_c1d.lef -rd celllef=$C1D/lef/core_c1d.lef -rd cellgds=$C1D/gds/core_c1d.gds \
        -rd map=$KTECH/scl_c1d.map -rd out=$T/libtest.gds -r flow/def2gds.py | grep DEF2GDS
flow/run_drc.sh $T/libtest.gds checks/libtest_drc libtest | head -8
klayout -b -rd deff=$T/4_route.def -rd gds=$T/libtest.gds -r flow/core_netcheck.py | tee $T/netcheck.txt
python3 flow/v2spice.py $T/libtest_rt.v lvs/core_cells.cdl lvs/libtest.cir libtest
printf '.include core_cells.cdl\n.include libtest.cir\n' > lvs/libtest_lvs.cdl
flow/run_lvs.sh $T/libtest.gds lvs/libtest_lvs.cdl checks/libtest_lvs libtest | head -2
