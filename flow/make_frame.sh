#!/usr/bin/env bash
# make_frame.sh - Build the pad frame for pwm8_spi from the pad map: SCL's standard frame ("frame" in the pad map)
# with the output pads in "opad_list" swapped from AIPAD00 to OPAD04, their core-side pins labelled PADn_IN,
# the frame CDL for LVS, and the list of frame nets that reach the inner edge of the pad ring.
# Usage: flow/make_frame.sh [padmap.json]   (default flow/padmap_pwm8_5mm.json)
set -euo pipefail
. "$(dirname "$0")/env.sh"
cd "$PROJ"
MAP="${1:-flow/padmap_pwm8_5mm.json}"
read -r FRAME ONLY < <(python3 -c "import json;m=json.load(open('$MAP'));print(m['frame'],m['opad_list'])")
NAME="frame${FRAME}_opad"
mkdir -p layout/frame pnr
klayout -b -rd frame="$PADF/pad_frame_gds/frame$FRAME.gds" -rd lib="$PADF/klayout/gds/io_pad_c1d.gds" \
        -rd old=AIPAD00 -rd new=OPAD04 -rd out="layout/frame/$NAME.gds" -rd newtop="$NAME" -rd only="$ONLY" \
        -rd pin_x=191.575 -rd pin_y=2.0 -rd suffix=_IN -rd label_layer=10/7 -r flow/swap_pads.py | tail -1
cp "$PADF/klayout/lvs_cdl/io_pad_c1d.cdl" layout/frame/io_pad_c1d.cdl
python3 flow/frame_cdl.py "$PADF/pad_frame_cdl/frame$FRAME.cdl" "layout/frame/$NAME.cdl" "$NAME" io_pad_c1d.cdl "$ONLY"
klayout -b -rd gds="layout/frame/$NAME.gds" -rd js=pnr/edge_pins.json -r flow/edge_pins.py > /dev/null
python3 - "$MAP" <<'PY'
import json, sys
m = json.load(open(sys.argv[1])); e = json.load(open("pnr/edge_pins.json"))
missing = [n for n in m["pins"].values() if n not in e]
print("EDGE_PINS: %d frame nets reach the inner edge; pad-map nets missing: %s" % (len(e), missing or "none"))
sys.exit(1 if missing else 0)
PY
