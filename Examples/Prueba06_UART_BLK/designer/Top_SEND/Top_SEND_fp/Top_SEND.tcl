open_project -project {D:\ESPE\TESIS\SW_LIBERO\PROGRAMAS\A_VERSIONES_OK\Prueba06_UART_BLK\designer\Top_SEND\Top_SEND_fp\Top_SEND.pro}\
         -connect_programmers {FALSE}
load_programming_data \
    -name {M2S010} \
    -fpga {D:\ESPE\TESIS\SW_LIBERO\PROGRAMAS\A_VERSIONES_OK\Prueba06_UART_BLK\designer\Top_SEND\Top_SEND.map} \
    -header {D:\ESPE\TESIS\SW_LIBERO\PROGRAMAS\A_VERSIONES_OK\Prueba06_UART_BLK\designer\Top_SEND\Top_SEND.hdr} \
    -spm {D:\ESPE\TESIS\SW_LIBERO\PROGRAMAS\A_VERSIONES_OK\Prueba06_UART_BLK\designer\Top_SEND\Top_SEND.spm} \
    -dca {D:\ESPE\TESIS\SW_LIBERO\PROGRAMAS\A_VERSIONES_OK\Prueba06_UART_BLK\designer\Top_SEND\Top_SEND.dca}
export_single_dat \
    -name {M2S010} \
    -file {D:\ESPE\TESIS\SW_LIBERO\PROGRAMAS\A_VERSIONES_OK\Prueba06_UART_BLK\designer\Top_SEND\export\Top_SEND02.dat} \
    -secured

save_project
close_project
