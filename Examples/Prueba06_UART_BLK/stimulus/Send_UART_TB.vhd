--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: Send_UART_TB.vhd
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


library ieee;
use ieee.std_logic_1164.all;

entity Send_UART_TB is
end Send_UART_TB;

architecture behavioral of Send_UART_TB is

    constant SYSCLK_PERIOD : time := 2 ns; -- 100MHZ

    signal SYSCLK : std_logic := '0';
    signal NSYSRESET : std_logic := '0';

    component Top_SEND
        -- ports
        port( 
            -- Inputs
            BTN_RST_IN : in std_logic;
            BTN_MSS_IN : in std_logic;

            -- Outputs
            TX : out std_logic;
            PAD : out std_logic;
            PAD_0 : out std_logic
        );
    end component;

begin

    process
        variable vhdl_initial : BOOLEAN := TRUE;

    begin
        if ( vhdl_initial ) then
            -- Assert Reset
            NSYSRESET <= '1';
            wait for ( SYSCLK_PERIOD * 10 );
            
            NSYSRESET <= '0';
            wait;
        end if;
    end process;

    -- Clock Driver
    SYSCLK <= not SYSCLK after (SYSCLK_PERIOD / 2.0 );

    -- Instantiate Unit Under Test:  Top_SEND
    Top_SEND_0 : Top_SEND
        -- port map
        port map( 
            -- Inputs
            BTN_RST_IN => '0',
            BTN_MSS_IN => '0',

            -- Outputs
            TX =>  open,
            PAD =>  open,
            PAD_0 =>  open

            -- Inouts

        );

end behavioral;

