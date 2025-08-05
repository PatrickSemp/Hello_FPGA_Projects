new_project \
         -name {TMR_3PS} \
         -location {D:\ESPE\TESIS\SW_LIBERO\PROGRAMAS\B_PRUEBAS\Prueba37_16KB_TMR04_DT2\designer\TMR_3PS\TMR_3PS_fp} \
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
