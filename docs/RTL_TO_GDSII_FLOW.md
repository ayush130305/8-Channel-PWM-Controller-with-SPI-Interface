# pwm8_spi: RTL-to-GDSII flow, step by step

Run every command from the project root, in one terminal, top to bottom. Each step says what it does, the
command, and what you should see. If a step doesn't give the expected result, stop and send me the output.
I log results and fixes in `docs/FLOW_LOG.md`.

- **PDK:** SCL 1.2 um C1D open PDK in `~/scl/my_dtech/...`, pad frames in `~/scl/PadFrame_C1D`
- **Tools:** Icarus Verilog 12, Verilator 5, Yosys 0.52, KLayout 0.30, Docker with the OpenLane 1.0.2 image
  (OpenROAD + OpenSTA inside)
- **Scripts:** `flow/` (OpenROAD, KLayout and Python scripts for every step)

## Status (13-11-2026): complete, OS0097 package built

| Step | Result |
|---|---|
| 0-5 RTL, chip top, constraints, synthesis, gate-level sim | pass (54 + 30 checks) |
| 6-7 Routing abstract, floorplan, placement, CTS, routing | router 0 violations |
| 8-10 Core + chip DRC / LVS | DRC 0, 0 opens / 0 shorts, LVS match (core and chip) |
| 11 Sign-off | TNS 0 at min/typ/max; SDF sims pass at all corners |
| 12 Package | `submission/OS0097_pwm8-spi_13112026_v1.gds` (DRC 0/72, LVS match); form values in `FORM_VALUES.md` |

**Die:** SCL's 5 mm x 5 mm frame (52 pads). The 3 mm and 4 mm cores are too small once the buffers SCL's 2.5 ns slew
limit needs are added (see `docs/spec.md`). NIELIT is asked to confirm the 5 mm die (`docs/EMAIL_NIELIT_pwm8.txt`).

---

## Step 0: environment

Set the paths once per terminal. If you open a new terminal, run this again.

```bash
cd ~/Desktop/"ic design"/pwm8_spi && . flow/env.sh && echo "PDK: $C1D" && ls $C1D_V
```

Expected: the PDK path, then the path of `c1d.v`.

## Step 1: lint and RTL simulation

Proves the Verilog is clean and does what `docs/spec.md` says.

```bash
verilator --lint-only -Wall --top-module pwm8_spi_top rtl/*.v && echo "LINT CLEAN"
```
```bash
iverilog -g2005 -o sim/tb_pwm_core.vvp tb/tb_pwm_core.v rtl/pwm_core.v && vvp -n sim/tb_pwm_core.vvp | grep -E "PASSED|FAILED"
```
```bash
iverilog -g2005 -Ptb_pwm8_spi_top.CLK_HALF=50 -Ptb_pwm8_spi_top.SCLK_HALF=200 -o sim/tb_top_spec.vvp tb/tb_pwm8_spi_top.v rtl/*.v && vvp -n sim/tb_top_spec.vvp | grep -E "PASSED|FAILED"
```

Expected: `LINT CLEAN`, then `ALL TESTS PASSED: 30 checks, 0 errors`, then `ALL TESTS PASSED: 54 checks, 0 errors`.

## Step 2: chip top with pads

Outputs go through inverting `OPAD04` pads, driven by `INVR05` cells in the core (`rtl/chip/`). Simulated with
SCL's cell models.

```bash
iverilog -g2005 -Ttyp -DCHIP_TOP -Ptb_pwm8_spi_top.CLK_HALF=50 -Ptb_pwm8_spi_top.SCLK_HALF=200 -o sim/tb_chip.vvp tb/tb_pwm8_spi_top.v rtl/*.v rtl/chip/*.v $C1D_V && vvp -n sim/tb_chip.vvp | grep -E "PASSED|FAILED"
```

Expected: `ALL TESTS PASSED: 55 checks, 0 errors`.

## Step 3: timing constraints

`syn/pwm8_core.sdc` sets `CLK` to 10 MHz and `SCLK` to 2.5 MHz, with 10 ns I/O delays, 1 pF loads and the two
clock-crossing exceptions. Read it once:

```bash
cat syn/pwm8_core.sdc
```

## Step 4: routing abstract + synthesis + pre-layout timing

SCL's `core_c1d.lef` leaves out some cell metal, so the router gets an abstract built from SCL's cell GDS. It is
audited first; cells that fail (a pin with no DRC-legal via position) are kept out of synthesis.

```bash
klayout -b -rd lefin=pnr/lef/core_c1d_snapped.lef -rd gds=$C1D/gds/core_c1d.gds -rd lefout=pnr/lef/core_c1d_gds.lef -r flow/gen_route_lef.py | tail -1
```
```bash
ALL=$(grep -oE "^(macro|MACRO) \S+" pnr/lef/core_c1d_gds.lef | awk '{print $2}' | grep -vE "^FILLER|^DELBUF" | paste -sd,); klayout -b -rd lef=pnr/lef/core_c1d_gds.lef -rd gds=$C1D/gds/core_c1d.gds -rd cells=$ALL -r flow/audit_route_lef.py > checks/lef_audit_all.txt; tail -1 checks/lef_audit_all.txt
```
Expected: `AUDIT: 19 of 62 cells with issues` - exactly the cells in `syn/dont_use.txt`.

```bash
python3 syn/filter_lib.py $C1D/lib/c1d_core_typ.lib syn/dont_use_abc.txt syn/c1d_core_typ_routable.lib && yosys -q -l syn/synth.log syn/synth_pwm8_core.ys && grep -cE "^\s+[A-Z][A-Z0-9]+ " syn/pwm8_core_netlist.v
```
Expected: 860 cells and no error (the script stops with `select -assert-none` if an excluded cell appears).

## Step 5: gate-level simulation

```bash
iverilog -g2005 -Ttyp -DCHIP_TOP -DGATE_LEVEL -Ptb_pwm8_spi_top.CLK_HALF=50 -Ptb_pwm8_spi_top.SCLK_HALF=200 -o sim/tb_gl.vvp tb/tb_pwm8_spi_top.v rtl/chip/pwm8_spi_chip.v syn/pwm8_core_netlist.v tb/models/scl_tie_cells.v $C1D_V && vvp -n sim/tb_gl.vvp | grep -E "PASSED|FAILED"
```
Expected: `ALL TESTS PASSED: 54 checks, 0 errors`.

## Step 6: library qualification block (about 1 minute)

Routes a small block with every cell type the netlist uses, then DRC, open/short check and LVS. Do not route the
full chip until this is clean.

```bash
CELLS=$(grep -oE '^\s*[A-Z][A-Z0-9]+ ' syn/pwm8_core_netlist.v | sort -u | tr -d ' ' | paste -sd,),CDRI01,INVR02,INVR04,INVR06 flow/libtest/run_libtest.sh | tail -6
```
Expected: `DRC ... 0 violation(s)`, `OPENS 0`, `SHORTS 0`, `LVS: MATCH`.

## Step 7: pad frame, floorplan, placement, clock tree, routing (about 40 minutes, 8 threads)

```bash
flow/make_frame.sh flow/padmap_pwm8_5mm.json
```
```bash
: > pnr/pwm8_spi_core/via_blockages.txt; echo "metal2 2268.30 1521.00 2270.06 1545.00" >> pnr/pwm8_spi_core/via_blockages.txt; echo "metal2 2899.20 2592.00 2900.80 2612.30" >> pnr/pwm8_spi_core/via_blockages.txt
```
```bash
RUN_TIMEOUT=7200 MEM=8g DRT_ITERS=64 flow/run_pnr.sh
```
Defaults in `flow/run_pnr.sh`: relaxed P&R liberty (slew 10 ns, fanout 20), `PL_DENSITY=0.42`, `MAX_DISP="3000 1000"`,
`GRT_ADJ=0.55`, `VIA_IN_PIN=1`, `THREADS=8`, the GDS-derived abstract, `syn/dont_use.txt` for the resizer, metal2
keep-outs at the core's W/E edges and power-leg landings. The two blockages above are router blind spots found on
earlier runs (metal2 < 1.7 um from a cell's metal2). Expected: `Number of violations = 0`, `OPENROAD exit code 0`.

## Steps 8-10: core GDS, core DRC / open-short / LVS, chip assembly, chip DRC / LVS

One script, stops at the first failure:
```bash
flow/after_route.sh core
```
Expected: core DRC 0, `OPENS 0` / `SHORTS 0`, core `LVS: MATCH`, chip DRC 0, chip `LVS: MATCH`. It then continues
with sign-off (Step 11) and the package (Step 12). Separate stages: `flow/after_route.sh chip|signoff|final`.

## Step 11: sign-off (parasitics, STA, post-layout simulation)

```bash
flow/run_signoff.sh
```
Expected: three `STA` lines with TNS 0.0, and `ALL TESTS PASSED: 54 checks, 0 errors` for min, typ and max. Each
corner's SDF is applied with `-Tmax` (OpenSTA writes (v::v) triplets; `-Ttyp` would apply no delays), and the
testbench uses a 25 ns edge tolerance (prints the largest delays seen; about 6.5 ns).

## Step 12: submission package (Silicon No. OS0097)

```bash
BLOCK_X=360 BLOCK_Y=360 ART=layout/art/pwm8_monkey.gds ART_X=360 ART_Y=4360 flow/finalize.sh OS0097 pwm8-spi v1 gds/OS0097.gds
```
```bash
klayout -b -rd gds=submission/OS0097_pwm8-spi_$(date +%d%m%Y)_v1.gds -rd block=gds/OS0097.gds -rd dx=360 -rd dy=360 -r flow/verify_block_move.py | grep TOTAL
```
```bash
klayout -b -rd gds=submission/OS0097_pwm8-spi_$(date +%d%m%Y)_v1.gds -rd lyp=$KTECH/scl_c1d.lyp -rd out=$PWD/images/1_chip -r flow/render_images.py
```
Expected: DRC 0 / 72 rules, `LVS: MATCH`, MD5 file, block `TOTAL XOR = 0.000000 um2`, chip images in `images/1_chip/` (the full image set: `flow/make_images.sh flow/images_pwm8.sh`, see `images/README.md`). The SCL
GDS-rules check reports off-grid points only inside SCL-supplied cells (library, pads, Silicon No. block), as for
SCL-supplied cells. Form values: `FORM_VALUES.md`.

---

## What each output is

| File | What |
|---|---|
| `syn/pwm8_core_netlist.v` | synthesised core (SCL cells) |
| `layout/frame/frame5mmx5mm_opad.gds` / `.cdl` | pad frame with OPAD04 output pads |
| `pnr/pwm8_spi_core/1_pdn.def`, `2_place.def`, `3_cts.def`, `4_route.def` | layout after each P&R stage |
| `pnr/pwm8_spi_core/pnr.log` | full P&R log (`FLOW:` lines are the milestones) |
| `layout/core/pwm8_spi_core.gds` | routed core as GDS |
| `layout/chip/OS0000.gds` | full chip (frame + core), before the Silicon No. |
| `checks/*_drc/drc.lyrdb` | DRC markers (open in KLayout: Tools > Marker Browser) |
| `checks/*_lvs/lvs.lvsdb` | LVS result (KLayout: Tools > Netlist Browser) |
| `signoff/<corner>/` | SPEF, SDF and timing reports |
| `submission/` | files to upload to eChipHub |
