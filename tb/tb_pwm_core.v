// tb_pwm_core.v - Self-checking unit testbench for pwm_core
// Run: iverilog -g2005 -o sim/tb_pwm_core.vvp tb/tb_pwm_core.v rtl/pwm_core.v && vvp sim/tb_pwm_core.vvp
`timescale 1ns/1ps

module tb_pwm_core;
    reg         clk;              // PWM clock
    reg         rst_n;            // Active-low reset
    reg         enable;           // CTRL[0]
    reg  [7:0]  prescaler;        // PRESC
    reg  [63:0] duty_shadow;      // DUTY0..7
    wire [7:0]  pwm_out;          // DUT outputs
    wire        sync;             // DUT period pulse

    integer errors;               // Failed checks
    integer checks;               // Total checks
    integer cnt [0:7];            // High-cycle count per channel
    integer n, k, period;         // Loop helpers
    reg [7:0] duty [0:7];         // Duty table under test
    realtime last_edge;           // Time of the last rising clk edge

    // This contains the instantiation for pwm_core
    pwm_core dut (
        .clk(clk), .rst_n(rst_n), .enable(enable), .prescaler(prescaler),
        .duty_shadow(duty_shadow), .pwm_out(pwm_out), .sync(sync)
    );

    initial clk = 1'b0;                          // Clock starts low
    always #10 clk = ~clk;                       // 50 MHz
    always @(posedge clk) last_edge = $realtime; // Remember each rising edge

    // Registered outputs may only change right after a rising clk edge (no glitches)
    always @(pwm_out or sync) begin
        if (rst_n && ($realtime - last_edge) > 2.0) begin        // Changed mid-cycle
            errors = errors + 1;
            $display("FAIL output changed %0t ns after the clk edge (t=%0t)", $realtime - last_edge, $realtime);
        end
    end

    // Compare and count
    task check;
        input [255:0] name;                      // Label
        input integer got;                       // Observed value
        input integer exp;                       // Expected value
        begin
            checks = checks + 1;
            if (got !== exp) begin errors = errors + 1; $display("FAIL %0s: got %0d expected %0d", name, got, exp); end
            else $display("ok   %0s = %0d", name, got);
        end
    endtask

    // Load the duty table into the shadow bus
    task load_duties;
        begin
            for (k = 0; k < 8; k = k + 1) duty_shadow[k*8 +: 8] = duty[k];
        end
    endtask

    // Count high cycles per channel over one period that starts at a sync pulse
    task measure_period;
        input integer clocks;                    // Expected period length in clk cycles
        begin
            @(negedge clk); while (!sync) @(negedge clk);   // Align to a sync cycle
            for (k = 0; k < 8; k = k + 1) cnt[k] = 0;
            period = 0;
            repeat (clocks) begin                // One full period, sampled mid-cycle
                for (k = 0; k < 8; k = k + 1) cnt[k] = cnt[k] + pwm_out[k];
                period = period + 1;
                @(negedge clk);
                if (sync && period < clocks) begin
                    errors = errors + 1; $display("FAIL sync after %0d clocks, expected %0d", period, clocks);
                end
            end
            check("sync at end of period", sync, 1);
        end
    endtask

    initial begin
        errors = 0; checks = 0;
        rst_n = 1'b0; enable = 1'b0; prescaler = 8'd0; duty_shadow = 64'd0;
        duty[0] = 8'd0;   duty[1] = 8'd1;   duty[2] = 8'd64;  duty[3] = 8'd128;
        duty[4] = 8'd200; duty[5] = 8'd254; duty[6] = 8'd255; duty[7] = 8'd7;
        #55 rst_n = 1'b1;

        // 1. Reset / disabled: outputs low, no sync
        check("outputs after reset", pwm_out, 0);
        load_duties;
        repeat (20) @(negedge clk);
        check("outputs while disabled", pwm_out, 0);
        check("sync while disabled", sync, 0);

        // 2. PRESC=0: 256-clock period, high count = duty
        enable = 1'b1;
        measure_period(256);
        for (n = 0; n < 8; n = n + 1) check("PRESC=0 high count", cnt[n], duty[n]);

        // 3. sync aligned with phase 0 of the outputs: channels with duty > 0 are high
        check("pwm_out in the sync cycle", pwm_out, 8'b1111_1110);

        // 4. PRESC=3: 1024-clock period, high count = 4 x duty
        prescaler = 8'd3;
        measure_period(1024);                    // Settle on the new prescaler
        measure_period(1024);
        for (n = 0; n < 8; n = n + 1) check("PRESC=3 high count", cnt[n], 4 * duty[n]);

        // 5. Shadow update only at the period boundary
        prescaler = 8'd0;
        measure_period(256);
        @(negedge clk); while (!sync) @(negedge clk);
        repeat (40) @(negedge clk);              // Mid-period
        duty[2] = 8'd10; load_duties;            // Change channel 2 mid-period
        cnt[2] = 0; period = 40;
        while (!sync) begin cnt[2] = cnt[2] + pwm_out[2]; @(negedge clk); end
        check("ch2 old duty until wrap", cnt[2], 64 - 40);
        measure_period(256);
        check("new duty after wrap (ch2)", cnt[2], 10);

        // 6. Disable mid-period: outputs low one clk later, no more sync
        repeat (5) @(negedge clk);
        enable = 1'b0;
        @(negedge clk);                          // One registered stage
        @(negedge clk);
        check("outputs after disable", pwm_out, 0);
        n = 0; repeat (600) begin @(negedge clk); n = n + sync; end
        check("sync pulses while disabled", n, 0);

        // 7. Asynchronous reset mid-run
        enable = 1'b1; repeat (300) @(negedge clk);
        rst_n = 1'b0; #1;
        check("outputs during reset", pwm_out, 0);
        rst_n = 1'b1;

        $display("%s: %0d checks, %0d errors", errors ? "TESTS FAILED" : "ALL TESTS PASSED", checks, errors);
        $finish;
    end
endmodule
