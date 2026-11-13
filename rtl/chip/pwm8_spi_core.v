// pwm8_spi_core.v - Place-and-route block for pwm8_spi: the design plus output drivers for OPAD04 pads.
// OPAD04 output pads invert (PAD = ~IN1), so every output leaves the core inverted (_pn) through an
// INVR05 driver, and the pad restores the true level. INVR05 (max_cap 1.488 pF) drives the 0.79-1.05 pF
// OPAD04 input. This is the module placed and routed inside the 5 mm pad frame.
// Simulate with SCL's c1d.v (INVR05 model).
`timescale 1ns/1ps

module pwm8_spi_core (
    input  wire       clk,         // PWM / register clock (from IPAD00, PAD2)
    input  wire       rst_n,       // Asynchronous active-low reset (from IPAD00, PAD4)
    input  wire       sclk,        // SPI clock (from IPAD00, PAD6)
    input  wire       cs_n,        // SPI chip select (from IPAD00, PAD8)
    input  wire       mosi,        // SPI data in (from IPAD00, PAD10)
    output wire       miso_pn,     // Inverted MISO, to OPAD04 IN1 (PAD1)
    output wire       sync_pn,     // Inverted sync, to OPAD04 IN1 (PAD3)
    output wire [7:0] pwm_pn       // Inverted PWM outputs, to OPAD04 IN1 (PAD13..PAD21, PAD25..PAD29)
);
    wire       miso;               // True-polarity MISO from the design
    wire       sync;               // True-polarity sync from the design
    wire [7:0] pwm_out;            // True-polarity PWM outputs from the design
    genvar     g;                  // Driver loop index

    // This contains the instantiation for pwm8_spi_top
    pwm8_spi_top u_pwm (
        .sclk(sclk), .cs_n(cs_n), .mosi(mosi), .miso(miso),
        .clk(clk), .rst_n(rst_n), .pwm_out(pwm_out), .sync(sync)
    );

    // This contains the instantiation for INVR05
    INVR05 u_drv_miso (.IN1(miso), .OUT1(miso_pn));

    // This contains the instantiation for INVR05
    INVR05 u_drv_sync (.IN1(sync), .OUT1(sync_pn));

    // One INVR05 per PWM channel
    generate for (g = 0; g < 8; g = g + 1) begin : drv_pwm
        // This contains the instantiation for INVR05
        INVR05 u_drv (.IN1(pwm_out[g]), .OUT1(pwm_pn[g]));
    end endgenerate
endmodule
