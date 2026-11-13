// scl_tie_cells.v - Simulation models for SCL C1D tie cells VDDCON / VSSCON (written for this project, not from SCL).
// SCL's c1d.v has no model for these two cells. Function and pin names come from c1d_core_*.lib:
//   VDDCON: pin TIEHI, function "1"      VSSCON: pin TIELO, function "0"
// Physically TIEHI / TIELO are metal1 straps to VDD / VSS (core_c1d.lef); the CDL has no devices.
`timescale 1ns/1ps

module VDDCON (TIEHI);
    output TIEHI;              // Constant logic 1
    assign TIEHI = 1'b1;
endmodule

module VSSCON (TIELO);
    output TIELO;              // Constant logic 0
    assign TIELO = 1'b0;
endmodule
