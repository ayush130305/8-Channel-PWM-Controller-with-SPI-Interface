# PWM8 SPI Peripheral Specification

Target: SCL 1.2 um C1D, standard **5 mm x 5 mm** pad frame `frame5mmx5mm` (52 pads, 52-pin DIP chip-on-board),
SCL's standard pad types. Silicon No. **OS0097** (requisition NIELIT/SCL/OS/2026/0097, design name `pwm8-spi`).

Why 5 mm: SCL C1D cells are large (one `DFCL11` flop is 100.8 um x 48.7 um). The synthesised core needs ~38 mm
of cell row, plus ~830 buffers (~45 mm) to meet SCL's 2.5 ns slew limit. That is ~184 % of the 3 mm frame's
core and ~130 % of the 4 mm frame's. In the 5 mm frame (3600 um core, 34 rows) it places at 36 % of the core
area. 5 mm x 5 mm is an accepted die size in SCL's procedure document ("FIXED DIE SIZES", Annexure-I).

## Overview

The peripheral accepts 16-bit SPI mode 0 frames and controls eight 8-bit PWM
channels. SPI logic runs from `SCLK`; the register bank and PWM logic run from
`CLK`. The core outputs are `pwm_out[7:0]`, `sync`, and `miso`.

## Top-level interface (core)

| Signal | Direction | Width | Description |
| --- | --- | ---: | --- |
| `sclk` | input | 1 | SPI clock, mode 0 |
| `cs_n` | input | 1 | Active-low chip select; resets the SPI frame counter while high |
| `mosi` | input | 1 | SPI data from master |
| `miso` | output | 1 | SPI data to master; always driven, `0` while `cs_n` is high |
| `clk` | input | 1 | Register-bank and PWM clock |
| `rst_n` | input | 1 | Active-low reset (see Reset) |
| `pwm_out` | output | 8 | PWM channel outputs, channel 0 in bit 0 (registered) |
| `sync` | output | 1 | One-`clk` pulse at each PWM period boundary (registered) |

The core has no internal tri-state. MISO leaves the chip through an ordinary
output pad (SCL `OPAD04`), so it is driven at all times and is **not** high
impedance while `cs_n` is high. Use one pwm8_spi per MISO line, or add an
external tri-state buffer if several SPI devices share MISO.

## Reset

`rst_n` asserts asynchronously in both clock domains.

- **`clk` domain:** an on-chip two-flop reset synchronizer (clocked by `clk`, cleared asynchronously by `rst_n`)
  produces the internal reset. Assertion is immediate; release happens on a `clk` rising edge two cycles after
  `rst_n` goes high. The board does not need to time the release. `clk` must be running for the release to
  take effect.
- **SPI domain:** `rst_n` clears the SPI logic directly. The frame counter is also held cleared whenever `cs_n`
  is high, so release `rst_n` while `cs_n` is high and no SPI frame can start on a partial reset.

## SPI protocol

SPI uses CPOL=0, CPHA=0 (mode 0), MSB first. A frame is exactly 16 bits:

```text
bit 15       bits 14:8       bits 7:0
R/W          address         data
```

`R/W=0` writes and `R/W=1` reads. The address is 7 bits. The master samples
MISO on rising SCLK edges; the peripheral changes MISO on falling edges. For a
read, the peripheral selects the register after receiving the address byte
(R/W plus seven address bits), then shifts the selected byte during the final
eight clocks. A read must not target a register being written in the same
frame. MISO is `0` during the first eight clocks of every frame and during write frames.

The SPI receiver clears its frame counter and input shift register whenever
`cs_n` is high. A frame may be followed by another frame while chip select
remains low; the counter wraps after each 16-bit frame.

## Register map

All registers are 8 bits. Unmapped reads return `8'h00`; writes to read-only
and unmapped addresses are ignored.

| Address | Name | Access | Description |
| ---: | --- | --- | --- |
| `0x00` | CTRL | R/W | Bit 0 enables PWM. Bits 7:1 are reserved: writes are ignored and they read as `0` |
| `0x01` | PRESC | R/W | PWM phase prescaler |
| `0x02` | DUTY0 | R/W | Duty threshold for PWM output bit 0 |
| `0x03` | DUTY1 | R/W | Duty threshold for PWM output bit 1 |
| `0x04` | DUTY2 | R/W | Duty threshold for PWM output bit 2 |
| `0x05` | DUTY3 | R/W | Duty threshold for PWM output bit 3 |
| `0x06` | DUTY4 | R/W | Duty threshold for PWM output bit 4 |
| `0x07` | DUTY5 | R/W | Duty threshold for PWM output bit 5 |
| `0x08` | DUTY6 | R/W | Duty threshold for PWM output bit 6 |
| `0x09` | DUTY7 | R/W | Duty threshold for PWM output bit 7 |
| `0x0A` | ID | Read-only | Fixed peripheral identifier, `8'hA5` |

On reset, CTRL, PRESC, and all duty registers reset to zero. PWM is disabled.

## PWM operation

When enabled, the 8-bit phase counter advances once every `PRESC + 1` rising
edges of `clk`. Thus `PRESC=0` advances every clock. Each output is high when
the phase count is less than its active duty threshold. Duty value zero holds
the output low; value 255 is high for 255 of the 256 phase counts.

PWM frequency: `f_pwm = f_clk / (256 x (PRESC + 1))`. At the 10 MHz target clock this is
39.06 kHz at `PRESC=0` and 152.6 Hz at `PRESC=255`.

The register bank supplies shadow duty values. The PWM core copies all eight
duty values to its active set when the phase counter wraps from 255 to 0, so
duty updates take effect together at a period boundary. While disabled, the
phase counter is held at zero, outputs are low, and shadow duty values are
copied to the active set. `sync` pulses high for one `clk` cycle on each phase
counter wrap while enabled.

`pwm_out` and `sync` come straight from flip-flops, so no comparator glitches
reach the pins. They lag the phase counter by one `clk`, and `sync` is high in
the same cycle that `pwm_out` first shows phase 0 of the new period. After CTRL[0]
is cleared, the outputs go low one `clk` later.

## Clock-domain crossing

SPI writes are transferred to the `clk` domain using a toggle synchronizer.
The SPI side holds the write address and data stable after a completed write;
the `clk` side synchronizes the toggle and generates a one-cycle write enable.

This implementation has one outstanding write slot and no backpressure. The
SPI master must leave at least three rising edges of `clk` between completed
write frames so the toggle can be observed and the bundled address/data can be
sampled before the next write changes them. At the target clocks (`clk` 10 MHz,
`SCLK` at most 2.5 MHz) a 16-bit frame lasts at least 6.4 us, far more than three
`clk` edges (300 ns), so back-to-back write frames always meet this rule. If that
rate constraint cannot be met, replace the toggle transfer with a queued asynchronous
FIFO and define overflow handling.

Reads use a combinational register-bank mux. The SPI side samples the selected
byte after the address byte; the register values are stable except when a
write commits in the `clk` domain. The master should allow an earlier write
to commit before reading back its result.

## Timing targets (sign-off)

| Item | Value |
| --- | --- |
| `clk` | 10 MHz (100 ns period), 50 % duty |
| `SCLK` | at most 2.5 MHz (400 ns period), 50 % duty |
| Clock relationship | `clk` and `SCLK` are asynchronous to each other |
| Corners | min / typ / max (SCL C1D libraries) |
| Input / output delay budget | 10 ns on each I/O, relative to its own clock |
| Output load | 1.0 pF per output pin |

Constraint notes for synthesis and STA:

- Declare `clk` and `sclk` as separate clocks in asynchronous groups: no timing between them except the
  exceptions below.
- `wr_toggle` into the two-flop synchronizer is an intended crossing. Its paths stay unconstrained, and the
  bundled `wr_addr` / `wr_data` are sampled at least two `clk` cycles after they settle.
- The read path from the `clk`-domain registers through the read mux into the SPI shift register
  (loaded on a falling `SCLK` edge) is a crossing; give it a maximum delay of half an `SCLK` period (200 ns).
- `rd_addr` to the shift register stays within the SPI domain: launch on rising `SCLK`, capture on falling `SCLK`,
  so it is a half-cycle (200 ns) path.
- `rst_n` is asynchronous. Exclude it from timing (false path); the reset synchronizer handles release.

## Chip pinout (5 mm frame)

Odd pads are output pads, even pads are input pads (`IPAD00`), plus 4 x `PVDD01` and
4 x `PVSS01` at SCL's fixed positions. Only the 10 output pads used are swapped from `AIPAD00` to `OPAD04`.
All other `AIPAD00` stay as SCL placed them: they have no driver, so nothing floats. `OPAD04` inverts
(`PAD = ~IN1`), so the core drives each output pad with the complement of the signal through an `INVR05`.
Each pin then shows the true signal.

| Pad | Signal | Pad type | Pad | Signal | Pad type |
| --- | --- | --- | --- | --- | --- |
| PAD1 | `miso` | OPAD04 | PAD2 | `clk` | IPAD00 |
| PAD3 | `sync` | OPAD04 | PAD4 | `rst_n` | IPAD00 |
| PAD13 | `pwm_out[0]` | OPAD04 | PAD6 | `sclk` | IPAD00 |
| PAD15 | `pwm_out[1]` | OPAD04 | PAD8 | `cs_n` | IPAD00 |
| PAD17 | `pwm_out[2]` | OPAD04 | PAD10 | `mosi` | IPAD00 |
| PAD19 | `pwm_out[3]` | OPAD04 | | | |
| PAD21 | `pwm_out[4]` | OPAD04 | | | |
| PAD25 | `pwm_out[5]` | OPAD04 | | | |
| PAD27 | `pwm_out[6]` | OPAD04 | | | |
| PAD29 | `pwm_out[7]` | OPAD04 | | | |

- Unused input pads (all other even pads, PAD12..PAD44): tie to VSS on the board.
- Unused output pads (all other odd pads, `AIPAD00`): leave open.
- PAD11 and PAD23 sit in the frame corners; their core-side pin does not reach the ring's inner edge, so they
  are not used.
- 5 inputs and 10 outputs are used (15 of 44 signal pads).

The SCL test board (rev B) is a 28-pin board, so this chip needs a 52-pin board revision. The bonding is one to
one (pad n to package pin n, per SCL).
