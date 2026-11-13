# sta_pre.tcl - Pre-layout static timing of the synthesised pwm8_spi_core (ideal clocks, no wires yet)
# Run in the OpenLane container with OpenSTA (sta), once per corner (see docs/FLOW_LOG.md, Lesson 4):
#   LIB=<c1d_core_{min,typ,max}.lib>  CORNER=<min|typ|max>  sta -no_init -no_splash -exit sta/sta_pre.tcl
set CORNER $::env(CORNER)
read_liberty $::env(LIB)                          ;# SCL C1D cell timing for this corner
read_verilog syn/pwm8_core_netlist.v              ;# Gate netlist from Yosys
link_design pwm8_spi_core                         ;# Top of the P&R block
read_sdc syn/pwm8_core.sdc                        ;# Lesson 3 constraints

# Full reports
report_checks -path_delay max -group_count 3 -format full -digits 3 > sta/pre_${CORNER}_setup.rpt
report_checks -path_delay min -group_count 3 -format full -digits 3 > sta/pre_${CORNER}_hold.rpt
report_check_types -max_slew -max_capacitance -max_fanout -violators   > sta/pre_${CORNER}_drv.rpt
report_checks -unconstrained -path_delay max -group_count 1       > sta/pre_${CORNER}_unconstrained.rpt

# One-line summary (worst over both clocks)
puts "STA-PRE $CORNER: WNS setup [format %.3f [sta::worst_slack -max]] ns, WNS hold [format %.3f [sta::worst_slack -min]] ns, TNS [format %.3f [sta::total_negative_slack -max]] ns"
