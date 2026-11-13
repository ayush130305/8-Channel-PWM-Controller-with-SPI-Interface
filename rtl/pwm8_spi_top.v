// pwm8_spi_top - SPI-controlled 8-channel 8-bit PWM (core level, no pads)
// MISO is always driven (plain OPAD04 output on the chip, 0 while cs_n is high).
// The clk domain uses a synchronised reset (reset_sync); the SPI domain uses rst_n directly.
`timescale 1ns/1ps

module pwm8_spi_top (
    input  wire       sclk,      // SPI clock, mode 0
    input  wire       cs_n,      // Active-low chip select
    input  wire       mosi,      // SPI data from the master
    output wire       miso,      // SPI data to the master
    input  wire       clk,       // Register-bank and PWM clock
    input  wire       rst_n,     // Asynchronous active-low reset
    output wire [7:0] pwm_out,   // PWM outputs, channel 0 in bit 0 (registered)
    output wire       sync       // One-clk pulse at each PWM period start (registered)
);
    wire [7:0]  rd_data;          // Register byte selected by rd_addr
    wire [6:0]  rd_addr;          // Read address from the SPI side
    wire [6:0]  wr_addr;          // Write address from the SPI side (held after the frame)
    wire [7:0]  wr_data;          // Write data from the SPI side (held after the frame)
    wire        wr_toggle;        // Flips once per completed write (sclk domain)
    wire        wr_toggle_sync;   // wr_toggle synchronised to clk
    reg         wr_toggle_seen;   // Last synchronised toggle value
    wire        wr_en;            // One-clk write strobe in the clk domain
    wire        pwm_en;           // CTRL[0]
    wire [7:0]  prescaler;        // PRESC register
    wire [63:0] duty;             // DUTY0..7, channel 0 in [7:0]
    wire        rst_clk_n;        // clk-domain reset: async assert, release synchronised to clk

    // This toggle CDC captures one outstanding write at a time. The SPI
    // master must leave at least three clk rising edges between completed
    // write frames; use a queued async FIFO if the system cannot guarantee it.
    assign wr_en = wr_toggle_sync ^ wr_toggle_seen;   // Toggle edge = one new write

    // This contains the instantiation for reset_sync
    reset_sync u_rst_sync (
        .clk(clk), .rst_n(rst_n), .rst_sync_n(rst_clk_n)
    );

    // This contains the instantiation for spi_slave
    spi_slave u_spi (
        .sclk(sclk), .cs_n(cs_n), .rst_n(rst_n), .mosi(mosi),
        .rd_data(rd_data), .miso(miso), .rd_addr(rd_addr),
        .wr_addr(wr_addr), .wr_data(wr_data), .wr_toggle(wr_toggle)
    );

    // This contains the instantiation for cdc_sync
    cdc_sync u_wr_toggle_sync (
        .clk(clk), .rst_n(rst_clk_n), .async_in(wr_toggle), .sync_out(wr_toggle_sync)
    );

    // Remember the synchronised toggle to detect each change
    always @(posedge clk or negedge rst_clk_n) begin
        if (!rst_clk_n) wr_toggle_seen <= 1'b0;              // Reset: no pending write
        else        wr_toggle_seen <= wr_toggle_sync;    // Follow the synchronised toggle
    end

    // This contains the instantiation for reg_bank
    reg_bank u_reg_bank (
        .clk(clk), .rst_n(rst_clk_n), .wr_addr(wr_addr), .wr_data(wr_data),
        .wr_en(wr_en), .rd_addr(rd_addr), .rd_data(rd_data),
        .pwm_en(pwm_en), .prescaler(prescaler), .duty(duty)
    );

    // This contains the instantiation for pwm_core
    pwm_core u_pwm_core (
        .clk(clk), .rst_n(rst_clk_n), .enable(pwm_en), .prescaler(prescaler),
        .duty_shadow(duty), .pwm_out(pwm_out), .sync(sync)
    );
endmodule
