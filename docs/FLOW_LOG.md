# pwm8_spi: RTL-to-GDSII flow log

You run every command yourself. Claude gives the commands, explains them, and records here what was run,
what came back, any error and its fix, and what the step teaches. Newest entries at the bottom.

PDK: SCL 1.2 um C1D open PDK (`~/scl/...`). Tools: Icarus Verilog, Verilator, Yosys, OpenROAD (inside the
OpenLane 1.0.2 Docker image), KLayout.

## Lesson plan

| # | Lesson | What you produce | Status |
|---|---|---|---|
| 0 | Tool and PDK check | confirmed toolchain | **done 12-11-2026** |
| 1 | RTL lint and simulation | lint report, sim logs | **done 12-11-2026** |
| 2 | Chip top with pads (IPAD00 / OPAD04) | `rtl/chip/pwm8_spi_core.v`, `rtl/chip/pwm8_spi_chip.v` | **done 12-11-2026** |
| 3 | Timing constraints (two clocks, CDC exceptions) | `syn/pwm8_core.sdc` | **done 12-11-2026** |
| 4 | Synthesis with Yosys onto SCL cells + pre-layout STA | `syn/pwm8_core_netlist.v`, `sta/pre_*` | **done 12-11-2026** |
| 5 | Gate-level simulation of the netlist | sim log | **done 12-11-2026** |
| 6 | Floorplan, power grid, placement (OpenROAD) | DEFs | next |
| 7 | Clock tree and routing | routed DEF / ODB | |
| 8 | Parasitics and STA at min/typ/max | SPEF, SDF, timing reports | |
| 9 | Post-layout (SDF) simulation | sim logs | |
| 10 | Core GDS, pad frame assembly | chip GDS | |
| 11 | DRC and LVS (KLayout, SCL decks) | clean reports | |
| 12 | Silicon No. block and submission package | final GDS, DRC report, MD5 | needs a Silicon No. from SCL |

## Work done before the lessons (Claude, 12-11-2026)

- **RTL review:** `spi_slave` write registers were inferred as set+reset flops (Yosys "Complex async reset").
  Moved them to their own `posedge sclk / negedge rst_n` block.
- **MISO:** the internal tristate became `miso_o` + `miso_oe`, for a bidirectional pad.
- **PWM:** `pwm_out` / `sync` are now registered (no comparator glitches at the pins).
- **Spec:** `docs/spec.md` updated to match.
- **Testbenches:** `tb/tb_pwm_core.v` 30/30 pass, `tb/tb_pwm8_spi_top.v` 43/43 pass at 50 MHz and 10 MHz clk,
  and a trial gate-level run on SCL cells passes 43/43 (216 DFCL11 flops).

## Spec decisions (12-11-2026)

Recorded in `docs/spec.md`:

| Decision | Choice | Effect |
|---|---|---|
| CTRL bits 7:1 | read as 0, writes ignored | only CTRL[0] is stored (7 fewer flops) |
| Reset | on-chip 2-flop reset synchronizer for the `clk` domain | async assert, release on `clk`; board need not time it |
| Clocks | `clk` 10 MHz, `SCLK` at most 2.5 MHz, asynchronous | sign-off targets; back-to-back writes always meet the CDC rule |
| MISO pad | plain `OPAD04` (no high-Z) | `miso_oe` dropped; one device per MISO line |
| Pinout | inputs on PAD2..PAD10, outputs on PAD1..PAD19 (odd) | SCL standard frame; fits the test board's Pico pin use |

**RTL brought in line with the spec** (Claude, 12-11-2026):

1. `spi_slave` / `pwm8_spi_top`: `miso_oe` dropped, `miso_o` renamed to `miso` (always driven, 0 while
   `cs_n` is high).
2. `reg_bank`: only CTRL[0] is stored (`ctrl_en`); CTRL reads `{7'b0, ctrl_en}`.
3. New `rtl/reset_sync.v`: two flops, async clear by `rst_n`, release on the 2nd `clk` edge. `cdc_sync`,
   `wr_toggle_seen`, `reg_bank` and `pwm_core` now use the synchronised reset `rst_clk_n`. The SPI domain keeps `rst_n`.
4. `tb/tb_pwm8_spi_top.v`: high-Z checks replaced by "MISO = 0 while cs_n high"; new CTRL reserved-bit checks
   (FE reads 00, FF reads 01) and a mid-run reset check. A monitor fails if `rst_clk_n` rises away from a `clk`
   edge. It also runs at the spec clocks (10 MHz / 2.5 MHz).

Results after the changes: `tb_pwm8_spi_top` **54/54** at 50/5, 10/5 and 10/2.5 MHz; `tb_pwm_core` **30/30**;
Verilator `-Wall` clean; trial gate-level run on SCL cells **54/54** at 10/2.5 MHz (211 `DFCL11`, 772 cells).

## Log

### Lesson 0: tool and PDK check (12-11-2026)

*Goal:* make sure every tool the flow needs is installed and the PDK is where the scripts expect it.

| Step | Command | Result |
|---|---|---|
| 0.1 | `iverilog -V; verilator --version; yosys -V; klayout -v; docker --version` | Icarus Verilog 12.0, Verilator 5.032, Yosys 0.52 (fee39a3), KLayout 0.30.0, Docker 29.1.3 |
| 0.2 | `ls` of `c1d_core_typ.lib`, `c1d.v`, `c1d_drc.drc` | all three present |
| 0.3 | `docker images \| grep -i openlane` | `ghcr.io/the-openroad-project/openlane:ff5509f6...-amd64`, image `d7e2bdd21e75` |

**Errors:** none.
**What it teaches:** the flow uses five separate programs. Icarus Verilog simulates, Verilator lints, Yosys
synthesises, OpenROAD (inside the OpenLane Docker image) places and routes, and KLayout views the layout and runs
DRC/LVS. Each reads PDK files: the timing library (`.lib`), the cell models (`c1d.v`) and the rule deck (`.drc`).
The same versions are used for every step.

### Lesson 1: lint and RTL simulation (12-11-2026)

*Goal:* prove the Verilog is clean and behaves as the spec says, before it becomes gates.

| Step | Command | Result |
|---|---|---|
| 1.1 | `verilator --lint-only -Wall --top-module pwm8_spi_top rtl/*.v` | `LINT CLEAN` |
| 1.2 | `iverilog -g2005 ... tb/tb_pwm_core.v rtl/pwm_core.v && vvp -n sim/tb_pwm_core.vvp` | `ALL TESTS PASSED: 30 checks, 0 errors` |
| 1.3 | `iverilog -g2005 -P...CLK_HALF=50 -P...SCLK_HALF=200 ... && vvp -n sim/tb_top_spec.vvp` | `ALL TESTS PASSED: 54 checks, 0 errors` |

**Errors:** none.
**What it teaches:** lint catches mistakes simulation can miss, such as width mismatches, unused signals and a
signal used as both async reset and data. A *self-checking* testbench prints PASS/FAIL by itself, so the same
test can be re-run after synthesis and after layout. `-P` changes a testbench parameter (here the clock speeds)
without editing the file.

### Lesson 2: chip top with pads (12-11-2026)

*Goal:* wrap the design in the SCL pad ring and prove the chip still works through the pads.

Files written by Claude:

- `rtl/chip/pwm8_spi_core.v`: the block that gets placed and routed. It is `pwm8_spi_top` plus one `INVR05`
  driver per output (`miso`, `sync`, `pwm_out[7:0]`) and a constant 1 for the 2 unused output pads.
- `rtl/chip/pwm8_spi_chip.v`: chip top. 12 `OPAD04` output pads on PAD1..PAD23 (odd). The input pads (`IPAD00`)
  have no Verilog model, so inputs are wired straight through.
- `tb/tb_pwm8_spi_top.v`: `-DCHIP_TOP` runs the same 54 checks on the chip top, plus "unused pads read 0".
- Chip-level files live in `rtl/chip/`, so `rtl/*.v` (the design alone) still compiles without SCL's cell models.

| Step | Command | Result |
|---|---|---|
| 2.1 | `export C1D_V=.../digital_c1d/verilog/c1d.v` | path found |
| 2.2 | `iverilog -g2005 -Ttyp -s pwm8_spi_chip ... $C1D_V` | `CHIP ELABORATES` (sim/chip_elab.vvp, 14:39) |
| 2.3 | `grep -c "^ *OPAD04 " rtl/chip/pwm8_spi_chip.v` | 12 |
| 2.4 | system test with `-DCHIP_TOP` at 10 / 2.5 MHz | `ALL TESTS PASSED: 55 checks, 0 errors` (sim/tb_chip.vvp, 14:39) |

**Errors:** none.
**What it teaches:** pads are real cells with their own behaviour. `OPAD04` inverts, so the core drives inverted
signals and the pad undoes it. `IPAD00` is passive (no logic), so it has no simulation model. Simulating through
the pads with SCL's own cell models (`c1d.v`) proves the polarity is right before any layout exists. `-Ttyp`
picks typical delays and silences the min:typ:max warnings from `c1d.v`.

### Lesson 3: timing constraints (12-11-2026)

*Goal:* tell the timing tools how fast each clock runs, what the outside world does at each pin, and which
paths between the two clocks are intentional crossings.

File written by Claude: `syn/pwm8_core.sdc` (SDC = Synopsys Design Constraints, read by OpenSTA / OpenROAD).

| Constraint | Value | Why |
|---|---|---|
| `CLK` | 100 ns (10 MHz) on port `clk` | spec sign-off target |
| `SCLK` | 400 ns (2.5 MHz) on port `sclk` | fastest SPI clock the spec allows |
| Input delay | 10 ns on `mosi`, `cs_n` (vs SCLK) | master's output delay after its edge |
| Output delay | 10 ns on `miso_pn` (SCLK), `sync_pn`/`pwm_pn` (CLK) | budget for pad + board |
| Load | 1.0 pF on every output | `OPAD04` input capacitance (0.79-1.05 pF) |
| `rst_n` | false path | asynchronous; `reset_sync` handles release |
| `spare_pn` | false path | constant |
| SCLK -> CLK | max delay 100 ns, no hold check | toggle synchronizer + bundled write data |
| CLK -> SCLK | max delay 200 ns, no hold check | register read mux into the SPI shift register |

| Step | Command | Result |
|---|---|---|
| 3.1 | `cat syn/pwm8_core.sdc` | read |
| 3.2 | SDC port names vs `pwm8_spi_core` ports | all 9 SDC names match a core port ("done") |

**Errors:** none.
**What it teaches:** SDC is the contract between the designer and the timing tools: clock periods, what the
outside world does at each pin (input/output delay, load), and which paths are deliberately *not* single-cycle
(false paths, max-delay crossings). A wrong port name doesn't error in many tools, it just constrains nothing, so
checking names is worth the minute.

The constraints are proven against a real netlist in Lesson 4 (pre-layout STA).

### Lesson 4: synthesis onto SCL cells + pre-layout STA (12-11-2026)

*Goal:* turn the RTL into a netlist of real SCL C1D cells, then check timing against the Lesson 3 constraints
before any layout exists.

Files written by Claude:

- `syn/synth_pwm8_core.ys`: Yosys script. Flops map to `DFCL11`, logic to C1D gates
  with `NND201` excluded (via DRC on its pins), constants to `VDDCON` tie cells. Writes `syn/pwm8_core_netlist.v`.
- `sta/sta_pre.tcl`: OpenSTA script (in the OpenLane image). Reads one corner's `.lib`, the netlist and the SDC,
  and writes `sta/pre_<corner>_{setup,hold,drv,unconstrained}.rpt`.

Claude's dry run (scratch copy): 767 cells (211 DFCL11, 10 INVR05, 3 VDDCON), area 2859. STA setup WNS
+72.7 / +65.7 / +63.8 ns and hold WNS +0.84 / +1.98 / +2.33 ns at min / typ / max, TNS 0. There are 1790
max-slew / cap / fanout violations: the reset synchronizer output drives 271 CLRB pins (44 ns slew) and the clocks
have no tree yet. That is expected before P&R; buffering (`repair_design`) and CTS fix it in Lessons 6-7.
Two fixes along the way: OpenROAD's `link_design` needs a LEF, so pre-layout STA uses standalone `sta`; and this
OpenSTA spells the flag `-group_count`.

| Step | Command | Result |
|---|---|---|
| 4.1 | `yosys -q -l syn/synth.log syn/synth_pwm8_core.ys` | 767 cells: 211 DFCL11, 10 INVR05, 3 VDDCON; area 2859.2 (15:23) |
| 4.2 | `sta` at min / typ / max | setup WNS +72.670 / +65.673 / +63.787 ns, hold WNS +0.844 / +1.982 / +2.334 ns, TNS 0 |
| 4.3 | `grep -c VIOLATED sta/pre_max_drv.rpt` | 1790 DRV violations; worst fanout `_1469_/Q` drives 271 (limit 4) |

**Errors:** none in your run.
**What it teaches:** synthesis maps RTL onto the foundry's cells, and the cell mix tells you what the design costs
(211 flops = 211 bits of state). STA checks every flop-to-flop path in seconds, without vectors, at every corner.
Positive setup slack means paths are fast enough; positive hold slack means data doesn't change too soon. The DRV
count (slew / cap / fanout) is high on purpose: one net (the synchronised reset) feeds 271 pins, and the clocks
have no tree yet. Place-and-route must bring this to (near) zero with buffering and CTS.

### Lesson 5: gate-level simulation of the synthesised netlist (12-11-2026)

*Goal:* run the same 55 system checks on the Yosys netlist, inside the chip top with the pads. This proves
synthesis kept the behaviour.

Found while preparing it (Claude):

- **No `VDDCON` simulation model.** SCL's `c1d.v` has none, although the `.lib` (TIEHI = 1), LEF (`macro VDDCON`,
  pin TIEHI on metal1) and GDS all have the cell. Added `tb/models/scl_tie_cells.v` (VDDCON / VSSCON from the
  `.lib` functions), labelled as ours, not SCL's.
  - Note for LVS (Lesson 11): SCL's CDL for VDDCON has only VDD/VSS and no devices, because TIEHI is a strap to
    VDD. The LVS netlist must merge the TIEHI net into VDD.
- **Escaped net names in the flattened netlist.** The reset net is `\u_pwm.u_rst_sync.rst_ff2`. `-DGATE_LEVEL`
  makes the testbench probe it through a plain wire.

Claude's dry run: 55/55 at -Tmin / -Ttyp / -Tmax. `c1d.v` cell delays are zero, so the corners only differ after
SDF back-annotation in Lesson 9.

| Step | Command | Result |
|---|---|---|
| 5.1 | gate-level system test, typ (chip top + `syn/pwm8_core_netlist.v` + tie models + `c1d.v`) | `ALL TESTS PASSED: 55 checks, 0 errors` (15:29) |
| 5.2 | same at -Tmin / -Tmax | 55/55 and 55/55 |

**Errors:** none in your run. The missing `VDDCON` model was caught and fixed while preparing the lesson.
**What it teaches:** STA says "fast enough", gate-level simulation says "still correct". Re-running the *same*
self-checking test on the netlist catches anything synthesis changed (wrong reset values, removed logic, a
mis-mapped flop). Vendor models can be incomplete: a cell present in the `.lib`/LEF/GDS but not in `c1d.v` only
shows up when you simulate the real netlist.

### Lesson 6 preparation: the design does not fit a 1.6 mm core (12-11-2026)

Claude wrote the P&R flow in `flow/`: `env.sh`, `make_frame.sh`, `run_pnr.sh`, `pnr_core.tcl` (now
reads `syn/pwm8_core.sdc`, has `STOP_AFTER=place`, and logs a DRV count before and after `repair_design`), plus
`padmap_pwm8.json` (17 core pins) and the unchanged helpers `swap_pads.py`, `frame_cdl.py`, `edge_pins.py`,
`gen_pins.py` and `snap_lef.py`.

Dry run (scratch copy):

- `flow/make_frame.sh`: OK. 12 AIPAD00 swapped to OPAD04, CDL written, 26 edge nets. The frame GDS is 84,506
  bytes.
- `STOP_AFTER=place flow/run_pnr.sh`: floorplan and power grid OK (14 rows), then
  **`[ERROR GPL-0301] Utilization exceeds 100%`**.

Why: SCL C1D cells are large. One `DFCL11` flop is 100.8 x 48.7 um, and pwm8_spi has 211 flops.
All 767 cells need **36.0 mm of row length (1.75 mm2)**. A 3 mm frame's core block is
1600 x 1600 um with every other row removed (SCL template, for 2-metal routing), giving 14 rows x 1400 um =
19.6 mm. That is **184 % utilisation**.

| Option | Row length | Utilisation |
|---|---|---|
| 1.6 mm core, half rows | 19.6 mm | 184 % |
| 1.6 mm core, all rows | 39.2 mm | 92 % (no routing room on 2 metals) |
| ~2.2 mm core in the 3 mm frame, half rows | ~40 mm | ~90 % |
| 4 mm frame (40 pads), larger core, half rows | ~59 mm | ~61 % (estimate) |

Decision needed from the designer: bigger frame, smaller design, or a denser floorplan.

### Change of approach + Lesson 6 investigation (12-11-2026)

**Approach changed (your request):** instead of lesson-by-lesson dry runs, the whole flow is now one document,
`docs/RTL_TO_GDSII_FLOW.md` (steps 0-12 with commands and expected output). You run it and report when stuck.

**Die size:** SCL's procedure document allows 1, 2, 3, 4 and 5 mm dies, each with its standard frame
(4 mm = 40 pads, 40-pin DIP). A 4 mm trial placement (2600 um core, 24 rows) gives about 62 % utilisation (placer
suggests density 0.63). Draft questions for NIELIT (second Silicon No., 4 mm die, OPAD04): `docs/EMAIL_NIELIT_pwm8.txt`.

**Script changes for the 4 mm frame:**
- `edge_pins.py` and `gen_pins.py` take the ring edge and pad range from the frame, not 3 mm constants.
- `swap_pads.py` and `frame_cdl.py` take an optional pad list (`ONLY=`): unused output pads stay AIPAD00
  (no floating OPAD04 inputs).
- `make_frame.sh` takes `FRAME=`.
- New `padmap_pwm8_4mm.json`.
- `run_pnr.sh` reports the OpenROAD exit code and accepts `MEM=`, `RSZ_ARGS=` and `SKIP_REPAIR=1`.
- Back end, untested on pwm8_spi so far: `def2gds.py`, `run_drc.sh`, `run_lvs.sh`,
  `via_blockages_from_drc.py`, `cdl_filter.py`, `v2spice.py`, `assemble_chip.py` (ring edge from frame size),
  `rcx_sta.tcl` (reads the project SDC), `run_signoff.sh` (pwm8 testbench + SDF), `finalize*.py/sh`,
  `check_gds_rules.py`, `grid_audit.py` (frame name from the frame used), `drc_report_txt.py`,
  `verify_block_move.py`. `tb/tb_pwm8_spi_top.v` gains `$sdf_annotate` when `SDF_FILE` is defined.

**Open issue: `repair_design` is killed (exit 137, out of memory) on the pwm8_spi netlist.**

| Tried | Result |
|---|---|
| 6 GB, then 16 GB container memory | killed after ~35 s / ~100 s |
| `-max_wire_length 1000` | killed |
| no load on the tie-cell outputs (`spare_pn`) | killed |
| reset net (271 sinks) set `dont_touch` | killed |
| minimal SDC (one clock only) | killed |
| netlist without tie cells | killed |
| a smaller reference netlist, same script and image | **works** (310 → 123 violations in 7 s) |

So the cause is in the pwm8_spi netlist itself, not the script, image or constraints. Still to try: the
negedge-SCLK flops (clock inverters), splitting the run to find which net it loops on, and the newer
`repair_design` options. Until then `SKIP_REPAIR=1` lets the rest of the flow run, with DRV violations left in.

### Step 6 root cause found (12-11-2026)

**Why `repair_design` was killed (exit 137).** It is an endless loop, not a real memory need. With RSZ debug
on, it inserted 4,250,398 buffers on one net in about 60 s:

- `_1252_` (NOR300) drives one flop D pin, 0.168 pF over a 52.7 um wire, and its output slew is 2.63 ns
  (limit 2.5).
- The resizer adds a `CDRI01` buffer at the load, the only buffer cell available. Its input is 0.238 pF, which
  is worse, so it adds another, and so on.
- The real driver of the problem is upstream: nets with 40-60 ns slews (the 271-pin reset net and other
  high-fanout nets) feed these gates, so their outputs can't meet 2.5 ns whatever their load. This OpenROAD
  build repairs from the flops backwards and never reaches the upstream nets.
- Excluding the weakest gates in synthesis (`-dont_use NOR200 NOR300 NND300`) only moves the loop to the next
  gate (`NOR301`).

**Workaround that works:** a first repair pass with a copy of the `.lib` whose `max_transition` is relaxed from
2.5 to 10 ns (`PNR_LIB=`; `pnr_core.tcl` and `run_pnr.sh` now support it). `repair_design` then finishes:
783 → 357 violations, **680 buffers inserted in 298 nets**, 12 cells resized.

**New, bigger problem: the buffers don't fit.** One `CDRI01` is 54.6 um wide, so 680 of them add 37 mm of row. The
design (~38 mm) plus buffers needs ~75 mm; the 4 mm frame's core (24 rows x 2400 um) gives 57.6 mm, about
**130 %**, so detailed placement never finishes (stopped after 10 min). Lifting the fanout limit with
`set_max_fanout` changes nothing: the limits come from the `.lib`.

Decision needed: 5 mm frame, a smaller design, or a denser floorplan.

### Steps 6-7 on the 5 mm frame: placement and 2-metal routing (12-11-2026)

- **5 mm frame chosen** (user: "if scl allows it then let's not shrink"). Corner pads PAD11/PAD23 can't reach the
  ring's inner edge, so `pwm_pn[4]`/`[5]` moved to PAD21/PAD25; `make_frame.sh` now checks every padmap net exists.
- **Placement:** `DPL-0036` legalisation failure on one MX2101 → `MAX_DISP="3000 1000"` (default now).
- **Routing did not converge** with the first settings: about 11,000 → 9,100 violations after 8 passes, almost all
  metal2 shorts. Cause: 834 `CDRI01` buffers. Most came from the `.lib` `max_fanout` of 2-4 (the 271-pin reset
  net alone needs ~90 buffers at fanout 4). Total route was 2.4 m of wire on 2 metals.
- **Fix:** (1) the relaxed P&R liberty copy also sets `max_fanout : 20` (`RELAX_FANOUT=20`). Buffers drop to
  462 and wire to 1.1-1.2 m; `max_cap` and slew still decide the buffering. `max_fanout` is a sizing guideline,
  not a DRC or sign-off rule. (2) `GRT_ADJ=0.55` reserves 55 % of the tracks in global routing, so the guides
  spread out. Detailed routing then converges in 8 passes: 3191 → 2049 → 1773 → 729 → 199 → 76 → 22 → **0**.
  `GRT_ADJ=0.4` reached 39, and `GRT_ADJ=0.6` overflowed in global routing.
- Tried and dropped: `PL_DENSITY=0.7` (clustered cells: worse, 12,000 violations) and the GRT adjustment alone
  without the fanout fix (5,900 after 6 passes).

### Step 8: core DRC (12-11-2026)

First core GDS: 50 markers. 28 × 9.4.1 via-poly, 14 × 9.3.1 via-contact, 2 guideline-6 (all router via1 on cell
pins), and 6 × 10.1.1 metal2 spacing. Via-fix loop round 1: 33 via1 blockages, re-route.

### Hidden metal in SCL's cell LEF (12-11-2026): the real cause of shorts and 10.1.1

- Core LVS failed (nets shorted to VDD, Q/QB shorts) although the router reported no shorts. Cause: SCL's
  `core_c1d.lef` leaves out metal that is in the cell GDS. INVR04 has a 2.5 x 10.5 um **VDD metal2** strap.
  DFCL11 (D, CLRB), MX2101 (D0, OUT1) and VDDCON (TIEHI) have **metal2 pin extensions**, and some cells have
  metal1. The router can't see them, so it runs other nets straight through them.
- `flow/lef_add_obs.py` builds `pnr/lef/core_c1d_route.lef` from the GDS. For each cell it traces each pin's
  metal1/via1/metal2 connectivity:
  - uncovered signal-pin metal is added to that PIN;
  - supply metal2 becomes OBS;
  - metal of internal nets becomes OBS.
- OpenROAD then crashed ("cannot find layer", signal 11) on pins with metal2 shapes, because metal2 is the top
  layer. Fix: `pnr/lef/tech_c1d_route.lef` adds a dummy `via2`/`metal3`, which is never routed on
  (`top_routing_layer metal2`).
- Also found: `set_thread_count` was missing, so detailed routing ran on 1 core. Now `THREADS=8` (about 7x faster).
- `ADOR16` is excluded in synthesis (`-dont_use ADOR16`): it caused 24 of 37 via-to-poly/contact markers.
  870 cells.
- A partial rip-up-and-reroute (`flow/eco_route.tcl`) gave "0 violations", but with the old LEF it merged 74
  nets through hidden metal. Dropped.

### Partial rip-up and re-route: dropped for good (13-11-2026)

Tried twice (`flow/eco_route.tcl`). Both times only the named nets changed and the router reported 0 violations,
but the new wires shorted through existing routing (74 nets the first time, 103 the second). This OpenROAD build's
detailed router does not see existing wires as obstacles in that mode. Fixes now always go through a full route,
with the gate checks (`flow/after_route.sh`) as the arbiter.

### Result (13-11-2026): OS0097 package built

- **Routing abstract built from the GDS** (`flow/gen_route_lef.py` → `pnr/lef/core_c1d_gds.lef`), checked before any
  routing by `flow/audit_route_lef.py` (coverage, pin legality, pin access, via legality with SCL's deck operations
  from `flow/via_rules.py`). Then a small qualification block (`flow/libtest/run_libtest.sh`, all cell types, ~1 min)
  must route DRC 0 / LVS match before the full chip. Key facts found by measurement:
  - SCL 9.4.1 is `via.separation(poly,1.2)`: vias on poly are legal unless an edge faces poly across < 1.2 um
    (notches, Euclidean corners). Synthetic tests: `checks/synth_via.gds`.
  - OpenROAD via-in-pin checks the via pad against the MERGED pin shape.
  - OpenROAD does not hold OBS that touches a pin against that pin's own access.
- **Cells excluded** by the audit (no DRC-legal via site on some pin): `syn/dont_use.txt` (19 cells). ABC maps with
  `syn/c1d_core_typ_routable.lib`; `select -assert-none` in the synth script stops if one appears. 860 cells.
- **Chip assembly**: metal2 keep-outs along the core's W/E edges (6 um) and at the power-leg landings (24 um) so the
  pad-to-core stubs and VDD/VSS legs cannot cross core wiring (they did: 9 + 8 nets).
- **Router blind spot**: twice it left a metal2 wire < 1.7 um from a cell's metal2 and reported 0 violations; fixed
  with a metal2 blockage and a full re-route; SCL DRC is the arbiter.
- **Post-layout simulation**: OpenSTA's SDF has (v::v) triplets, so `-Ttyp` applied no delays (the typ "pass" was
  empty). Now every corner runs with `-Tmax`; the testbench has an explicit EDGE_TOL (1 ns RTL, 25 ns post-layout)
  and prints the largest delays seen (max 6.5 ns).
- **Final**: router 0, core DRC 0, 0 opens / 0 shorts, core LVS match, chip DRC 0, chip LVS match, STA TNS 0 at
  min/typ/max (setup +73.2 ns, hold +0.83 ns), SDF sims pass at all corners, final GDS DRC 0/72 + LVS match, block
  XOR 0, 0 off-grid vertices in our geometry. `submission/OS0097_pwm8-spi_13112026_v1.gds`,
  MD5 34a42ab17cd36009713964715c68e822.
