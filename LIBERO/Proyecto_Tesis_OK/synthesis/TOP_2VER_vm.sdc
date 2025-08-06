# Written by Synplify Pro version map202209actsp2, Build 145R. Synopsys Run ID: sid1709240098 
# Top Level Design Parameters 

# Clocks 
create_clock -period 10.000 -waveform {0.000 5.000} -name {MDDR_Demo_sb_sb_CCC_0_FCCC|GL2_net_inferred_clock} [get_pins {WR_MDDR/MDDR_Demo_sb_sb_0/CCC_0/CCC_INST/GL2}] 
create_clock -period 10.000 -waveform {0.000 5.000} -name {MDDR_Demo_sb_sb_MSS|FIC_2_APB_M_PCLK_inferred_clock} [get_pins {WR_MDDR/MDDR_Demo_sb_sb_0/MDDR_Demo_sb_sb_MSS_0/MSS_ADLIB_INST/CLK_CONFIG_APB}] 
create_clock -period 10.000 -waveform {0.000 5.000} -name {MDDR_Demo_sb_sb_CCC_0_FCCC|GL0_net_inferred_clock} [get_pins {WR_MDDR/MDDR_Demo_sb_sb_0/CCC_0/CCC_INST/GL0}] 
create_clock -period 10.000 -waveform {0.000 5.000} -name {DATA_HANDLE_FSM_V2_32_32_32_9|un1_paddr_1_inferred_clock} [get_pins {MANEJO_SOLICITUDES/DATA_HANDLE_FSM_V2_0/un1_paddr_1/Y}] 
create_clock -period 10.000 -waveform {0.000 5.000} -name {DATA_HANDLE_FSM_V2_32_32_32_9|un1_paddr_2_inferred_clock} [get_pins {MANEJO_SOLICITUDES/DATA_HANDLE_FSM_V2_0/un1_paddr_2/Y}] 
create_clock -period 10.000 -waveform {0.000 5.000} -name {DATA_HANDLE_FSM_V2_32_32_32_9|un1_paddr_3_inferred_clock} [get_pins {MANEJO_SOLICITUDES/DATA_HANDLE_FSM_V2_0/un1_paddr_3/Y}] 
create_clock -period 10.000 -waveform {0.000 5.000} -name {DATA_HANDLE_FSM_V2_32_32_32_9|un1_fsm_2_inferred_clock} [get_pins {MANEJO_SOLICITUDES/DATA_HANDLE_FSM_V2_0/un1_fsm_2/Y}] 

# Virtual Clocks 

# Generated Clocks 

# Paths Between Clocks 

# Multicycle Constraints 

# Point-to-point Delay Constraints 

# False Path Constraints 

# Output Load Constraints 

# Driving Cell Constraints 

# Input Delay Constraints 

# Output Delay Constraints 

# Wire Loads 

# Other Constraints 

# syn_hier Attributes 

# set_case Attributes 

# Clock Delay Constraints 
set Inferred_clkgroup_0 [list MDDR_Demo_sb_sb_CCC_0_FCCC|GL2_net_inferred_clock]
set Inferred_clkgroup_1 [list MDDR_Demo_sb_sb_MSS|FIC_2_APB_M_PCLK_inferred_clock]
set Inferred_clkgroup_2 [list MDDR_Demo_sb_sb_CCC_0_FCCC|GL0_net_inferred_clock]
set Inferred_clkgroup_4 [list DATA_HANDLE_FSM_V2_32_32_32_9|un1_paddr_1_inferred_clock]
set Inferred_clkgroup_5 [list DATA_HANDLE_FSM_V2_32_32_32_9|un1_paddr_2_inferred_clock]
set Inferred_clkgroup_6 [list DATA_HANDLE_FSM_V2_32_32_32_9|un1_paddr_3_inferred_clock]
set Inferred_clkgroup_7 [list DATA_HANDLE_FSM_V2_32_32_32_9|un1_fsm_2_inferred_clock]
set_clock_groups -asynchronous -group $Inferred_clkgroup_0
set_clock_groups -asynchronous -group $Inferred_clkgroup_1
set_clock_groups -asynchronous -group $Inferred_clkgroup_2
set_clock_groups -asynchronous -group $Inferred_clkgroup_4
set_clock_groups -asynchronous -group $Inferred_clkgroup_5
set_clock_groups -asynchronous -group $Inferred_clkgroup_6
set_clock_groups -asynchronous -group $Inferred_clkgroup_7

set_clock_groups -asynchronous -group [get_clocks {MDDR_Demo_sb_sb_CCC_0_FCCC|GL2_net_inferred_clock}]
set_clock_groups -asynchronous -group [get_clocks {MDDR_Demo_sb_sb_MSS|FIC_2_APB_M_PCLK_inferred_clock}]
set_clock_groups -asynchronous -group [get_clocks {MDDR_Demo_sb_sb_CCC_0_FCCC|GL0_net_inferred_clock}]
set_clock_groups -asynchronous -group [get_clocks {MDDR_Demo_sb_sb_FABOSC_0_OSC|RCOSC_25_50MHZ_CCC_inferred_clock}]
set_clock_groups -asynchronous -group [get_clocks {DATA_HANDLE_FSM_V2_32_32_32_9|un1_paddr_1_inferred_clock}]
set_clock_groups -asynchronous -group [get_clocks {DATA_HANDLE_FSM_V2_32_32_32_9|un1_paddr_2_inferred_clock}]
set_clock_groups -asynchronous -group [get_clocks {DATA_HANDLE_FSM_V2_32_32_32_9|un1_paddr_3_inferred_clock}]
set_clock_groups -asynchronous -group [get_clocks {DATA_HANDLE_FSM_V2_32_32_32_9|un1_fsm_2_inferred_clock}]

# syn_mode Attributes 

# Cells 

# Port DRC Rules 

# Input Transition Constraints 

# Unused constraints (intentionally commented out) 


# Non-forward-annotatable constraints (intentionally commented out) 

# Block Path constraints 

