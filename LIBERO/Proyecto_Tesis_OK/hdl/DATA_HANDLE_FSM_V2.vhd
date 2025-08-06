--------------------------------------------------------------------------------
-- Company: Universidad de las Fuerzas Armadas ESPE
--
-- File: DATA_HANDLE_FSM_V2.vhd
-- File history:
--     2: 1/17/2024: Version del DATA_HANDLE_FSM hecho en VHDL
--     3: 1/19/2024: Correccion Read Data from TPSRAM         
--     4: 1/26/2024: Funcion para leer una sola memoria
--      <Revision number>: <Date>: <Comments>
--
-- Description: 
--2:Version hecha en VHDL,optimizada para cumplir con los señales expuestas en "Building
--an APB3 Core for SmartFusion cSoC FPGAs", y tener mejor control del envio y recepcion
--de TPSRAM y MSS
--3: Correccion de la lectura TPSRAM, se utilizo señales concurrentes para la lectura,
--no sirve usando maquina de estados, no leia el dato correctamente de la direccion dada, si no 
--una direccion mas arriba.
--Correccion hecha y eliminado el estado ReadSt, presente en la version anterior.
--4: Se agrega un mux para la seleccion de que señal de datos provenientes del TPSRAM leer, en
--en este caso se agrega como selector a la opcion 2.
-- 
-- Targeted device: <Family::SmartFusion2> <Die::M2S010> <Package::256 VF>
-- Author: Pedro Sánchez
--
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity DATA_HANDLE_FSM_V2 is
generic(
    DATA_WIDTH          :   natural := 32;         --Width data  
    ADDR_WIDTH          :   natural := 32;         --Width address 
    DATA_WIDTH_TPSRAM   :   natural := 8;          --Width Data from TPSRAM  
    ADDR_WIDTH_TPSRAM   :   natural := 11         --Width Data from TPSRAM  
);
port (
    --==============    UART_IF =======
    uart_user_option    : out   std_logic_vector(7 downto 0):=(others=>'0');
    uart_user_address   : out   std_logic_vector(DATA_WIDTH-1 downto 0):=(others=>'0');
    uart_user_data1     : out   std_logic_vector(DATA_WIDTH-1 downto 0):=(others=>'0');
    uart_user_data2     : out   std_logic_vector(DATA_WIDTH-1 downto 0):=(others=>'0');
    uart_start_axi      : out   std_logic:='0';
    
    --==============    TPSRAM  =======
    --Inputs
    tpsram_DATA : in    std_logic_vector(DATA_WIDTH_TPSRAM-1 downto 0);
    tpsram_1MEM : in    std_logic_vector(DATA_WIDTH_TPSRAM-1 downto 0);
    --Outputs
    tpsram_REN  : out   std_logic:='0';
    tpsram_RADDR: out   std_logic_vector(ADDR_WIDTH_TPSRAM-1 downto 0):=(others=>'0');
    sple_rd_RADDR: out   std_logic_vector(2 downto 0):=(others=>'0');
    --==============    APB3    =======
    --Inputs
    PCLK        : in    std_logic;
    PRESETn     : in    std_logic;
    PSEL        : in    std_logic;
    PENABLE     : in    std_logic;
    PWRITE      : in    std_logic;
    PADDR       : in    std_logic_vector(ADDR_WIDTH-1 downto 0);
    PWDATA      : in    std_logic_vector(DATA_WIDTH-1 downto 0);
    --Outputs
    PRDATA      : out   std_logic_vector(DATA_WIDTH_TPSRAM-1 downto 0):=(others=>'0');
    PREADY      : out   std_logic;     --Transfer Ready
    PSLVEER     : out   std_logic:='0'      --No error
);
end DATA_HANDLE_FSM_V2;
architecture behavioral  of DATA_HANDLE_FSM_V2 is
    --FINITE MACHINE STATES
    type data_handle_type is (Reset,StandBy,ReadSt,WriteSt,ReadySt);
    signal   fsm:data_handle_type:=Reset;    --Start with Reset State
    --Signal to keep the data
    signal sg_option    : std_logic_vector(7 downto 0):=(others=>'0');
    signal sg_address   : std_logic_vector(DATA_WIDTH-1 downto 0):=(others=>'0');
    signal sg_data1     : std_logic_vector(DATA_WIDTH-1 downto 0):=(others=>'0');
    signal sg_data2     : std_logic_vector(DATA_WIDTH-1 downto 0):=(others=>'0');
begin
--CONCURRENT SIGNALS
PSLVEER <='0';
uart_user_option    <=sg_option;
uart_user_address   <=sg_address;
uart_user_data1     <=sg_data1;
uart_user_data2     <=sg_data2;
PRDATA	            <=tpsram_1MEM when sg_option=x"32" else tpsram_DATA ;--MUX para lectura simple/TMR
tpsram_RADDR        <=PADDR(ADDR_WIDTH_TPSRAM+1 downto 2);
sple_rd_RADDR       <=PADDR(4 downto 2);
tpsram_REN          <=(not(PWRITE) and PSEL);
--======================================================================
--STATES
--=====================================================================
machine_states:process(PCLK,PRESETn)
begin 
    if (PRESETn='0') then
        fsm <= Reset;
    elsif(rising_edge(PCLK))then 
        case(fsm) is 
            when Reset=>
                fsm<=StandBy;
            when StandBy=>
                if (PSEL='1' and PWRITE='1')then 
                    fsm<=WriteSt;
                else     --  READ DATA FROM TPSRAM
                   if (PENABLE='1')then 
                        fsm<=ReadySt;       --Para el caso del :PSEL && ~PWRITE necesita PREADY
                    end if ;
                end if;
            when WriteSt=>
                if (PENABLE='1')then 
                    fsm<=ReadySt;
                end if ;
            when ReadySt=>
                fsm<=StandBy;
            when others=> 
                fsm<=StandBy;
        end case;
    end if;
end process;

--========================================================================
--  PREADY SIGNAL
--========================================================================
process(fsm)
begin
        if(fsm=ReadySt)or(fsm=Reset)then
            PREADY  <='1';
        else 
            PREADY  <='0';
        end if; 
end process;
--========================================================================
--  UART_START_AXI
--========================================================================
process(fsm,PADDR)
begin
    if(fsm=WriteSt)then
        if(PADDR(3 downto 2)="11")then
            uart_start_axi  <='1';
        end if;
    else
        uart_start_axi  <='0';
    end if; 
    --end if;
end process;
--========================================================================
--  PADDR SIGNAL CASES
--========================================================================
process(fsm,PADDR,PWDATA)
begin
        if (fsm=Reset) then
            sg_option    <= (others=>'0');
            sg_address   <= (others=>'0');
            sg_data1     <= (others=>'0');
            sg_data2     <= (others=>'0');
        elsif(fsm=WriteSt)then
            case(PADDR(3 downto 2))is
            when "00"=>
                sg_option   <=PWDATA(7 downto 0);   --1 byte/1 character
            when "01"=>
                sg_address  <=PWDATA;
            when "10"=>
                sg_data1    <=PWDATA;        
            when "11"=>
                sg_data2    <=PWDATA;
            when others=>
                sg_data2    <= (others=>'0');
            end case;
        end if; 
end process;
end behavioral;
