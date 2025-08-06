--------------------------------------------------------------------------------
-- Company: UNIVERSIDAD DE LAS FUERZAS ARMADAS ESPE
--
-- File: AUTO_READ.vhd
-- File history:
--      REV.1: 02/06/2024: Primer version de la escritura auto.
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--
-- Description: 
--
-- <Description here>
--
-- Targeted device: <Family::SmartFusion2> <Die::M2S010> <Package::256 VF>
-- Author: PEDRO SANCHEZ
--
--------------------------------------------------------------------------------

library IEEE;

use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity AUTO_READ is
generic(
    DATA_WIDTH          :   natural := 32;         --Width data  
    ADDR_WIDTH          :   natural := 32;         --Width address 
    DATA_WIDTH_TPSRAM   :   natural := 8;          --Width Data from TPSRAM  
    ADDR_WIDTH_TPSRAM   :   natural := 11         --Width Data from TPSRAM  
);
port (
    RCLK                : IN    std_logic;
    CLK_ENABLE          : IN    std_logic;
    start_auto          : IN    std_logic;
    END_AXI             : IN    std_logic;
    READ_PROGRESS       : OUT   std_logic;

    --=============================    UART_IF 
    --Inputs
    uart_next_address   : IN    std_logic;
    --============================= DATA HANDLE
    dt_hndl_ren         : IN    std_logic;
    dt_hndl_raddr       : IN    std_logic_vector(ADDR_WIDTH_TPSRAM-1 downto 0);
    --=============================    TPSRAM 
    TPSRAM_REN          : OUT   std_logic:='0';
    TPSRAM_RADDR        : OUT   std_logic_vector(ADDR_WIDTH_TPSRAM-1 downto 0):=(others=>'0')
);
end AUTO_READ;
architecture architecture_AUTO_READ of AUTO_READ is
--====================================================
-- DEFINE FINITE STATE MACHINE
--====================================================
    type read_type is (WAIT_ST,ADR_MORE,RD_TPSRAM,END_RD,BACK_START);
    signal RD_fsm: read_type:= WAIT_ST;
    
--FOR MEMORY_TMR
    signal sg_REN           : std_logic:='0';
    signal sg_RADDR         : std_logic_vector(ADDR_WIDTH_TPSRAM-1 downto 0):=(others=>'0');
--FOR CONTROL
    signal cnt_tpsram       : integer range 0 to 1920   :=0;
    
    
begin
--=============================================
-- MUX TO MEMORY TMR
--                _  
--DATA_HANDLE -> | |    ->  READ:MEMORY_TMR
--AUTO_HANDLE -> |_|
--=============================================

--TPSRAM_REN   <=  dt_hndl_REN;
--TPSRAM_RADDR <=  dt_hndl_RADDR;
--
--READ_PROGRESS<='0';

TPSRAM_REN   <= sg_REN   when (start_auto = '1') else dt_hndl_REN;
TPSRAM_RADDR <= sg_RADDR when (start_auto = '1') else dt_hndl_RADDR;

   --====================================================
--READ DATA TO TPSRAM PROCESS
--====================================================

process(start_auto,RCLK,CLK_ENABLE,uart_next_address)
begin
    if(start_auto='0' or uart_next_address='0' or END_AXI='0')then
        sg_REN      <='0';
        sg_RADDR    <=(others=>'0');
        cnt_tpsram<=0;
        RD_fsm<=WAIT_ST;
    elsif(rising_edge(RCLK) and CLK_ENABLE='1')then
        case(RD_fsm)is 
        when WAIT_ST=>
            RD_fsm<=ADR_MORE;               

        when ADR_MORE   =>
            sg_REN	    <='1';
            sg_RADDR    <=sg_RADDR+1;
            cnt_tpsram	<=cnt_tpsram+1;
            RD_fsm      <=RD_TPSRAM;
            
        when RD_TPSRAM  =>
            if(cnt_tpsram=1920)then --1920x182=349440 registers
                sg_REN	    <='0';
                cnt_tpsram	<=0;
                sg_RADDR    <=(others=>'0');
                RD_fsm<=END_RD;
            else
                sg_REN	    <='0';
                RD_fsm<=ADR_MORE;
            end if;
        
        when END_RD  =>
                RD_fsm<=BACK_START;
        when BACK_START=>
                if(END_AXI='0') then 
                    RD_fsm      <=WAIT_ST;
                end if;
        when others=>
            RD_fsm      <=WAIT_ST;
        end case;
    end if;
end process;

process(RD_fsm,CLK_ENABLE)
begin
    if(RD_fsm=BACK_START or RD_fsm=WAIT_ST)then
        READ_PROGRESS<='0';
    else
        if(CLK_ENABLE='1')then
            READ_PROGRESS<='1';
        end if;
    end if;
end process;
end architecture_AUTO_READ;
