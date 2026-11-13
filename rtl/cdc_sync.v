// Two-flop synchronizer for a single-bit control signal.
`timescale 1ns/1ps

module cdc_sync (
    input  wire clk,
    input  wire rst_n,
    input  wire async_in,
    output wire sync_out
);
    (* ASYNC_REG = "TRUE" *) reg sync_ff1;
    (* ASYNC_REG = "TRUE" *) reg sync_ff2;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            sync_ff1 <= 1'b0;
            sync_ff2 <= 1'b0;
        end else begin
            sync_ff1 <= async_in;
            sync_ff2 <= sync_ff1;
        end
    end

    assign sync_out = sync_ff2;
endmodule
