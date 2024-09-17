----------------------------------------------------------------------
-- Created by SmartDesign Wed Nov 15 12:06:24 2023
-- Version: 2023.2 2023.2.0.8
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Component Description (Tcl) 
----------------------------------------------------------------------
--# Exporting Component Description of OSC_C0 to TCL
--# Family: SmartFusion2
--# Part Number: M2S010-1VF256
--# Create and Configure the core component OSC_C0
--create_and_configure_core -core_vlnv {Actel:SgCore:OSC:2.0.101} -component_name {OSC_C0} -params {\
--"RCOSC_1MHZ_DRIVES_CCC:false"  \
--"RCOSC_1MHZ_DRIVES_FAB:false"  \
--"RCOSC_1MHZ_IS_USED:false"  \
--"RCOSC_25_50MHZ_DRIVES_CCC:false"  \
--"RCOSC_25_50MHZ_DRIVES_FAB:1"  \
--"RCOSC_25_50MHZ_IS_USED:1"  \
--"VOLTAGE_IS_1_2:true"  \
--"XTLOSC_DRIVES_CCC:false"  \
--"XTLOSC_DRIVES_FAB:false"  \
--"XTLOSC_FREQ:20.00"  \
--"XTLOSC_IS_USED:false"  \
--"XTLOSC_SRC:CRYSTAL"   }
--# Exporting Component Description of OSC_C0 to TCL done

----------------------------------------------------------------------
-- Libraries
----------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library smartfusion2;
use smartfusion2.all;
----------------------------------------------------------------------
-- OSC_C0 entity declaration
----------------------------------------------------------------------
entity OSC_C0 is
    -- Port list
    port(
        -- Outputs
        RCOSC_25_50MHZ_O2F : out std_logic
        );
end OSC_C0;
----------------------------------------------------------------------
-- OSC_C0 architecture body
----------------------------------------------------------------------
architecture RTL of OSC_C0 is
----------------------------------------------------------------------
-- Component declarations
----------------------------------------------------------------------
-- OSC_C0_OSC_C0_0_OSC   -   Actel:SgCore:OSC:2.0.101
component OSC_C0_OSC_C0_0_OSC
    -- Port list
    port(
        -- Inputs
        XTL                : in  std_logic;
        -- Outputs
        RCOSC_1MHZ_CCC     : out std_logic;
        RCOSC_1MHZ_O2F     : out std_logic;
        RCOSC_25_50MHZ_CCC : out std_logic;
        RCOSC_25_50MHZ_O2F : out std_logic;
        XTLOSC_CCC         : out std_logic;
        XTLOSC_O2F         : out std_logic
        );
end component;
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
signal RCOSC_25_50MHZ_O2F_net_0 : std_logic;
signal RCOSC_25_50MHZ_O2F_net_1 : std_logic;
----------------------------------------------------------------------
-- TiedOff Signals
----------------------------------------------------------------------
signal GND_net                  : std_logic;

begin
----------------------------------------------------------------------
-- Constant assignments
----------------------------------------------------------------------
 GND_net <= '0';
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 RCOSC_25_50MHZ_O2F_net_1 <= RCOSC_25_50MHZ_O2F_net_0;
 RCOSC_25_50MHZ_O2F       <= RCOSC_25_50MHZ_O2F_net_1;
----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- OSC_C0_0   -   Actel:SgCore:OSC:2.0.101
OSC_C0_0 : OSC_C0_OSC_C0_0_OSC
    port map( 
        -- Inputs
        XTL                => GND_net, -- tied to '0' from definition
        -- Outputs
        RCOSC_25_50MHZ_CCC => OPEN,
        RCOSC_25_50MHZ_O2F => RCOSC_25_50MHZ_O2F_net_0,
        RCOSC_1MHZ_CCC     => OPEN,
        RCOSC_1MHZ_O2F     => OPEN,
        XTLOSC_CCC         => OPEN,
        XTLOSC_O2F         => OPEN 
        );

end RTL;
