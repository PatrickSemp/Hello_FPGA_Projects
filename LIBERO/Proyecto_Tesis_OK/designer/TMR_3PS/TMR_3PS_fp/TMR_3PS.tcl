open_project -project {D:\ESPE\TESIS\SW_LIBERO\PROGRAMAS\A_VERSIONES_OK\Proyecto_Tesis_OK\designer\TMR_3PS\TMR_3PS_fp\TMR_3PS.pro}\
         -connect_programmers {FALSE}
load_programming_data \
    -name {M2S010} \
    -fpga {D:\ESPE\TESIS\SW_LIBERO\PROGRAMAS\A_VERSIONES_OK\Proyecto_Tesis_OK\designer\TMR_3PS\TMR_3PS.map} \
    -header {D:\ESPE\TESIS\SW_LIBERO\PROGRAMAS\A_VERSIONES_OK\Proyecto_Tesis_OK\designer\TMR_3PS\TMR_3PS.hdr} \
    -envm {D:\ESPE\TESIS\SW_LIBERO\PROGRAMAS\A_VERSIONES_OK\Proyecto_Tesis_OK\designer\TMR_3PS\TMR_3PS.efc} \
    -spm {D:\ESPE\TESIS\SW_LIBERO\PROGRAMAS\A_VERSIONES_OK\Proyecto_Tesis_OK\designer\TMR_3PS\TMR_3PS.spm} \
    -dca {D:\ESPE\TESIS\SW_LIBERO\PROGRAMAS\A_VERSIONES_OK\Proyecto_Tesis_OK\designer\TMR_3PS\TMR_3PS.dca}
export_single_ppd \
    -name {M2S010} \
    -file {D:\ESPE\TESIS\SW_LIBERO\PROGRAMAS\A_VERSIONES_OK\Proyecto_Tesis_OK\designer\TMR_3PS\TMR_3PS.ppd}

save_project
close_project
