quietly set ACTELLIBNAME SmartFusion2
quietly set PROJECT_DIR "D:/ESPE/TESIS/SW_LIBERO/PROGRAMAS/Prueba06_UART"

if {[file exists presynth/_info]} {
   echo "INFO: Simulation library presynth already exists"
} else {
   file delete -force presynth 
   vlib presynth
}
vmap presynth presynth
vmap SmartFusion2 "C:/Microchip/Libero_SoC_v2023.2/Designer/lib/modelsimpro/precompiled/vlog/smartfusion2"
if {[file exists COREUART_LIB/_info]} {
   echo "INFO: Simulation library COREUART_LIB already exists"
} else {
   file delete -force COREUART_LIB 
   vlib COREUART_LIB
}
vmap COREUART_LIB "COREUART_LIB"

vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/DFF_Debouncing_Button.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/clock_enable_debouncing_button.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/Debouncing_Button_VHDL.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/UART_TX_CTRL.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/GPIO_Demo.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/component/work/OSC_C0/OSC_C0_0/OSC_C0_OSC_C0_0_OSC.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/component/work/OSC_C0/OSC_C0.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/component/work/Top_SEND/Top_SEND.vhd"
vcom -2008 -explicit  -work COREUART_LIB "${PROJECT_DIR}/component/work/COREUART_C0/COREUART_C0_0/rtl/vhdl/core/components.vhd"
vcom -2008 -explicit  -work COREUART_LIB "${PROJECT_DIR}/component/work/COREUART_C0/COREUART_C0_0/rtl/vhdl/core/coreuart_pkg.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/stimulus/Send_UART_TB.vhd"

vsim -L SmartFusion2 -L presynth -L COREUART_LIB  -t 1fs presynth.Send_UART_TB
add wave /Send_UART_TB/*
run 1000ns
