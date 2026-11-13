# pwm8-spi (OS0097): all images

From the whole chip down to single transistors. Regenerate everything with:
```bash
cd ~/Desktop/"ic design"/pwm8_spi && flow/make_images.sh flow/images_pwm8.sh
```
Schematics come as `.svg` (open in a browser or VS Code; zoom freely) and, when small enough, also as `.png`.

## 1_chip: the finished layout (`submission/OS0097_pwm8-spi_13112026_v1.gds`)

| File | Shows |
|---|---|
| `chip_full.png`, `chip_full_dark.png` | the whole 5 × 5 mm die: pad ring, core, art, Silicon No. block |
| `core.png` | the 3.6 × 3.6 mm core with its routing |
| `core_cells_zoom.png` | a 240 × 160 µm patch of the core: individual cells and wires |
| `pad_ring_corner.png`, `pads_edge.png` | pads and the pad-to-core wiring |
| `chip_art.png` | the monkey (metal2 art) |
| `silicon_no_block.png` | SCL's OS0097 block |

## 2_layout_steps: how the core was built (OpenROAD stages, drawn with SCL's real cells)

| File | Stage |
|---|---|
| `1_floorplan_power.png` | empty rows (every other row removed for routing), power ring and rails, edge stripes |
| `2_placement.png` | cells placed and buffered |
| `3_clock_tree.png` | clock buffers added |
| `4_routed.png` | all wires on metal1 / metal2 |

## 3_hierarchy: how the modules connect (submodules drawn as boxes)

| File | Module |
|---|---|
| `pwm8_spi_chip` | the whole chip: core + 10 OPAD04 output pads |
| `pwm8_spi_core` | the placed-and-routed block: design + 10 INVR05 output drivers |
| `pwm8_spi_top` | the design: SPI slave, CDC synchronizer, reset synchronizer, register bank, PWM core, and the write-enable edge detector (`$xor`) |

## 4_rtl: each module as logic

Adders, comparators, muxes and registers as Yosys sees them before mapping to cells. Buses stay single wires
(the label `<64>` means a 64-bit bus). The view closest to the Verilog.

`spi_slave`, `cdc_sync`, `reset_sync`, `reg_bank`, `pwm_core`

## 5_gates: each module in real SCL cells

The same modules after synthesis onto SCL C1D cells (`DFCL11` flip-flops, `NND201`, `NOR200`, `MX2101`, ...):
what is actually on the silicon.

| File | Size | Note |
|---|---|---|
| `cdc_sync`, `reset_sync` | 2 flops | easiest to read |
| `spi_slave` | ~350 nodes | readable when zoomed |
| `reg_bank`, `pwm_core` | 770 / 990 nodes | svg only: dense, zoom far in |
| `slices/pwm_channel_slice` | ~70 nodes | **one** PWM channel of `pwm_core`: comparator `phase < duty` + output flop |
| `slices/reg_byte_slice` | ~70 nodes | **one** duty register of `reg_bank`: address decode + 8 flops |

The slices come from `flow/image_slices_pwm8.v`: the same logic as one part of the full module, small enough to
follow gate by gate.

## 6_cells: inside the gates

The layout of every SCL cell type used on the chip (from SCL's `core_c1d.gds`): diffusion, poly (gates of the
transistors), contacts, metal1 and metal2. For example `DFCL11.png` is one flip-flop, `INVR01.png` an inverter.
