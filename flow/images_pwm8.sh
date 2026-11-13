# images_pwm8.sh - Config for flow/make_images.sh: the full image set of pwm8-spi in images/.
# Run: flow/make_images.sh flow/images_pwm8.sh
NAME="pwm8-spi"
SRC_ROOT="$PROJ"
OUT="$PROJ/images"
RTL=(rtl/spi_slave.v rtl/cdc_sync.v rtl/reset_sync.v rtl/reg_bank.v rtl/pwm_core.v rtl/pwm8_spi_top.v
     rtl/chip/pwm8_spi_core.v rtl/chip/pwm8_spi_chip.v)
LIBERTY="$PROJ/syn/c1d_core_typ_routable.lib"     # the cells synthesis may use (routing-LEF audit passed)
ABC_OPTS=""
HIER=(pwm8_spi_chip pwm8_spi_core pwm8_spi_top)
LEAF=(spi_slave cdc_sync reset_sync reg_bank pwm_core)
SLICES=(flow/image_slices_pwm8.v:pwm_channel_slice flow/image_slices_pwm8.v:reg_byte_slice)
GDS="submission/OS0097_pwm8-spi_13112026_v1.gds"
CORE_CELL="pwm8_spi_core"; ART_CELL="pwm8_monkey"; BLK="340,340,650,440"
DEFS=(floorplan_power:pnr/pwm8_spi_core/1_pdn.def placement:pnr/pwm8_spi_core/2_place.def
      clock_tree:pnr/pwm8_spi_core/3_cts.def routed:pnr/pwm8_spi_core/4_route.def)
NETLIST="pnr/pwm8_spi_core/pwm8_spi_core_rt.v"
