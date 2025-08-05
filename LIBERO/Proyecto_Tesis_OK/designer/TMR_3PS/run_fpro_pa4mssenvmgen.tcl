set_device \
    -fam SmartFusion2 \
    -die PA4M1000_N \
    -pkg vf256
set_input_cfg \
	-path {D:/ESPE/TESIS/SW_LIBERO/PROGRAMAS/A_VERSIONES_OK/Proyecto_Tesis_OK/component/work/MDDR_Demo_sb_sb_MSS/ENVM.cfg}
set_output_efc \
    -path {D:\ESPE\TESIS\SW_LIBERO\PROGRAMAS\A_VERSIONES_OK\Proyecto_Tesis_OK\designer\TMR_3PS\TMR_3PS.efc}
set_proj_dir \
    -path {D:\ESPE\TESIS\SW_LIBERO\PROGRAMAS\A_VERSIONES_OK\Proyecto_Tesis_OK}
set_is_relative_path \
    -value {FALSE}
set_root_path_dir \
    -path {}
gen_prg -use_init false
