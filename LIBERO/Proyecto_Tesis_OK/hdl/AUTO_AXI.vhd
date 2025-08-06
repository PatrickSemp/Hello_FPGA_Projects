--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: AUTO_AXI.vhd
-- File history:
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--
-- Description: 
--
-- <Description here>
--
-- Targeted device: <Family::SmartFusion2> <Die::M2S010> <Package::256 VF>
-- Author: <Name>
--
--------------------------------------------------------------------------------

library IEEE;

use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity AUTO_AXI is
generic(
    DATA_WIDTH          :   natural := 32;         --Width data  
    ADDR_WIDTH          :   natural := 32;         --Width address 
    DATA_WIDTH_TPSRAM   :   natural := 8;          --Width Data from TPSRAM  
    ADDR_WIDTH_TPSRAM   :   natural := 11         --Width Data from TPSRAM  
);
port (
    WCLK                : IN    std_logic;
    READ_PROGRESS       : IN    std_logic;
    AUTO                : OUT   std_logic:='0';
    END_AUTO_AXI        : OUT   std_logic:='0';
    
    --============================= DATA HANDLE
    --Inputs
    dt_hndl_option      : IN    std_logic_vector(7 downto 0);
    dt_hndl_address     : IN    std_logic_vector(ADDR_WIDTH-1 downto 0);
    dt_hndl_data1       : IN    std_logic_vector(DATA_WIDTH-1 downto 0);
    dt_hndl_data2       : IN    std_logic_vector(DATA_WIDTH-1 downto 0);
    dt_hndl_start_axi   : IN    std_logic;
    --=============================    UART_IF 
    --Inputs
    uart_next_address   : IN    std_logic;
    --Outputs
    UART_USER_OPTION    : OUT   std_logic_vector(7 downto 0):=(others=>'0');
    UART_USER_ADDRESS   : OUT   std_logic_vector(DATA_WIDTH-1 downto 0):=(others=>'0');
    UART_USER_DATA1     : OUT   std_logic_vector(DATA_WIDTH-1 downto 0):=(others=>'0');
    UART_USER_DATA2     : OUT   std_logic_vector(DATA_WIDTH-1 downto 0):=(others=>'0');
    UART_START_AXI      : OUT   std_logic:='0'
);
end AUTO_AXI;
architecture architecture_AUTO_AXI of AUTO_AXI is
--====================================================
-- DEFINE FINITE STATE MACHINE
--====================================================
    type write_type is (WAIT_ST,SND_ADDR,SND_AXI,END_AXI,BACK_START);
    signal WR_fsm: write_type:=WAIT_ST;

--====================================================
-- SIGNALS
--====================================================
    --FOR UART_IF
    signal start_auto       : std_logic:='0';
    signal sg_address       : std_logic_vector(ADDR_WIDTH-1 downto 0):=(others=>'0'); 
    signal start_axi_AUTO   : std_logic:='0';
    signal cnt_2k: integer range 0 to 183:=0;
begin

--=============================================
-- MUX TO AXI MASTER
--                _  
--DATA_HANDLE -> | |    ->  AXI_MASTER
--AUTO_HANDLE -> |_|
--=============================================
    UART_USER_OPTION    <=  dt_hndl_option;
    
    UART_USER_ADDRESS   <=  sg_address when start_auto='1'else dt_hndl_address;
                            
    UART_USER_DATA1     <=  dt_hndl_data1;
    UART_USER_DATA2     <=  dt_hndl_data2;
    
    UART_START_AXI      <=  start_axi_AUTO when start_auto='1'else dt_hndl_start_axi;--POSIBLE ERROR READ_PROGRESS

    process(dt_hndl_option,dt_hndl_start_axi)
    begin
        --if(rising_edge(dt_hndl_start_axi))then
            if(dt_hndl_option=x"36")then
                start_auto<='1';
            else
                start_auto<='0';
            end if;
        --end if;
    end process;
    AUTO<=start_auto;
    
--=============================================
-- READ DATA TO SDRAM PROCESS
--=============================================

process(WCLK,start_auto,READ_PROGRESS,uart_next_address)
begin
    if(start_auto='0' )then
        sg_address  <=(others=>'0');
        --cnt_2k      <=0;
        WR_fsm      <=WAIT_ST;
        start_axi_AUTO<='0';
        END_AUTO_AXI     <='0';
    elsif(rising_edge(WCLK))then 
        case(WR_fsm)is        
            when WAIT_ST    =>
                if(uart_next_address='1'and READ_PROGRESS='0')then --or  
                    cnt_2k      <=cnt_2k+1;
                    END_AUTO_AXI     <='0';
                    WR_fsm      <=SND_ADDR;
                else
                    WR_fsm      <=WAIT_ST;
                end if;
                
            when SND_ADDR   =>--Clasificar o aumentar las direcciones
                if(cnt_2k>1 and cnt_2k<183 )then
                    sg_address<=sg_address+x"780";--1920 registros
                else
                    cnt_2k  <=1;
                    sg_address<=(others=>'0');
                    --Por mandar otra ves cero se puede repetir el error 
                    --si esta en los primeros 1920 registros
                end if;
                WR_fsm      <=SND_AXI; 
                
            when SND_AXI    =>
                start_axi_AUTO<='1';
                WR_fsm      <=END_AXI; 
                
            when END_AXI    =>
                --if(uart_next_address='0')then 
                    END_AUTO_AXI<='1';--TENER CUIDADO puede exister aqui el error
                    start_axi_AUTO<='0';
                    WR_fsm      <=BACK_START;
                --end if;
            when BACK_START=>
                if(READ_PROGRESS='1')then 
                    WR_fsm      <=WAIT_ST;
                end if;
                
            when others=>
                WR_fsm      <=WAIT_ST;
        end case;
    end if;
end process;

end architecture_AUTO_AXI;
