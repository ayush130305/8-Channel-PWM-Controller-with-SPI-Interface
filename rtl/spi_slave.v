// SPI mode 0, 16-bit frames: R/W (1=read), 7-bit address, 8-bit data.
// MISO is always driven (plain output pad, no high-Z): it is 0 while cs_n is high,
// during the first eight clocks of a frame and during write frames.
`timescale 1ns/1ps

module spi_slave (
    input  wire       sclk,       // SPI clock (mode 0)
    input  wire       cs_n,       // Active-low chip select
    input  wire       rst_n,      // Asynchronous active-low reset
    input  wire       mosi,       // Serial data from the master
    input  wire [7:0] rd_data,    // Selected register byte from the register bank
    output wire       miso,       // Serial data to the master
    output wire [6:0] rd_addr,    // Read address, valid after the address byte
    output reg  [6:0] wr_addr,    // Write address of the last completed write frame
    output reg  [7:0] wr_data,    // Write data of the last completed write frame
    output reg        wr_toggle   // Flips once per completed write frame (to the clk domain)
);
    reg [3:0]  bit_cnt;           // Rising-edge count within the 16-bit frame
    reg [14:0] shift_in;          // First 15 bits of the frame (bit 16 is taken from mosi)
    reg [7:0]  shift_out;         // Read data shifted out MSB first

    wire frame_end;               // Sixteenth rising edge of a frame
    wire wr_frame;                // Current frame is a write (R/W = 0)

    assign frame_end = (bit_cnt == 4'd15);   // Last bit of the frame is on mosi now
    assign wr_frame  = ~shift_in[14];        // R/W bit, first bit received
    assign rd_addr   = shift_in[6:0];        // Address byte is complete after 8 rising edges
    assign miso      = shift_out[7];         // MSB of the read shifter (cleared while cs_n is high)

    // Frame counter and input shifter: cleared whenever cs_n is high
    always @(posedge sclk or posedge cs_n or negedge rst_n) begin
        if (!rst_n) begin                        // Chip reset
            bit_cnt  <= 4'd0;                    // Start of frame
            shift_in <= 15'd0;                   // Empty shifter
        end else if (cs_n) begin                 // Deselected: restart the frame
            bit_cnt  <= 4'd0;                    // Start of frame
            shift_in <= 15'd0;                   // Empty shifter
        end else begin                           // Selected: sample mosi
            shift_in <= {shift_in[13:0], mosi};  // Shift in MSB first
            bit_cnt  <= bit_cnt + 4'd1;          // Wraps to 0 after 16 bits
        end
    end

    // Write capture: reset only by rst_n, so these hold their value when cs_n rises
    always @(posedge sclk or negedge rst_n) begin
        if (!rst_n) begin                        // Chip reset
            wr_addr   <= 7'd0;                   // No write yet
            wr_data   <= 8'd0;                   // No write yet
            wr_toggle <= 1'b0;                   // Toggle starts low
        end else if (frame_end && wr_frame) begin    // Completed write frame (bit_cnt is 0 while cs_n is high)
            wr_addr   <= shift_in[13:7];         // Address bits 14:8 of the frame
            wr_data   <= {shift_in[6:0], mosi};  // Data bits 7:0 of the frame
            wr_toggle <= ~wr_toggle;             // Signal one new write to the clk domain
        end
    end

    // Mode 0 changes MISO on falling edges, after sampling the address byte
    always @(negedge sclk or posedge cs_n or negedge rst_n) begin
        if (!rst_n) begin                        // Chip reset
            shift_out <= 8'd0;                   // MISO low
        end else if (cs_n) begin                 // Deselected
            shift_out <= 8'd0;                   // MISO low for the next frame
        end else if (bit_cnt == 4'd8) begin      // Address byte just received
            shift_out <= shift_in[7] ? rd_data : 8'd0;  // Load the byte for a read frame
        end else if (bit_cnt > 4'd8) begin       // Data phase
            shift_out <= {shift_out[6:0], 1'b0}; // Next bit out
        end
    end
endmodule
