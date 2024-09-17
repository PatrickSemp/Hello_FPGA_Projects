set_device -family {SmartFusion2} -die {M2S010} -speed {-1}
read_vhdl -mode vhdl_2008 {D:\ESPE\TESIS\SW_LIBERO\PROGRAMAS\A_VERSIONES_OK\Prueba06_UART_BLK\hdl\DFF_Debouncing_Button.vhd}
read_vhdl -mode vhdl_2008 {D:\ESPE\TESIS\SW_LIBERO\PROGRAMAS\A_VERSIONES_OK\Prueba06_UART_BLK\hdl\clock_enable_debouncing_button.vhd}
read_vhdl -mode vhdl_2008 {D:\ESPE\TESIS\SW_LIBERO\PROGRAMAS\A_VERSIONES_OK\Prueba06_UART_BLK\hdl\Debouncing_Button_VHDL.vhd}
read_vhdl -mode vhdl_2008 {D:\ESPE\TESIS\SW_LIBERO\PROGRAMAS\A_VERSIONES_OK\Prueba06_UART_BLK\hdl\UART_TX_CTRL.vhd}
read_vhdl -mode vhdl_2008 {D:\ESPE\TESIS\SW_LIBERO\PROGRAMAS\A_VERSIONES_OK\Prueba06_UART_BLK\hdl\GPIO_Demo.vhd}
read_vhdl -mode vhdl_2008 {D:\ESPE\TESIS\SW_LIBERO\PROGRAMAS\A_VERSIONES_OK\Prueba06_UART_BLK\component\work\OSC_C0\OSC_C0_0\OSC_C0_OSC_C0_0_OSC.vhd}
read_vhdl -mode vhdl_2008 {D:\ESPE\TESIS\SW_LIBERO\PROGRAMAS\A_VERSIONES_OK\Prueba06_UART_BLK\component\work\OSC_C0\OSC_C0.vhd}
read_vhdl -mode vhdl_2008 {D:\ESPE\TESIS\SW_LIBERO\PROGRAMAS\A_VERSIONES_OK\Prueba06_UART_BLK\component\work\Top_SEND\Top_SEND.vhd}
set_top_level {Top_SEND}
map_netlist
check_constraints {D:\ESPE\TESIS\SW_LIBERO\PROGRAMAS\A_VERSIONES_OK\Prueba06_UART_BLK\constraint\synthesis_sdc_errors.log}
write_fdc {D:\ESPE\TESIS\SW_LIBERO\PROGRAMAS\A_VERSIONES_OK\Prueba06_UART_BLK\designer\Top_SEND\synthesis.fdc}
