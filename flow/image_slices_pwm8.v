// image_slices_pwm8.v - Small extracts of pwm_core and reg_bank, used only to draw readable gate-level schematics
// (flow/make_images.sh). The full modules are drawn too, but at gate level they are too dense to read.
// Each slice is the same logic as one part of the real module. Not part of the design or the flow.
`timescale 1ns/1ps

// One PWM channel from rtl/pwm_core.v: compare the phase counter with the channel's duty, then register it.
module pwm_channel_slice (
    input  wire       clk,
    input  wire       rst_n,
    input  wire       enable,      // CTRL[0]
    input  wire [7:0] phase,       // shared 8-bit phase counter
    input  wire [7:0] duty,        // this channel's active duty
    output reg        pwm          // registered output (pwm_out[ch])
);
    always @(posedge clk or negedge rst_n)
        if (!rst_n) pwm <= 1'b0;
        else        pwm <= enable && (phase < duty);
endmodule

// One duty register from rtl/reg_bank.v: written when wr_en pulses with its address (DUTY0 = 0x02).
module reg_byte_slice (
    input  wire       clk,
    input  wire       rst_n,
    input  wire       wr_en,
    input  wire [6:0] wr_addr,
    input  wire [7:0] wr_data,
    output reg  [7:0] q
);
    always @(posedge clk or negedge rst_n)
        if (!rst_n)                          q <= 8'd0;
        else if (wr_en && wr_addr == 7'h02)  q <= wr_data;
endmodule
