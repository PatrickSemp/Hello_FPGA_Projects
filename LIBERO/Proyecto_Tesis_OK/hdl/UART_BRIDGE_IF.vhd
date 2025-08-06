--------------------------------------------------------------------------------
-- Company: Universidad de las Fuerzas Armadas ESPE
--
-- File: UART_BRIDGE_IF.vhd
-- File history:
--      Rev.1 : 1/21/2024: First Version to VHDL UART_IF_FSM
--      Rev 2 : 2/1/2024 : Second Version for write 349440 registers
--      Rev 3 : 3/8/2024 : Third Version fixed read burst
--
-- Description: 
--
-- 1:VHDL Version from UART_IF_FSM, with modification personal for TMR functions. 
-- 2:Version where i modificate counter burst in third option for to reach all register (349440 y not just 2048)
-- 3: Fixed Version. Read Burst, option 4 were damaged in sg_ADDR, and now its fixed to read all registers for every page. 
-- Targeted device: <Family::SmartFusion2> <Die::M2S010> <Package::256 VF>
-- Author: Pedro Sanchez
--
--------------------------------------------------------------------------------

library IEEE;

use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity UART_BRIDGE_IF is
port (
    CLK         : IN std_logic;
    RESET_N     : IN std_logic;
    start_axi   : IN std_logic;
    --============================= DATA HANDLE
    --Inputs
    auto_hndl_option      : IN std_logic_vector(7 downto 0);
    auto_hndl_address     : IN std_logic_vector(31 downto 0);
    auto_hndl_data1       : IN std_logic_vector(31 downto 0);
    auto_hndl_data2       : IN std_logic_vector(31 downto 0);
    
    --============================= AXI_IF
    --Inputs
    AXI_WBUSY   : IN std_logic;
    AXI_RBUSY   : IN std_logic;
    RVALID      : IN std_logic;
    RLAST       : IN std_logic;
    BREADY      : IN std_logic;
    RREADY      : IN std_logic;
    --Outputs
    WR_START    : OUT std_logic;    --TO write_start
    RD_START    : OUT std_logic;    --TO read_start
    WLEN        : OUT std_logic_vector(3 downto 0);
    RLEN        : OUT std_logic_vector(3 downto 0);
    WR_ADDR     : OUT std_logic_vector(31 downto 0);    --TO AWADDR
    RD_ADDR     : OUT std_logic_vector(31 downto 0);    --TO ARADDR
    WDATA_SDRAM : OUT std_logic_vector(63 downto 0);    --TO WDATA
    
    --============================== TPSRAM
    --Outputs
    TPSRAM_WADDR: OUT std_logic_vector(7 downto 0);     --TO WADDR TPSRAM
    RAM01_EN    : OUT std_logic;
    RAM02_EN    : OUT std_logic;
    RAM03_EN    : OUT std_logic;
    RAM04_EN    : OUT std_logic;
    
    --============================== AUTOMATE TMR
    Next_Address: OUT std_logic:='0';
    End_Write   : OUT std_logic:='0'    --Interrupt to indicate End Write Process
    
);
end UART_BRIDGE_IF;
architecture behavioral of UART_BRIDGE_IF is
--====================================================
-- DEFINE FINITE STATE MACHINE
--====================================================
type fsm_type is (RESET,START,SEL,WSINGLE,WSINGLE1,RSINGLE,RSINGLE1,WBURST,WBURST01,WBURST02,WBURST03,RBURST_PAGE,RBURST,RBURST01,RBURST02,RBURST03);
signal fsm: fsm_type:=RESET;
--============================================
--SIGNALS
--============================================
signal sg_option    : std_logic_vector(7 downto 0):=(others=>'0');
signal sg_ADDR      : std_logic_vector(31 downto 0):=(others=>'0');
signal sg_ADDR_BURST: std_logic_vector(31 downto 0):=(others=>'0');
signal sg_PAGE      : std_logic_vector(31 downto 0):=(others=>'0'); --Apuntador para direccionar paginas
signal sg_DATA_IN   : std_logic_vector(63 downto 0):=(others=>'0');
signal cnt_burst    : integer range 0 to 2730 := 0;                 --Contador para 2730 transf de memoria RAM 
signal cnt_page     : integer range 0 to 3  := 0;                   --Contador para paginas de memoria RAM 
signal enable_count : integer range 0 to 4 := 0 ;                   -- Contador para activar enables secuencialmente
signal limit_cnt    : integer range 15 to 16 := 16;

begin
--=============================================
--  SIGNALS FOR JOIN DATA[1] & DATA[2] 
--=============================================
WDATA_SDRAM <=sg_DATA_IN;

--=============================================
--  SIGNALS MEMORY_TMR ENABLES 
--=============================================
RAM01_EN <= '1' when enable_count = 0 AND RVALID='1' else '0';
RAM02_EN <= '1' when enable_count = 1 AND RVALID='1' else '0';
RAM03_EN <= '1' when enable_count = 2 AND RVALID='1' else '0';
RAM04_EN <= '1' when enable_count = 4 AND RVALID='1' else '0';
--============================================
-- MACHINE STATES
--============================================
process(CLK, RESET_N)
begin
    if(RESET_N='0') then 
        sg_option   <=(others=>'0');
        sg_ADDR     <=(others=>'0');
        sg_ADDR_BURST<=(others=>'0');
        sg_PAGE     <=(others=>'0');
        sg_DATA_IN  <=(others=>'0');
        enable_count<=0;
        cnt_burst   <=0;
        cnt_page    <=0;
        RD_START    <='0';
        WR_START    <='0';
        WR_ADDR     <=(others=>'0');
        RD_ADDR     <=(others=>'0');
        WLEN<=(others=>'0');
        RLEN<=(others=>'0');
        TPSRAM_WADDR<=(others=>'0');
        Next_Address<='1';
        End_Write<='0';
        fsm<=START;
    elsif(rising_edge(CLK)) then 
        case(fsm) is
            when START  =>
                enable_count<=0;
                cnt_burst   <=0;
                cnt_page    <=0;
                RD_START    <='0';
                WR_START    <='0';
                TPSRAM_WADDR<=(others=>'0');
                WLEN<=(others=>'0');
                RLEN<=(others=>'0');
                End_Write   <='0';
                --Next_Address<='1';
                if(start_axi='1')then 
                    sg_option   <=auto_hndl_option;
                    sg_ADDR     <=auto_hndl_address;
                    sg_DATA_IN  <=auto_hndl_data1 & auto_hndl_data2;
                    Next_Address<='0';
                    fsm         <=SEL;
                    else    
                        sg_option   <=(others=>'0');
                        sg_ADDR     <=(others=>'0');
                        sg_ADDR_BURST<=(others=>'0');
                        sg_PAGE     <=(others=>'0');
                        sg_DATA_IN  <=(others=>'0');
                        fsm<=START;
                end if;
--=========================== USER OPTION CLASSIFICATION 
            --option '1'/0x31:     Single Write Transfer
            --option '2'/0x32:     Single Read Transfer
            --option '3'/0x33:     16 Transfers Burst Write Transfer * 3 Pages(0-55500-AAA00)
            --option '4'/0x34:     16 Transfers Burst Read Transfer * 3 Pages(0-55500-AAA00)
            --option '6'/0x36:     15 Transfers Burst Read Transfer * 3 Pages(0-55500-AAA00)
            when SEL    =>
                if(sg_option=x"31")then         --'1'
                    WLEN<=(others=>'0');
                    fsm<=WSINGLE;
                elsif(sg_option=x"32")then      --'2'
                    RLEN<=(others=>'0');
                    fsm<=RSINGLE;
                elsif(sg_option=x"33")then      --'3'
                    WLEN<="1111";
                    fsm<=WBURST;
                elsif(sg_option=x"34")then      --'4'
                    RLEN<="1111";
                    limit_cnt<=16;
                    fsm<=RBURST_PAGE;
                else
                    fsm<=START;
                end if;
--/////////////////////////////////////////////////////////////////
--          AXI SINGLE WRITE
--////////////////////////////////////////////////////////////////
        when WSINGLE =>
                WR_START    <='0';
                if(AXI_WBUSY='0')then 
                    WR_START    <='1';
                    WR_ADDR     <=sg_ADDR;
                    fsm<=WSINGLE1;
                end if;
            when WSINGLE1=>
                WR_START    <='0';
                if(BREADY='1')then
                    fsm<=START;
                end if;
                
--/////////////////////////////////////////////////////////////////
--          AXI SINGLE READ
--////////////////////////////////////////////////////////////////
            when RSINGLE =>
                enable_count    <=4;
                if(AXI_RBUSY='0')then
                    RD_START    <='1';
                    RD_ADDR     <=sg_ADDR;
                    fsm         <=RSINGLE1;
                end if;
                
            when RSINGLE1=>
                RD_START    <='0';
                if(RVALID='1' and RREADY='1'and RLAST='1')then 
                    fsm     <=START;
                end if;

--/////////////////////////////////////////////////////////////////
--          AXI BURST WRITE
--////////////////////////////////////////////////////////////////
            when WBURST =>
                if(AXI_WBUSY='0')then 
                    WR_START    <='1';
                    WR_ADDR     <=sg_ADDR;
                    cnt_burst     <=cnt_burst+1;
                    fsm<=WBURST01;
                end if;
            when WBURST01=>
                WR_START    <='0';                
                if(BREADY='1')then
                    sg_ADDR <= sg_ADDR + 128;
                    fsm<=WBURST02;
                end if;
            when WBURST02=>
                if(cnt_burst=2730)then --2730 for x"55500"/349440 or 16 for x"80"/128
                    sg_PAGE <= sg_PAGE+ x"00055500";--349440
                    cnt_burst<=0;
                    cnt_page<=cnt_page+1;
                    fsm<=WBURST03;
                else
                    fsm<=WBURST;
                end if;
            when WBURST03=>
                if(cnt_page=3)then 
                    End_Write<='1';
                    fsm<=START;
                else
                    sg_ADDR <= sg_PAGE;
                    fsm<=WBURST;
                end if;
--////////////////////////////////////////////////////////////////
--          AXI BURST READ
--/////////////////////////////////////////////////////////////// 
            when RBURST_PAGE =>
                if(AXI_RBUSY='0')then
                    RD_START    <='1';
                    RD_ADDR     <=sg_ADDR;
                    sg_ADDR_BURST<=sg_ADDR;
                    cnt_burst   <=cnt_burst+1;
                    fsm         <=RBURST01;
                else
                    fsm         <=RBURST;
                end if;
                
            when RBURST =>
                if(AXI_RBUSY='0')then
                    RD_START    <='1';
                    RD_ADDR     <=sg_ADDR_BURST;
                    cnt_burst   <=cnt_burst+1;
                    fsm         <=RBURST01;
                else
                    fsm         <=RBURST;
                end if;
                
            when RBURST01=>
                RD_START    <='0';
                if(RVALID='1' and RREADY='1')then 
                    TPSRAM_WADDR<=TPSRAM_WADDR + 1;
                    if(RLAST='1')then                   --2730 for x"55500"/349440 or 16 for x"80"/128
                        sg_ADDR_BURST <= sg_ADDR_BURST+ 128;       
                        fsm         <=RBURST02;
                    else
                        fsm         <=RBURST01;
                    end if;
                end if;
                
            when RBURST02=>
                if(cnt_burst=limit_cnt)then             --limit_cnt
                    --sg_PAGE <= sg_PAGE+ x"00055500";    --349440
                    TPSRAM_WADDR<=(others=>'0');
                    cnt_burst<=0;
                    enable_count<= enable_count + 1;
                    fsm<=RBURST03;
                else
                    fsm<=RBURST;
                end if;
                
            when RBURST03=>
                if(enable_count=3)then 
                    Next_Address<='1';
                    fsm<=START;
                else 
                    sg_ADDR <= sg_ADDR+x"00055500";
                    fsm<=RBURST_PAGE;
                end if;
                
            when others=>
                fsm<=START;
        end case;
end if; 
end process;
   
end behavioral;
