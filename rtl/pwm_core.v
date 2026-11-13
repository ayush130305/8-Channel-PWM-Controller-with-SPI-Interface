// Eight channels, 8-bit phase counter. PRESC=N advances the phase once every
// N+1 clk cycles (PRESC=0 advances every cycle). SYNC is one clk wide per wrap.
// pwm_out and sync are registered (glitch-free at the pads): both lag the phase
// counter by one clk, and sync is high in the same cycle that pwm_out shows phase 0.
`timescale 1ns/1ps

module pwm_core (
    input  wire        clk,          // Register-bank and PWM clock
    input  wire        rst_n,        // Asynchronous active-low reset
    input  wire        enable,       // CTRL[0]: 1 = run, 0 = hold phase at 0, outputs low
    input  wire [7:0]  prescaler,    // PRESC register
    input  wire [63:0] duty_shadow,  // DUTY0..7 from the register bank, channel 0 in [7:0]
    output reg  [7:0]  pwm_out,      // Registered PWM outputs, channel 0 in bit 0
    output reg         sync          // Registered one-clk pulse at each period start
);
    reg  [7:0]  prescale_count;      // Clocks since the last phase step
    reg  [7:0]  phase;               // 8-bit phase counter
    reg  [63:0] duty_active;         // Duty values in use this period
    reg         wrap;                // Phase wrapped 255 -> 0 on the last edge (sync, one stage early)
    reg  [7:0]  pwm_next;            // Comparator result for the current phase
    integer     ch;                  // Channel loop index

    // Phase counter, prescaler and period-boundary duty update
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin                                // Chip reset
            prescale_count <= 8'd0;                      // Restart prescaler
            phase          <= 8'd0;                      // Phase 0
            duty_active    <= 64'd0;                     // All channels off
            wrap           <= 1'b0;                      // No wrap yet
        end else begin                                   // Normal operation
            wrap <= 1'b0;                                // Default: no wrap this cycle
            if (!enable) begin                           // Disabled
                prescale_count <= 8'd0;                  // Hold prescaler
                phase          <= 8'd0;                  // Hold phase at 0
                duty_active    <= duty_shadow;           // Follow the shadow values
            end else if (prescale_count >= prescaler) begin  // Time for a phase step
                prescale_count <= 8'd0;                  // Restart prescaler
                if (phase == 8'hff) begin                // End of period
                    phase       <= 8'd0;                 // Wrap to 0
                    duty_active <= duty_shadow;          // Take new duties together
                    wrap        <= 1'b1;                 // Period boundary
                end else begin                           // Inside the period
                    phase <= phase + 8'd1;               // Next phase
                end
            end else begin                               // Between phase steps
                prescale_count <= prescale_count + 8'd1; // Count clocks
            end
        end
    end

    // Comparators: channel is high while phase < its duty (duty 0 = always low)
    always @* begin
        for (ch = 0; ch < 8; ch = ch + 1)                  // Each channel
            pwm_next[ch] = enable && (phase < duty_active[ch*8 +: 8]);  // Compare
    end

    // Output registers: no comparator glitches reach the pads
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin                                // Chip reset
            pwm_out <= 8'd0;                             // Outputs low
            sync    <= 1'b0;                             // No pulse
        end else begin                                   // Every clk
            pwm_out <= pwm_next;                         // Register comparator outputs
            sync    <= wrap & enable;                    // Aligned with the phase-0 output
        end
    end
endmodule
