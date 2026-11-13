#!/usr/bin/env bash
# after_route.sh - Everything after core routing, in order, stopping at the first failed check.
# Usage: flow/after_route.sh [stage]   stages: core | chip | signoff | final   (default: all from core)
set -euo pipefail
. "$(dirname "$0")/env.sh"; cd "$PROJ"
MAP=flow/padmap_pwm8_5mm.json; D=pnr/pwm8_spi_core; START="${1:-core}"
step() { echo; echo "=== $*"; }
run_from() { case "$START" in core) return 0;; chip) [ "$1" != core ];; signoff) [ "$1" = signoff ] || [ "$1" = final ];; final) [ "$1" = final ];; esac; }

if run_from core; then
  step "router result"; grep -E "Number of violations" $D/pnr.log | tail -1
  step "core GDS"
  klayout -b -rd def=$D/4_route.def -rd techlef=$C1D/lef/tech_c1d.lef -rd celllef=$C1D/lef/core_c1d.lef -rd cellgds=$C1D/gds/core_c1d.gds \
          -rd map=$KTECH/scl_c1d.map -rd out=layout/core/pwm8_spi_core.gds -r flow/def2gds.py | grep DEF2GDS
  step "core DRC"; flow/run_drc.sh layout/core/pwm8_spi_core.gds checks/core_drc | head -8
  step "core open/short check"
  klayout -b -rd deff=$D/4_route.def -rd gds=layout/core/pwm8_spi_core.gds -r flow/core_netcheck.py | tee checks/core_netcheck.txt
  grep -q "^OPENS 0" checks/core_netcheck.txt && grep -q "^SHORTS 0" checks/core_netcheck.txt || { echo "STOP: opens/shorts"; exit 1; }
  step "core LVS"
  python3 flow/v2spice.py $D/pwm8_spi_core_rt.v lvs/core_cells.cdl lvs/pwm8_spi_core.cir pwm8_spi_core
  printf '.include core_cells.cdl\n.include pwm8_spi_core.cir\n' > lvs/pwm8_spi_core_lvs.cdl
  flow/run_lvs.sh layout/core/pwm8_spi_core.gds lvs/pwm8_spi_core_lvs.cdl checks/core_lvs pwm8_spi_core
fi
if run_from chip; then
  step "chip assembly"
  mkdir -p layout/chip
  klayout -b -rd padmap=$MAP -rd edges=pnr/edge_pins.json -rd coredef=$D/4_route.def -rd coregds=layout/core/pwm8_spi_core.gds \
          -rd top=OS0000 -rd outgds=layout/chip/OS0000.gds -rd outcdl=lvs/chip.cdl -rd corecir=lvs/pwm8_spi_core.cir \
          -rd cellcdl=lvs/core_cells.cdl -r flow/assemble_chip.py | grep -E "CHIP|SIDE"
  step "chip DRC"; flow/run_drc.sh layout/chip/OS0000.gds checks/chip_drc OS0000 | head -8
  step "chip LVS"; flow/run_lvs.sh layout/chip/OS0000.gds lvs/chip.cdl checks/chip_lvs OS0000
fi
if run_from signoff; then
  step "sign-off: RCX + STA + post-layout SDF sims"; flow/run_signoff.sh $MAP
fi
if run_from final; then
  step "submission package (OS0097, chip art)"
  BLOCK_X=360 BLOCK_Y=360 ART=layout/art/pwm8_monkey.gds ART_X=360 ART_Y=4360 flow/finalize.sh OS0097 pwm8-spi v1 gds/OS0097.gds
  step "images"
  G=$(ls -t submission/OS0097_pwm8-spi_*_v1.gds | head -1)
  klayout -b -rd gds="$G" -rd lyp="$KTECH/scl_c1d.lyp" -rd out=images/1_chip -r flow/render_images.py
fi
echo; echo "AFTER_ROUTE: all requested stages passed"
