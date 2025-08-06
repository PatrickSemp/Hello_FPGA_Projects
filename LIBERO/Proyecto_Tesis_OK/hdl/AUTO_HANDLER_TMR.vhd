--------------------------------------------------------------------------------
-- Company: UNIVERSIDAD DE LAS FUERZAS ARMADAS
--
-- File: AUTO_HANDLER_TMR.vhd
-- File history:
--      1: 1/29/2024: Manejador del proceso automatico del TMR y la generacion 
--      de la interrupcion
--      2: 2/1/2024: Se modifico todo el codigo para mejorar la sincronizacion 
--      <Revision number>: <Date>: <Comments>
--
-- Description: 
--  1:Proceso para revisar las memorias de manera automatica con el bloque TMR 
--  en caso de que exista un error donde los 3 registros son diferentes, se manda  
-- una señal de interrupcion indicando que un dato se encuentra erroneo.
--  2:Debido a problemas de sincronizacion entre procesos, se realizo una nueva 
--  logica, y se coloca un indicador luminoso para señalar que se encendio el 
--  modo automatico.
-- Targeted device: <Family::SmartFusion2> <Die::M2S010> <Package::256 VF>
-- Author: Pedro Sanchez
--
--------------------------------------------------------------------------------

library IEEE;

use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity AUTO_HANDLER_TMR is
generic(
    DATA_WIDTH          :   natural := 32;         --Width data  
    ADDR_WIDTH          :   natural := 32;         --Width address 
    DATA_WIDTH_TPSRAM   :   natural := 8;          --Width Data from TPSRAM  
    ADDR_WIDTH_TPSRAM   :   natural := 11         --Width Data from TPSRAM  
);
port (
    --Inputs
    WCLK                : IN    std_logic;
    RCLK                : IN    std_logic;
    AUTO_ON             : OUT   std_logic;
    --============================= DATA HANDLE
    --Inputs
    dt_hndl_option      : IN    std_logic_vector(7 downto 0);
    dt_hndl_address     : IN    std_logic_vector(ADDR_WIDTH-1 downto 0);
    dt_hndl_data1       : IN    std_logic_vector(DATA_WIDTH-1 downto 0);
    dt_hndl_data2       : IN    std_logic_vector(DATA_WIDTH-1 downto 0);
    dt_hndl_start_axi   : IN    std_logic;
    dt_hndl_ren         : IN    std_logic;
    dt_hndl_raddr       : IN    std_logic_vector(ADDR_WIDTH_TPSRAM-1 downto 0);
    --=============================    UART_IF 
    --Inputs
    uart_next_address   : IN    std_logic;
    --Outputs
    UART_USER_OPTION    : OUT   std_logic_vector(7 downto 0):=(others=>'0');
    UART_USER_ADDRESS   : OUT   std_logic_vector(DATA_WIDTH-1 downto 0):=(others=>'0');
    UART_USER_DATA1     : OUT   std_logic_vector(DATA_WIDTH-1 downto 0):=(others=>'0');
    UART_USER_DATA2     : OUT   std_logic_vector(DATA_WIDTH-1 downto 0):=(others=>'0');
    UART_START_AXI      : OUT   std_logic:='0';
    --=============================    TPSRAM 
    TPSRAM_REN          : OUT   std_logic:='0';
    TPSRAM_RADDR        : OUT   std_logic_vector(ADDR_WIDTH_TPSRAM-1 downto 0):=(others=>'0')
);
end AUTO_HANDLER_TMR;
architecture behavioral of AUTO_HANDLER_TMR is
    --====================================================
    -- DEFINE STATES
    --====================================================
    type write_type is (WR_Reset,StandBy,SND_ADDR,SND_AXI,WAIT_RD);
    signal WR_fsm: write_type:=StandBy;
    type read_type is (RD_Reset,RD_BLK,ADR_MORE,RD_TPSRAM,END_RD);
    signal RD_fsm: read_type:= RD_BLK;
    
    --====================================================
    -- SIGNALS
    --====================================================
    --FOR UART_IF
    signal  start_auto      : std_logic:='0';
    constant option_auto    : std_logic_vector(7 downto 0) := x"36";
    signal sg_address       : std_logic_vector(ADDR_WIDTH-1 downto 0):=(others=>'0'); 
    signal sg_start_axi     : std_logic:='0';
    --FOR MEMORY_TMR
    signal sg_REN           : std_logic:='0';
    signal sg_RADDR         : std_logic_vector(ADDR_WIDTH_TPSRAM-1 downto 0):=(others=>'0');
    --FOR CONTROL
    signal cnt_2k       : integer range 0 to 182    :=0;
    signal cnt_tpsram   : integer range 0 to 1920   :=0;
    --FOR PASS NEXT PROCESS
    signal START_READ   : std_logic:='1';
    signal END_AXI      : std_logic:='0';
    signal LED_state    : std_logic:='0';
    --FOR BLINK LED
    constant max_count  : integer := 160000000;
    signal count        :integer range 0 to max_count:=0; 
begin

--=============================================
-- MUX TO AXI MASTER
--                _  
--DATA_HANDLE -> | |    ->  AXI_MASTER
--AUTO_HANDLE -> |_|
--=============================================

--process(dt_hndl_option,dt_hndl_start_axi)
--begin
    --if(dt_hndl_option=x"36")then
        --if(dt_hndl_start_axi='1')then
            --start_auto<='1';
            --UART_USER_OPTION    <=option_auto;
            --UART_USER_ADDRESS   <=sg_address;
            --UART_USER_DATA1     <=(others=>'0');
            --UART_USER_DATA2     <=(others=>'0');
            --UART_START_AXI      <=sg_start_axi;
        --end if;
    --else
        --start_auto<='0';
        --UART_USER_OPTION    <=dt_hndl_option;
        --UART_USER_ADDRESS   <=dt_hndl_address;
        --UART_USER_DATA1     <=dt_hndl_data1;
        --UART_USER_DATA2     <=dt_hndl_data2;
        --UART_START_AXI      <=dt_hndl_start_axi;
    --end if;
--end process;

    process(dt_hndl_option,dt_hndl_start_axi)
    begin
        if(rising_edge(dt_hndl_start_axi))then
            if(dt_hndl_option=x"36")then
                start_auto<='1';
            else
                start_auto<='0';
            end if;
        end if;
    end process;
--start_auto <= '0' when dt_hndl_option /= x"36" else
              --'1' ;--when dt_hndl_start_axi = '1' else '0';

UART_USER_OPTION <= option_auto when (dt_hndl_option = x"36") else
                    dt_hndl_option;

UART_USER_ADDRESS <= sg_address when (dt_hndl_option = x"36") else
                     dt_hndl_address;

UART_USER_DATA1 <= (others => '0') when (dt_hndl_option = x"36") else
                  dt_hndl_data1;

UART_USER_DATA2 <= (others => '0') when (dt_hndl_option = x"36") else
                  dt_hndl_data2;

UART_START_AXI <= sg_start_axi when (dt_hndl_option = x"36") else
                 dt_hndl_start_axi;

--=============================================
-- READ DATA TO SDRAM PROCESS
--=============================================

process(WCLK,start_auto)
begin 
    if(start_auto='0')then
        sg_address      <=(others=>'0');
        sg_start_axi    <='0';
        END_AXI<='0';
        WR_fsm          <=StandBy;
    elsif(rising_edge(WCLK))then
        case(WR_fsm)is
        when StandBy    =>
            END_AXI<='0';
            if(START_READ='1' AND cnt_2k<182)then
                cnt_2k      <=cnt_2k+1;
                WR_fsm      <=SND_ADDR;
            elsif(START_READ='0')then     
                WR_fsm<=StandBy;
                if(cnt_2k=182)then
                    sg_address      <=(others=>'0');
                    cnt_2k<=0;
                end if;
            end if;
          
        when SND_ADDR   =>
            if(cnt_2k>1)then 
                sg_address  <=sg_address+x"780";--x"780" / d"1920" 
            end if;
            WR_fsm      <=SND_AXI;  
            
        when SND_AXI    =>
            sg_start_axi<='1';
            if (uart_next_address='0')then 
                WR_fsm      <=WAIT_RD;
            end if;
        when WAIT_RD    =>
            sg_start_axi<='0';
            END_AXI<='1';
            if(START_READ='0')then
                WR_fsm      <=StandBy;
            end if;
        when others=>
            WR_fsm      <=StandBy;
        end case;
    end if;
end process;

--=============================================
-- MUX TO MEMORY TMR
--                _  
--DATA_HANDLE -> | |    ->  READ:MEMORY_TMR
--AUTO_HANDLE -> |_|
--=============================================

--process(END_AXI)
--begin
    --if(END_AXI='1')then
        --TPSRAM_REN  <=sg_REN;
        --TPSRAM_RADDR<=sg_RADDR;
    --else
        --TPSRAM_REN  <=dt_hndl_REN;
        --TPSRAM_RADDR<=dt_hndl_RADDR;
    --end if;
--end process;
TPSRAM_REN   <= sg_REN   when END_AXI = '1' else dt_hndl_REN;
TPSRAM_RADDR <= sg_RADDR when END_AXI = '1' else dt_hndl_RADDR;

--====================================================
--READ DATA TO TPSRAM PROCESS
--====================================================
process(RCLK,END_AXI)
begin
    if(END_AXI='0')then
        sg_REN      <='0';
        sg_RADDR    <=(others=>'0');
        cnt_tpsram<=0;
        RD_fsm<=RD_BLK;
        START_READ<='1';
    elsif(rising_edge(RCLK))then
        case(RD_fsm)is 
        when RD_BLK     =>
            if(uart_next_address='1')then 
                RD_fsm<=ADR_MORE;
            end if;
            
        when ADR_MORE   =>
            sg_REN      <='1';
            sg_RADDR    <=sg_RADDR+1;
            cnt_tpsram  <=cnt_tpsram+1;
            RD_fsm      <=RD_TPSRAM;
            
        when RD_TPSRAM  =>
            if(cnt_tpsram=1920)then
                cnt_tpsram  <=0;
                START_READ<='0';
                sg_REN      <='0';
                RD_fsm<=END_RD;
            else
                sg_REN      <='0';
                RD_fsm<=ADR_MORE;
            end if;
        when END_RD  =>
            if(END_AXI='0')then
                RD_fsm<=RD_BLK;
            end if;
        when others=>
            RD_fsm      <=RD_BLK;
        end case;
    end if;
end process;

--================================================
-- BLINK LED WHEN START AUTO BLOCK
--================================================
process(WCLK,start_auto)
begin
    if(start_auto='0')then
        LED_state<='0';
        count<=0;
    elsif(rising_edge(WCLK))then
        if count < max_count then 
                count <= count+1;
            else
                LED_state   <= not LED_state;
                count       <= 0;
            end if;
    end if;
end process;
AUTO_ON<=not(LED_state);

end behavioral;
