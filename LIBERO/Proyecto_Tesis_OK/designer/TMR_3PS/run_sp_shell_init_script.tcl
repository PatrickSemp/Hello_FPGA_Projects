set_device \
    -family  SmartFusion2 \
    -die     PA4M1000_N \
    -package vf256 \
    -speed   -1 \
    -tempr   {COM} \
    -voltr   {COM}
set_def {VOLTAGE} {1.2}
set_def {VCCI_1.2_VOLTR} {COM}
set_def {VCCI_1.5_VOLTR} {COM}
set_def {VCCI_1.8_VOLTR} {COM}
set_def {VCCI_2.5_VOLTR} {COM}
set_def {VCCI_3.3_VOLTR} {COM}
set_def {PLL_SUPPLY} {PLL_SUPPLY_25}
set_def {VPP_SUPPLY_25_33} {VPP_SUPPLY_25}
set_def {VDDAUX_SUPPLY_25_33} {VDDAUX_SUPPLY_25}
set_def {MDDR_REGISTERS} {D:/ESPE/TESIS/SW_LIBERO/PROGRAMAS/B_PRUEBAS/Prueba37_16KB_TMR04_DT2/component/work/MDDR_Demo_sb_sb_MSS/MDDR_init.reg}
set_def {PA4_URAM_FF_CONFIG} {SUSPEND}
set_def {PA4_SRAM_FF_CONFIG} {SUSPEND}
set_def {PA4_MSS_FF_CLOCK} {RCOSC_1MHZ}
set_def USE_CONSTRAINTS_FLOW 1
set_netlist -afl {D:\ESPE\TESIS\SW_LIBERO\PROGRAMAS\B_PRUEBAS\Prueba37_16KB_TMR04_DT2\designer\TMR_3PS\TMR_3PS.afl} -adl {D:\ESPE\TESIS\SW_LIBERO\PROGRAMAS\B_PRUEBAS\Prueba37_16KB_TMR04_DT2\designer\TMR_3PS\TMR_3PS.adl}
set_placement   {D:\ESPE\TESIS\SW_LIBERO\PROGRAMAS\B_PRUEBAS\Prueba37_16KB_TMR04_DT2\designer\TMR_3PS\TMR_3PS.loc}
set_routing     {D:\ESPE\TESIS\SW_LIBERO\PROGRAMAS\B_PRUEBAS\Prueba37_16KB_TMR04_DT2\designer\TMR_3PS\TMR_3PS.seg}
