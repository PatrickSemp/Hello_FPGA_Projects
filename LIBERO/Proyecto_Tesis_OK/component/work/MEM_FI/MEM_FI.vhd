----------------------------------------------------------------------
-- Created by SmartDesign Sat Mar  9 19:28:31 2024
-- Version: 2023.2 2023.2.0.8
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Component Description (Tcl) 
----------------------------------------------------------------------
--# Exporting Component Description of MEM_FI to TCL
--# Family: SmartFusion2
--# Part Number: M2S010-1VF256
--# Create and Configure the core component MEM_FI
--create_and_configure_core -core_vlnv {Actel:SgCore:TPSRAM:1.0.102} -component_name {MEM_FI} -params {\
--"A_DOUT_EN_PN:RD_EN"  \
--"A_DOUT_EN_POLARITY:2"  \
--"A_DOUT_SRST_PN:RD_SRST_N"  \
--"A_DOUT_SRST_POLARITY:2"  \
--"ARST_N_POLARITY:2"  \
--"CASCADE:0"  \
--"CLK_EDGE:RISE"  \
--"CLKS:2"  \
--"CLOCK_PN:CLK"  \
--"DATA_IN_PN:WD"  \
--"DATA_OUT_PN:RD"  \
--"ECC:0"  \
--"IMPORT_FILE:"  \
--"INIT_RAM:F"  \
--"LPMTYPE:LPM_RAM"  \
--"PTYPE:1"  \
--"RADDRESS_PN:RADDR"  \
--"RCLK_EDGE:RISE"  \
--"RCLOCK_PN:RCLK"  \
--"RDEPTH:8"  \
--"RE_PN:REN"  \
--"RE_POLARITY:2"  \
--"RESET_PN:ARST_N"  \
--"RPMODE:0"  \
--"RWIDTH:8"  \
--"WADDRESS_PN:WADDR"  \
--"WCLK_EDGE:RISE"  \
--"WCLOCK_PN:WCLK"  \
--"WDEPTH:1"  \
--"WE_PN:WEN"  \
--"WE_POLARITY:1"  \
--"WWIDTH:64"   }
--# Exporting Component Description of MEM_FI to TCL done

----------------------------------------------------------------------
-- Libraries
----------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library smartfusion2;
use smartfusion2.all;
----------------------------------------------------------------------
-- MEM_FI entity declaration
----------------------------------------------------------------------
entity MEM_FI is
    -- Port list
    port(
        -- Inputs
        RADDR : in  std_logic_vector(2 downto 0);
        RCLK  : in  std_logic;
        WADDR : in  std_logic_vector(0 to 0);
        WCLK  : in  std_logic;
        WD    : in  std_logic_vector(63 downto 0);
        WEN   : in  std_logic;
        -- Outputs
        RD    : out std_logic_vector(7 downto 0)
        );
end MEM_FI;
----------------------------------------------------------------------
-- MEM_FI architecture body
----------------------------------------------------------------------
architecture RTL of MEM_FI is
----------------------------------------------------------------------
-- Component declarations
----------------------------------------------------------------------
-- MEM_FI_MEM_FI_0_TPSRAM   -   Actel:SgCore:TPSRAM:1.0.102
component MEM_FI_MEM_FI_0_TPSRAM
    -- Port list
    port(
        -- Inputs
        RADDR : in  std_logic_vector(2 downto 0);
        RCLK  : in  std_logic;
        WADDR : in  std_logic_vector(0 to 0);
        WCLK  : in  std_logic;
        WD    : in  std_logic_vector(63 downto 0);
        WEN   : in  std_logic;
        -- Outputs
        RD    : out std_logic_vector(7 downto 0)
        );
end component;
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
signal RD_net_0 : std_logic_vector(7 downto 0);
signal RD_net_1 : std_logic_vector(7 downto 0);
----------------------------------------------------------------------
-- TiedOff Signals
----------------------------------------------------------------------
signal GND_net  : std_logic;

begin
----------------------------------------------------------------------
-- Constant assignments
----------------------------------------------------------------------
 GND_net <= '0';
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 RD_net_1       <= RD_net_0;
 RD(7 downto 0) <= RD_net_1;
----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- MEM_FI_0   -   Actel:SgCore:TPSRAM:1.0.102
MEM_FI_0 : MEM_FI_MEM_FI_0_TPSRAM
    port map( 
        -- Inputs
        WEN   => WEN,
        WCLK  => WCLK,
        RCLK  => RCLK,
        WD    => WD,
        WADDR => WADDR,
        RADDR => RADDR,
        -- Outputs
        RD    => RD_net_0 
        );

end RTL;
