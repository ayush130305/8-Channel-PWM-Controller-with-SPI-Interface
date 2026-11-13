// tb_pwm8_spi_top.v - Self-checking system testbench for pwm8_spi_top (SPI -> registers -> PWM)
// Run (fast clk, 50 MHz clk / 5 MHz sclk):
//   iverilog -g2005 -o sim/tb_top_fast.vvp tb/tb_pwm8_spi_top.v rtl/*.v && vvp sim/tb_top_fast.vvp
// Run (slow clk, 10 MHz clk / 5 MHz sclk):
//   iverilog -g2005 -Ptb_pwm8_spi_top.CLK_HALF=50 -o sim/tb_top_slow.vvp tb/tb_pwm8_spi_top.v rtl/*.v && vvp sim/tb_top_slow.vvp
// Run (spec sign-off clocks, 10 MHz clk / 2.5 MHz sclk):
//   iverilog -g2005 -Ptb_pwm8_spi_top.CLK_HALF=50 -Ptb_pwm8_spi_top.SCLK_HALF=200 -o sim/tb_top_spec.vvp tb/tb_pwm8_spi_top.v rtl/*.v && vvp sim/tb_top_spec.vvp
// Run on the chip top with pads (-DCHIP_TOP, needs SCL's c1d.v for OPAD04 / INVR05):
//   iverilog -g2005 -Ttyp -DCHIP_TOP -Ptb_pwm8_spi_top.CLK_HALF=50 -Ptb_pwm8_spi_top.SCLK_HALF=200 -o sim/tb_chip.vvp tb/tb_pwm8_spi_top.v rtl/*.v rtl/chip/*.v $C1D_V && vvp sim/tb_chip.vvp
// Run on the synthesised netlist (gate level: chip top + Yosys core netlist + c1d.v):
//   iverilog -g2005 -Ttyp -DCHIP_TOP -DGATE_LEVEL -Ptb_pwm8_spi_top.CLK_HALF=50 -Ptb_pwm8_spi_top.SCLK_HALF=200 -o sim/tb_gl.vvp tb/tb_pwm8_spi_top.v rtl/chip/pwm8_spi_chip.v syn/pwm8_core_netlist.v tb/models/scl_tie_cells.v $C1D_V && vvp sim/tb_gl.vvp
`timescale 1ns/1ps

module tb_pwm8_spi_top;
    parameter CLK_HALF  = 10;      // clk half period (ns)
    parameter SCLK_HALF = 100;     // sclk half period (ns)
    // Allowed delay (ns) from a clock edge to the output it causes, for the edge-alignment checks and for
    // sampling after an edge. 1 for RTL / zero-delay gate level; post-layout SDF runs pass a larger value
    // (flow/run_signoff.sh), still far inside the CLK and SCLK half periods.
    parameter real EDGE_TOL = 1.0;

    reg        sclk;               // SPI clock
    reg        cs_n;               // Chip select
    reg        mosi;               // Master out
    reg        clk;                // System clock
    reg        rst_n;              // Reset
    wire       miso;               // Slave out (always driven)
    wire [7:0] pwm_out;            // PWM outputs
    wire       sync;               // Period pulse

    integer errors;                // Failed checks
    integer checks;                // Total checks
    integer k, n, cnt0, cnt3, cnt7, clocks;   // Helpers
    reg [7:0] q;                   // Read result
    realtime last_fall;            // Last falling sclk edge
    realtime last_cs;              // Last cs_n change
    realtime last_clk;             // Last rising clk edge
    realtime max_miso_dly, max_rst_dly;   // Largest observed edge-to-output delays (reported at the end)

`ifdef CHIP_TOP
    // This contains the instantiation for pwm8_spi_chip
    pwm8_spi_chip dut (
        .sclk(sclk), .cs_n(cs_n), .mosi(mosi), .miso(miso),
        .clk(clk), .rst_n(rst_n), .pwm_out(pwm_out), .sync(sync)
    );
`ifdef GATE_LEVEL
    // Flattened Yosys netlist: the clk-domain reset is the synchronizer's 2nd flop output
    wire rst_clk_probe;                          // Plain name for the escaped netlist net
    assign rst_clk_probe = dut.u_core.\u_pwm.u_rst_sync.rst_ff2 ;
    `define RST_CLK rst_clk_probe
`else
    `define RST_CLK dut.u_core.u_pwm.rst_clk_n   // clk-domain reset inside the chip
`endif
`else
    // This contains the instantiation for pwm8_spi_top
    pwm8_spi_top dut (
        .sclk(sclk), .cs_n(cs_n), .mosi(mosi), .miso(miso),
        .clk(clk), .rst_n(rst_n), .pwm_out(pwm_out), .sync(sync)
    );
    `define RST_CLK dut.rst_clk_n                // clk-domain reset inside the core
`endif

`ifdef SDF_FILE
    // Post-layout: back-annotate the routed core's delays (flow/run_signoff.sh passes the file)
    initial $sdf_annotate(`SDF_FILE, dut.u_core);
`endif

    initial clk = 1'b0;                        // Free-running system clock
    always #(CLK_HALF) clk = ~clk;

    always @(negedge sclk) last_fall = $realtime;            // Mode 0: MISO may change here
    always @(cs_n) last_cs = $realtime;                      // ... or when cs_n changes
    initial begin max_miso_dly = 0; max_rst_dly = 0; end
    always @(miso) if (!cs_n && ($realtime - last_cs) > EDGE_TOL && ($realtime - last_fall) > max_miso_dly) max_miso_dly = $realtime - last_fall;
    always @(miso) if (!cs_n && ($realtime - last_fall) > EDGE_TOL && ($realtime - last_cs) > EDGE_TOL) begin
        errors = errors + 1; $display("FAIL miso changed away from a falling sclk edge (t=%0t)", $realtime);
    end
    always @(posedge clk) last_clk = $realtime;               // For the reset-release check
    always @(posedge `RST_CLK) if (($realtime - last_clk) > max_rst_dly) max_rst_dly = $realtime - last_clk;
    always @(posedge `RST_CLK) if (($realtime - last_clk) > EDGE_TOL) begin   // Release must follow a clk edge
        errors = errors + 1; $display("FAIL clk-domain reset released away from a clk edge (t=%0t)", $realtime);
    end

    task check;
        input [255:0] name;        // Label
        input integer got;         // Observed
        input integer exp;         // Expected
        begin
            checks = checks + 1;
            if (got !== exp) begin errors = errors + 1; $display("FAIL %0s: got %0h expected %0h", name, got, exp); end
            else $display("ok   %0s = %0h", name, got);
        end
    endtask

    // Shift one 16-bit frame (cs_n must already be low); returns the last 8 MISO bits
    task frame;
        input        rw;           // 1 = read
        input  [6:0] addr;         // Register address
        input  [7:0] data;         // Write data
        output [7:0] rdata;        // Read data
        reg [15:0] f; integer b;
        begin
            f = {rw, addr, data}; rdata = 8'd0;
            for (b = 15; b >= 0; b = b - 1) begin
                mosi = f[b]; #(SCLK_HALF); sclk = 1'b1;              // Master samples MISO on the rising edge
                if (b < 8) rdata = {rdata[6:0], miso};
                #(SCLK_HALF); sclk = 1'b0;
            end
        end
    endtask

    // One complete transaction with chip select, then the write-rate gap (>= 3 clk edges)
    task spi;
        input        rw;
        input  [6:0] addr;
        input  [7:0] data;
        output [7:0] rdata;
        begin
            cs_n = 1'b0; #(SCLK_HALF);
            frame(rw, addr, data, rdata);
            #(SCLK_HALF); cs_n = 1'b1;
            #(8 * CLK_HALF + 2 * SCLK_HALF);                         // 4 clk periods
        end
    endtask

    task wr; input [6:0] a; input [7:0] d; reg [7:0] t; begin spi(1'b0, a, d, t); end endtask
    task rdchk; input [255:0] name; input [6:0] a; input [7:0] e; reg [7:0] t; begin spi(1'b1, a, 8'h00, t); check(name, t, e); end endtask

    // Count high clocks of channels 0/3/7 over one period starting at a sync pulse
    task measure;
        begin
            @(negedge clk); while (!sync) @(negedge clk);
            cnt0 = 0; cnt3 = 0; cnt7 = 0; clocks = 0;
            repeat (1) begin
                cnt0 = cnt0 + pwm_out[0]; cnt3 = cnt3 + pwm_out[3]; cnt7 = cnt7 + pwm_out[7]; clocks = clocks + 1;
                @(negedge clk);
                while (!sync) begin
                    cnt0 = cnt0 + pwm_out[0]; cnt3 = cnt3 + pwm_out[3]; cnt7 = cnt7 + pwm_out[7]; clocks = clocks + 1;
                    @(negedge clk);
                end
            end
        end
    endtask

    initial begin
        errors = 0; checks = 0;
        sclk = 1'b0; cs_n = 1'b1; mosi = 1'b0; rst_n = 1'b0;
        $display("clk %0.1f MHz, sclk %0.1f MHz", 500.0 / CLK_HALF, 500.0 / SCLK_HALF);
        #(5 * CLK_HALF + 3) rst_n = 1'b1;                            // Released while cs_n is high
        #(10 * CLK_HALF);

        // 1. MISO is driven 0 while cs_n is high
        check("miso with cs_n high after reset", miso, 0);

        // 2. Fixed and unmapped reads
        rdchk("ID", 7'h0A, 8'hA5);
        check("miso back to 0 after a read (ID ends in 1)", miso, 0);
        rdchk("unmapped 0x55", 7'h55, 8'h00);
        rdchk("unmapped 0x7F", 7'h7F, 8'h00);

        // 3. Reset values
        for (k = 0; k < 10; k = k + 1) rdchk("reset value", k[6:0], 8'h00);

        // 4. Write / read back every R/W register
        wr(7'h00, 8'h00);                                            // Keep PWM disabled
        wr(7'h01, 8'h3C);
        for (k = 0; k < 8; k = k + 1) wr(7'h02 + k, 8'h11 * (k + 1));
        rdchk("PRESC", 7'h01, 8'h3C);
        for (k = 0; k < 8; k = k + 1) rdchk("DUTYn", 7'h02 + k, 8'h11 * (k + 1));

        // 5. Read-only / unmapped writes are ignored and disturb nothing
        wr(7'h0A, 8'h12); rdchk("ID after write", 7'h0A, 8'hA5);
        wr(7'h20, 8'hFF); rdchk("unmapped after write", 7'h20, 8'h00);
        rdchk("DUTY7 untouched", 7'h09, 8'h88);

        // 5b. CTRL reserved bits 7:1 ignore writes and read as 0
        wr(7'h00, 8'hFE); rdchk("CTRL after writing FE", 7'h00, 8'h00);
        check("PWM still off (bit 0 = 0)", pwm_out, 0);
        wr(7'h00, 8'hFF); rdchk("CTRL after writing FF", 7'h00, 8'h01);
        wr(7'h00, 8'h00); rdchk("CTRL after writing 00", 7'h00, 8'h00);

        // 6. Aborted frame (cs_n rises after 10 bits): no write
        cs_n = 1'b0; #(SCLK_HALF);
        begin : abort
            reg [15:0] f; integer b;
            f = {1'b0, 7'h02, 8'hEE};
            for (b = 15; b >= 6; b = b - 1) begin mosi = f[b]; #(SCLK_HALF); sclk = 1'b1; #(SCLK_HALF); sclk = 1'b0; end
        end
        #(SCLK_HALF); cs_n = 1'b1; #(8 * CLK_HALF);
        rdchk("DUTY0 after aborted frame", 7'h02, 8'h11);

        // 7. Back-to-back frames under one cs_n: write, then reads (frame counter wraps)
        cs_n = 1'b0; #(SCLK_HALF);
        frame(1'b0, 7'h03, 8'h5A, q);
        frame(1'b1, 7'h0A, 8'h00, q); check("b2b ID read", q, 8'hA5);
        frame(1'b1, 7'h03, 8'h00, q); check("b2b read of earlier write", q, 8'h5A);
        #(SCLK_HALF); cs_n = 1'b1; #(8 * CLK_HALF);

        // 8. PWM end to end: PRESC=0, DUTY0=64, DUTY3=200, DUTY7=255
        wr(7'h01, 8'h00);
        for (k = 0; k < 8; k = k + 1) wr(7'h02 + k, 8'h00);
        wr(7'h02, 8'd64); wr(7'h05, 8'd200); wr(7'h09, 8'd255);
        check("outputs while disabled", pwm_out, 0);
        wr(7'h00, 8'h01);                                            // Enable
        measure;
        check("period (clk)", clocks, 256);
        check("ch0 high (64)", cnt0, 64);
        check("ch3 high (200)", cnt3, 200);
        check("ch7 high (255)", cnt7, 255);
        check("ch1 output (duty 0)", pwm_out[1], 0);

        // 9. Duty change through SPI lands at the next period boundary
        @(negedge clk); while (!sync) @(negedge clk);
        wr(7'h02, 8'd16);                                            // Write during a period
        measure;                                                     // First full period after the write
        n = cnt0;
        measure;
        check("ch0 after duty write (16)", cnt0, 16);
        check("ch0 never between old/new", (n == 64 || n == 16), 1);

        // 10. PRESC=1 doubles the period
        wr(7'h01, 8'd1);
        measure; measure;
        check("period with PRESC=1", clocks, 512);
        check("ch0 high with PRESC=1", cnt0, 32);

        // 11. Disable through SPI: outputs low, no sync
        wr(7'h00, 8'h00);
        #(4 * CLK_HALF);
        check("outputs after disable", pwm_out, 0);
        n = 0; repeat (1200) begin @(negedge clk); n = n + sync; end
        check("sync while disabled", n, 0);

        // 12. Asynchronous reset mid-run: immediate clear, synchronised release, chip usable after
        wr(7'h00, 8'h01); measure;                                   // PWM running again
        #(CLK_HALF / 2 + 3); rst_n = 1'b0; #(EDGE_TOL);              // Assert away from a clk edge
        check("pwm_out cleared at once by reset", pwm_out, 0);
        check("clk-domain reset asserted at once", `RST_CLK, 0);
        #(3 * CLK_HALF + 7); rst_n = 1'b1;                           // Release away from a clk edge
        @(posedge clk); #(EDGE_TOL); check("still in reset after 1 clk edge", `RST_CLK, 0);
        @(posedge clk); #(EDGE_TOL); check("out of reset after 2 clk edges", `RST_CLK, 1);
        #(4 * CLK_HALF);
        rdchk("CTRL after reset", 7'h00, 8'h00);
        rdchk("DUTY0 after reset", 7'h02, 8'h00);
        rdchk("ID after reset", 7'h0A, 8'hA5);
        wr(7'h04, 8'h3C); rdchk("write works after reset", 7'h04, 8'h3C);

        $display("Largest delays seen: sclk fall -> miso %0.2f ns, clk -> clk-domain reset release %0.2f ns (tolerance %0.1f ns)",
                 max_miso_dly, max_rst_dly, EDGE_TOL);
        $display("%s: %0d checks, %0d errors", errors ? "TESTS FAILED" : "ALL TESTS PASSED", checks, errors);
        $finish;
    end
endmodule
