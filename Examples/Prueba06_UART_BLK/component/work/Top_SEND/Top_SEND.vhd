----------------------------------------------------------------------
-- Created by SmartDesign Fri May 10 00:30:34 2024
-- Version: 2023.2 2023.2.0.8
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Libraries
----------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library smartfusion2;
use smartfusion2.all;
----------------------------------------------------------------------
-- Top_SEND entity declaration
----------------------------------------------------------------------
entity Top_SEND is
    -- Port list
    port(
        -- Inputs
        BTN_MSS_IN : in  std_logic;
        BTN_RST_IN : in  std_logic;
        -- Outputs
        PAD        : out std_logic;
        PAD_0      : out std_logic;
        TX         : out std_logic
        );
end Top_SEND;
----------------------------------------------------------------------
-- Top_SEND architecture body
----------------------------------------------------------------------
architecture RTL of Top_SEND is
----------------------------------------------------------------------
-- Component declarations
----------------------------------------------------------------------
-- Debouncing_Button_VHDL
component Debouncing_Button_VHDL
    -- Port list
    port(
        -- Inputs
        button           : in  std_logic;
        clk              : in  std_logic;
        -- Outputs
        debounced_button : out std_logic
        );
end component;
-- GPIO_demo
component GPIO_demo
    -- Port list
    port(
        -- Inputs
        BTN_MSG  : in  std_logic;
        BTN_RST  : in  std_logic;
        CLK      : in  std_logic;
        -- Outputs
        UART_TXD : out std_logic
        );
end component;
-- OSC_C0
component OSC_C0
    -- Port list
    port(
        -- Outputs
        RCOSC_25_50MHZ_O2F : out std_logic
        );
end component;
-- OUTBUF
component OUTBUF
    generic( 
        IOSTD : string := "" 
        );
    -- Port list
    port(
        -- Inputs
        D   : in  std_logic;
        -- Outputs
        PAD : out std_logic
        );
end component;
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
signal Debouncing_Button_VHDL_0_0_debounced_button : std_logic;
signal Debouncing_Button_VHDL_0_debounced_button   : std_logic;
signal OSC_C0_0_RCOSC_25_50MHZ_O2F                 : std_logic;
signal PAD_net_0                                   : std_logic;
signal PAD_0_net_0                                 : std_logic;
signal TX_net_0                                    : std_logic;
signal TX_net_1                                    : std_logic;
signal PAD_net_1                                   : std_logic;
signal PAD_0_net_1                                 : std_logic;

begin
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 TX_net_1    <= TX_net_0;
 TX          <= TX_net_1;
 PAD_net_1   <= PAD_net_0;
 PAD         <= PAD_net_1;
 PAD_0_net_1 <= PAD_0_net_0;
 PAD_0       <= PAD_0_net_1;
----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- Debouncing_Button_VHDL_0
Debouncing_Button_VHDL_0 : Debouncing_Button_VHDL
    port map( 
        -- Inputs
        button           => BTN_RST_IN,
        clk              => OSC_C0_0_RCOSC_25_50MHZ_O2F,
        -- Outputs
        debounced_button => Debouncing_Button_VHDL_0_debounced_button 
        );
-- Debouncing_Button_VHDL_0_0
Debouncing_Button_VHDL_0_0 : Debouncing_Button_VHDL
    port map( 
        -- Inputs
        button           => BTN_MSS_IN,
        clk              => OSC_C0_0_RCOSC_25_50MHZ_O2F,
        -- Outputs
        debounced_button => Debouncing_Button_VHDL_0_0_debounced_button 
        );
-- GPIO_demo_0
GPIO_demo_0 : GPIO_demo
    port map( 
        -- Inputs
        BTN_RST  => Debouncing_Button_VHDL_0_debounced_button,
        BTN_MSG  => Debouncing_Button_VHDL_0_0_debounced_button,
        CLK      => OSC_C0_0_RCOSC_25_50MHZ_O2F,
        -- Outputs
        UART_TXD => TX_net_0 
        );
-- OSC_C0_0
OSC_C0_0 : OSC_C0
    port map( 
        -- Outputs
        RCOSC_25_50MHZ_O2F => OSC_C0_0_RCOSC_25_50MHZ_O2F 
        );
-- OUTBUF_0
OUTBUF_0 : OUTBUF
    port map( 
        -- Inputs
        D   => Debouncing_Button_VHDL_0_debounced_button,
        -- Outputs
        PAD => PAD_net_0 
        );
-- OUTBUF_1
OUTBUF_1 : OUTBUF
    port map( 
        -- Inputs
        D   => Debouncing_Button_VHDL_0_0_debounced_button,
        -- Outputs
        PAD => PAD_0_net_0 
        );

end RTL;
