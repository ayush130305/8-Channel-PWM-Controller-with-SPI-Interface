// pwm8_spi_chip.v - Chip-level top for pwm8_spi in the SCL C1D 5 mm x 5 mm pad frame (52 pads, 52-pin DIP)
// Inputs : IPAD00 on even pads (series resistor + ESD, passive) -> wired straight to the core.
//          IPAD00 has no Verilog model, so the input pads are not instantiated here.
// Outputs: 10 of the frame's AIPAD00 pads replaced by OPAD04 (inverting output driver, PAD = ~IN1),
//          fed by INVR05 drivers in the core. All other pads stay as SCL placed them.
// Power  : 4 x PVDD01, 4 x PVSS01 at SCL's fixed frame positions (not modelled).
// Port names match pwm8_spi_top, so tb/tb_pwm8_spi_top.v drives either (compile with -DCHIP_TOP).
// Simulate with SCL's c1d.v (provides OPAD04 and INVR05).
//
// Pad map (docs/spec.md, "Chip pinout"):
//   PAD1  miso   PAD2  clk     PAD13 pwm_out[0]  PAD25 pwm_out[5]
//   PAD3  sync   PAD4  rst_n   PAD15 pwm_out[1]  PAD27 pwm_out[6]
//                PAD6  sclk    PAD17 pwm_out[2]  PAD29 pwm_out[7]
//                PAD8  cs_n    PAD19 pwm_out[3]
//                PAD10 mosi    PAD21 pwm_out[4]
//   All other signal pads are unused (inputs: tie to VSS on the board; AIPAD00: leave open).
//   PAD11 and PAD23 are not used: they sit in the frame corners and their core-side pins do not reach the ring edge.
`timescale 1ns/1ps

module pwm8_spi_chip (
    input  wire       sclk,        // PAD6  - SPI clock
    input  wire       cs_n,        // PAD8  - SPI chip select
    input  wire       mosi,        // PAD10 - SPI data in
    output wire       miso,        // PAD1  - SPI data out
    input  wire       clk,         // PAD2  - PWM / register clock
    input  wire       rst_n,       // PAD4  - asynchronous active-low reset
    output wire [7:0] pwm_out,     // PAD13..PAD21, PAD25..PAD29 (odd) - PWM outputs
    output wire       sync         // PAD3  - period pulse
);
    wire       miso_pn;            // Inverted MISO from the core
    wire       sync_pn;            // Inverted sync from the core
    wire [7:0] pwm_pn;             // Inverted PWM outputs from the core

    // This contains the instantiation for pwm8_spi_core
    pwm8_spi_core u_core (
        .clk(clk), .rst_n(rst_n), .sclk(sclk), .cs_n(cs_n), .mosi(mosi),
        .miso_pn(miso_pn), .sync_pn(sync_pn), .pwm_pn(pwm_pn)
    );

    // This contains the instantiation for OPAD04
    OPAD04 pad01_miso  (.PAD(miso),       .IN1(miso_pn));

    // This contains the instantiation for OPAD04
    OPAD04 pad03_sync  (.PAD(sync),       .IN1(sync_pn));

    // This contains the instantiation for OPAD04
    OPAD04 pad13_pwm0  (.PAD(pwm_out[0]), .IN1(pwm_pn[0]));

    // This contains the instantiation for OPAD04
    OPAD04 pad15_pwm1  (.PAD(pwm_out[1]), .IN1(pwm_pn[1]));

    // This contains the instantiation for OPAD04
    OPAD04 pad17_pwm2  (.PAD(pwm_out[2]), .IN1(pwm_pn[2]));

    // This contains the instantiation for OPAD04
    OPAD04 pad19_pwm3  (.PAD(pwm_out[3]), .IN1(pwm_pn[3]));

    // This contains the instantiation for OPAD04
    OPAD04 pad21_pwm4  (.PAD(pwm_out[4]), .IN1(pwm_pn[4]));

    // This contains the instantiation for OPAD04
    OPAD04 pad25_pwm5  (.PAD(pwm_out[5]), .IN1(pwm_pn[5]));

    // This contains the instantiation for OPAD04
    OPAD04 pad27_pwm6  (.PAD(pwm_out[6]), .IN1(pwm_pn[6]));

    // This contains the instantiation for OPAD04
    OPAD04 pad29_pwm7  (.PAD(pwm_out[7]), .IN1(pwm_pn[7]));
endmodule
