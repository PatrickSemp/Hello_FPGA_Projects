set_component MDDR_Demo_sb_sb_MSS
# Microsemi Corp.
# Date: 2024-Feb-01 10:18:02
#

create_clock -period 25 [ get_pins { MSS_ADLIB_INST/CLK_CONFIG_APB } ]
set_false_path -ignore_errors -through [ get_pins { MSS_ADLIB_INST/CONFIG_PRESET_N } ]
