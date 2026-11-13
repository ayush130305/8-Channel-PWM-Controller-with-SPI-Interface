// Reset synchronizer: asynchronous assertion, synchronous release.
// rst_n low clears both flops at once (rst_sync_n goes low immediately); after rst_n rises,
// rst_sync_n goes high on the second rising clk edge, so every clk-domain flop leaves reset
// in the same cycle.
`timescale 1ns/1ps

module reset_sync (
    input  wire clk,         // Clock of the domain being reset
    input  wire rst_n,       // Asynchronous active-low reset from the pad
    output wire rst_sync_n   // Active-low reset with synchronised release
);
    (* ASYNC_REG = "TRUE" *) reg rst_ff1;    // First stage (may go metastable on release)
    (* ASYNC_REG = "TRUE" *) reg rst_ff2;    // Second stage (clean)

    // Two-flop shift of a constant 1, cleared asynchronously by rst_n
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin                    // Reset asserted
            rst_ff1 <= 1'b0;                 // Clear immediately
            rst_ff2 <= 1'b0;                 // Clear immediately
        end else begin                       // Reset released
            rst_ff1 <= 1'b1;                 // Shift in a 1
            rst_ff2 <= rst_ff1;              // Second stage
        end
    end

    assign rst_sync_n = rst_ff2;             // Synchronised reset to the domain
endmodule
