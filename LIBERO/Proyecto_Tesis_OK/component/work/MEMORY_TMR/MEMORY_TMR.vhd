----------------------------------------------------------------------
-- Created by SmartDesign Sat Mar  9 23:09:28 2024
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
-- MEMORY_TMR entity declaration
----------------------------------------------------------------------
entity MEMORY_TMR is
    -- Port list
    port(
        -- Inputs
        RADDR       : in  std_logic_vector(10 downto 0);
        RCLK        : in  std_logic;
        REN         : in  std_logic;
        WADDR       : in  std_logic_vector(7 downto 0);
        WCLK        : in  std_logic;
        WDATA       : in  std_logic_vector(63 downto 0);
        WEN01       : in  std_logic;
        WEN02       : in  std_logic;
        WEN03       : in  std_logic;
        -- Outputs
        error       : out std_logic;
        tpsram_DATA : out std_logic_vector(7 downto 0)
        );
end MEMORY_TMR;
----------------------------------------------------------------------
-- MEMORY_TMR architecture body
----------------------------------------------------------------------
architecture RTL of MEMORY_TMR is
----------------------------------------------------------------------
-- Component declarations
----------------------------------------------------------------------
-- COMPARADOR
-- using entity instantiation for component COMPARADOR
-- TMR_NFTVC
-- using entity instantiation for component TMR_NFTVC
-- TPSRAM_C1
component TPSRAM_C1
    -- Port list
    port(
        -- Inputs
        RADDR : in  std_logic_vector(10 downto 0);
        RCLK  : in  std_logic;
        REN   : in  std_logic;
        WADDR : in  std_logic_vector(7 downto 0);
        WCLK  : in  std_logic;
        WD    : in  std_logic_vector(63 downto 0);
        WEN   : in  std_logic;
        -- Outputs
        RD    : out std_logic_vector(7 downto 0)
        );
end component;
-- TPSRAM_C2
component TPSRAM_C2
    -- Port list
    port(
        -- Inputs
        RADDR : in  std_logic_vector(10 downto 0);
        RCLK  : in  std_logic;
        REN   : in  std_logic;
        WADDR : in  std_logic_vector(7 downto 0);
        WCLK  : in  std_logic;
        WD    : in  std_logic_vector(63 downto 0);
        WEN   : in  std_logic;
        -- Outputs
        RD    : out std_logic_vector(7 downto 0)
        );
end component;
-- TPSRAM_C3
component TPSRAM_C3
    -- Port list
    port(
        -- Inputs
        RADDR : in  std_logic_vector(10 downto 0);
        RCLK  : in  std_logic;
        REN   : in  std_logic;
        WADDR : in  std_logic_vector(7 downto 0);
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
signal error_0           : std_logic;
signal tpsram_1MEM_0     : std_logic_vector(7 downto 0);
signal tpsram_1MEM_2     : std_logic_vector(7 downto 0);
signal tpsram_1MEM_3     : std_logic_vector(7 downto 0);
signal tpsram_DATA_net_0 : std_logic_vector(7 downto 0);
signal error_0_net_0     : std_logic;
signal tpsram_DATA_net_1 : std_logic_vector(7 downto 0);

begin
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 error_0_net_0           <= error_0;
 error                   <= error_0_net_0;
 tpsram_DATA_net_1       <= tpsram_DATA_net_0;
 tpsram_DATA(7 downto 0) <= tpsram_DATA_net_1;
----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- COMPARADOR_0
COMPARADOR_0 : entity work.COMPARADOR
    generic map( 
        width_data => ( 8 )
        )
    port map( 
        -- Inputs
        CLK   => RCLK,
        REN   => REN,
        A_in  => tpsram_1MEM_3,
        B_in  => tpsram_1MEM_0,
        C_in  => tpsram_1MEM_2,
        -- Outputs
        error => error_0 
        );
-- TMR_NFTVC_0
TMR_NFTVC_0 : entity work.TMR_NFTVC
    generic map( 
        width_data => ( 8 )
        )
    port map( 
        -- Inputs
        CLK  => RCLK,
        REN  => REN,
        A_in => tpsram_1MEM_3,
        B_in => tpsram_1MEM_0,
        C_in => tpsram_1MEM_2,
        -- Outputs
        V    => tpsram_DATA_net_0 
        );
-- TPSRAM_C1_0
TPSRAM_C1_0 : TPSRAM_C1
    port map( 
        -- Inputs
        WEN   => WEN01,
        REN   => REN,
        WCLK  => WCLK,
        RCLK  => RCLK,
        WD    => WDATA,
        WADDR => WADDR,
        RADDR => RADDR,
        -- Outputs
        RD    => tpsram_1MEM_3 
        );
-- TPSRAM_C2_0
TPSRAM_C2_0 : TPSRAM_C2
    port map( 
        -- Inputs
        WEN   => WEN02,
        REN   => REN,
        WCLK  => WCLK,
        RCLK  => RCLK,
        WD    => WDATA,
        WADDR => WADDR,
        RADDR => RADDR,
        -- Outputs
        RD    => tpsram_1MEM_0 
        );
-- TPSRAM_C3_0
TPSRAM_C3_0 : TPSRAM_C3
    port map( 
        -- Inputs
        WEN   => WEN03,
        REN   => REN,
        WCLK  => WCLK,
        RCLK  => RCLK,
        WD    => WDATA,
        WADDR => WADDR,
        RADDR => RADDR,
        -- Outputs
        RD    => tpsram_1MEM_2 
        );

end RTL;
