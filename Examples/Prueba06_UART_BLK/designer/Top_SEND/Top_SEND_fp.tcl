new_project \
         -name {Top_SEND} \
         -location {D:\ESPE\TESIS\SW_LIBERO\PROGRAMAS\Prueba06_UART\designer\Top_SEND\Top_SEND_fp} \
         -mode {chain} \
         -connect_programmers {FALSE}
add_actel_device \
         -device {M2S010} \
         -name {M2S010}
enable_device \
         -name {M2S010} \
         -enable {TRUE}
save_project
close_project
