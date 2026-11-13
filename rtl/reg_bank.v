// Register map: CTRL=0x00, PRESC=0x01, DUTY0..7=0x02..0x09, ID=0x0a.
// CTRL stores only bit 0 (PWM enable); bits 7:1 are reserved, ignore writes and read as 0.
`timescale 1ns/1ps

module reg_bank (
    input  wire        clk,         // Register clock
    input  wire        rst_n,       // Active-low reset (synchronised release, from reset_sync)
    input  wire [6:0]  wr_addr,     // Write address (held stable by the SPI side)
    input  wire [7:0]  wr_data,     // Write data (held stable by the SPI side)
    input  wire        wr_en,       // One-clk write strobe
    input  wire [6:0]  rd_addr,     // Read address from the SPI side
    output reg  [7:0]  rd_data,     // Selected register byte (combinational)
    output wire        pwm_en,      // CTRL[0]
    output wire [7:0]  prescaler,   // PRESC
    output wire [63:0] duty         // DUTY0..7, channel 0 in [7:0]
);
    reg       ctrl_en;              // CTRL[0]: PWM enable (the only stored CTRL bit)
    reg [7:0] presc_reg;            // PRESC
    reg [7:0] duty_reg [0:7];       // DUTY0..7
    integer   i;                    // Reset loop index
    genvar    g;                    // Duty packing index

    assign pwm_en    = ctrl_en;     // Enable to the PWM core
    assign prescaler = presc_reg;   // Prescaler to the PWM core

    // Pack the eight duty registers onto one bus
    generate for (g = 0; g < 8; g = g + 1) begin : pack_duty
        assign duty[g*8 +: 8] = duty_reg[g];   // Channel g in bits g*8+7 .. g*8
    end endgenerate

    // Register writes
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin                            // Reset: everything zero, PWM off
            ctrl_en   <= 1'b0;                       // PWM disabled
            presc_reg <= 8'd0;                       // Prescaler 0
            for (i = 0; i < 8; i = i + 1)            // All duties
                duty_reg[i] <= 8'd0;                 // Zero
        end else if (wr_en) begin                    // One SPI write committed
            case (wr_addr)                           // Decode the address
                7'h00: ctrl_en     <= wr_data[0];    // CTRL: bit 0 only
                7'h01: presc_reg   <= wr_data;       // PRESC
                7'h02: duty_reg[0] <= wr_data;       // DUTY0
                7'h03: duty_reg[1] <= wr_data;       // DUTY1
                7'h04: duty_reg[2] <= wr_data;       // DUTY2
                7'h05: duty_reg[3] <= wr_data;       // DUTY3
                7'h06: duty_reg[4] <= wr_data;       // DUTY4
                7'h07: duty_reg[5] <= wr_data;       // DUTY5
                7'h08: duty_reg[6] <= wr_data;       // DUTY6
                7'h09: duty_reg[7] <= wr_data;       // DUTY7
                default: ;                           // ID and unmapped locations are read-only
            endcase
        end
    end

    // Register reads (combinational mux, sampled by the SPI side)
    always @* begin
        case (rd_addr)                               // Decode the address
            7'h00: rd_data = {7'd0, ctrl_en};        // CTRL: reserved bits read 0
            7'h01: rd_data = presc_reg;              // PRESC
            7'h02: rd_data = duty_reg[0];            // DUTY0
            7'h03: rd_data = duty_reg[1];            // DUTY1
            7'h04: rd_data = duty_reg[2];            // DUTY2
            7'h05: rd_data = duty_reg[3];            // DUTY3
            7'h06: rd_data = duty_reg[4];            // DUTY4
            7'h07: rd_data = duty_reg[5];            // DUTY5
            7'h08: rd_data = duty_reg[6];            // DUTY6
            7'h09: rd_data = duty_reg[7];            // DUTY7
            7'h0a: rd_data = 8'ha5;                  // ID
            default: rd_data = 8'h00;                // Unmapped
        endcase
    end
endmodule
