----------------------------------------------------------------------
-- Created by SmartDesign Tue Feb  6 22:59:44 2024
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
-- AUTO_PROCESS entity declaration
----------------------------------------------------------------------
entity AUTO_PROCESS is
    -- Port list
    port(
        -- Inputs
        RCLK              : in  std_logic;
        WCLK              : in  std_logic;
        dt_hndl_address   : in  std_logic_vector(31 downto 0);
        dt_hndl_data1     : in  std_logic_vector(31 downto 0);
        dt_hndl_data2     : in  std_logic_vector(31 downto 0);
        dt_hndl_option    : in  std_logic_vector(7 downto 0);
        dt_hndl_raddr     : in  std_logic_vector(10 downto 0);
        dt_hndl_ren       : in  std_logic;
        dt_hndl_start_axi : in  std_logic;
        uart_next_address : in  std_logic;
        -- Outputs
        AUTO_ON           : out std_logic;
        TPSRAM_RADDR      : out std_logic_vector(10 downto 0);
        TPSRAM_REN        : out std_logic;
        UART_START_AXI    : out std_logic;
        UART_USER_ADDRESS : out std_logic_vector(31 downto 0);
        UART_USER_DATA1   : out std_logic_vector(31 downto 0);
        UART_USER_DATA2   : out std_logic_vector(31 downto 0);
        UART_USER_OPTION  : out std_logic_vector(7 downto 0)
        );
end AUTO_PROCESS;
----------------------------------------------------------------------
-- AUTO_PROCESS architecture body
----------------------------------------------------------------------
architecture RTL of AUTO_PROCESS is
----------------------------------------------------------------------
-- Component declarations
----------------------------------------------------------------------
-- AUTO_AXI
component AUTO_AXI
    -- Port list
    port(
        -- Inputs
        READ_PROGRESS     : in  std_logic;
        WCLK              : in  std_logic;
        dt_hndl_address   : in  std_logic_vector(31 downto 0);
        dt_hndl_data1     : in  std_logic_vector(31 downto 0);
        dt_hndl_data2     : in  std_logic_vector(31 downto 0);
        dt_hndl_option    : in  std_logic_vector(7 downto 0);
        dt_hndl_start_axi : in  std_logic;
        uart_next_address : in  std_logic;
        -- Outputs
        AUTO              : out std_logic;
        END_AUTO_AXI      : out std_logic;
        UART_START_AXI    : out std_logic;
        UART_USER_ADDRESS : out std_logic_vector(31 downto 0);
        UART_USER_DATA1   : out std_logic_vector(31 downto 0);
        UART_USER_DATA2   : out std_logic_vector(31 downto 0);
        UART_USER_OPTION  : out std_logic_vector(7 downto 0)
        );
end component;
-- AUTO_READ
component AUTO_READ
    -- Port list
    port(
        -- Inputs
        CLK_ENABLE        : in  std_logic;
        END_AXI           : in  std_logic;
        RCLK              : in  std_logic;
        dt_hndl_raddr     : in  std_logic_vector(10 downto 0);
        dt_hndl_ren       : in  std_logic;
        start_auto        : in  std_logic;
        uart_next_address : in  std_logic;
        -- Outputs
        READ_PROGRESS     : out std_logic;
        TPSRAM_RADDR      : out std_logic_vector(10 downto 0);
        TPSRAM_REN        : out std_logic
        );
end component;
-- LED_BLOCK
component LED_BLOCK
    -- Port list
    port(
        -- Inputs
        CLK        : in  std_logic;
        start_auto : in  std_logic;
        -- Outputs
        AUTO_ON    : out std_logic
        );
end component;
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
signal AUTO_AXI_0_AUTO           : std_logic;
signal AUTO_AXI_0_END_AUTO_AXI   : std_logic;
signal AUTO_ON_net_0             : std_logic;
signal AUTO_READ_0_READ_PROGRESS : std_logic;
signal TPSRAM_RADDR_net_0        : std_logic_vector(10 downto 0);
signal TPSRAM_REN_net_0          : std_logic;
signal UART_START_AXI_net_0      : std_logic;
signal UART_USER_ADDRESS_net_0   : std_logic_vector(31 downto 0);
signal UART_USER_DATA1_net_0     : std_logic_vector(31 downto 0);
signal UART_USER_DATA2_net_0     : std_logic_vector(31 downto 0);
signal UART_USER_OPTION_net_0    : std_logic_vector(7 downto 0);
signal AUTO_ON_net_1             : std_logic;
signal UART_START_AXI_net_1      : std_logic;
signal TPSRAM_REN_net_1          : std_logic;
signal UART_USER_DATA2_net_1     : std_logic_vector(31 downto 0);
signal UART_USER_OPTION_net_1    : std_logic_vector(7 downto 0);
signal UART_USER_ADDRESS_net_1   : std_logic_vector(31 downto 0);
signal UART_USER_DATA1_net_1     : std_logic_vector(31 downto 0);
signal TPSRAM_RADDR_net_1        : std_logic_vector(10 downto 0);

begin
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 AUTO_ON_net_1                  <= AUTO_ON_net_0;
 AUTO_ON                        <= AUTO_ON_net_1;
 UART_START_AXI_net_1           <= UART_START_AXI_net_0;
 UART_START_AXI                 <= UART_START_AXI_net_1;
 TPSRAM_REN_net_1               <= TPSRAM_REN_net_0;
 TPSRAM_REN                     <= TPSRAM_REN_net_1;
 UART_USER_DATA2_net_1          <= UART_USER_DATA2_net_0;
 UART_USER_DATA2(31 downto 0)   <= UART_USER_DATA2_net_1;
 UART_USER_OPTION_net_1         <= UART_USER_OPTION_net_0;
 UART_USER_OPTION(7 downto 0)   <= UART_USER_OPTION_net_1;
 UART_USER_ADDRESS_net_1        <= UART_USER_ADDRESS_net_0;
 UART_USER_ADDRESS(31 downto 0) <= UART_USER_ADDRESS_net_1;
 UART_USER_DATA1_net_1          <= UART_USER_DATA1_net_0;
 UART_USER_DATA1(31 downto 0)   <= UART_USER_DATA1_net_1;
 TPSRAM_RADDR_net_1             <= TPSRAM_RADDR_net_0;
 TPSRAM_RADDR(10 downto 0)      <= TPSRAM_RADDR_net_1;
----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- AUTO_AXI_0
AUTO_AXI_0 : AUTO_AXI
    port map( 
        -- Inputs
        WCLK              => WCLK,
        READ_PROGRESS     => AUTO_READ_0_READ_PROGRESS,
        dt_hndl_start_axi => dt_hndl_start_axi,
        uart_next_address => uart_next_address,
        dt_hndl_option    => dt_hndl_option,
        dt_hndl_address   => dt_hndl_address,
        dt_hndl_data1     => dt_hndl_data1,
        dt_hndl_data2     => dt_hndl_data2,
        -- Outputs
        AUTO              => AUTO_AXI_0_AUTO,
        END_AUTO_AXI      => AUTO_AXI_0_END_AUTO_AXI,
        UART_START_AXI    => UART_START_AXI_net_0,
        UART_USER_OPTION  => UART_USER_OPTION_net_0,
        UART_USER_ADDRESS => UART_USER_ADDRESS_net_0,
        UART_USER_DATA1   => UART_USER_DATA1_net_0,
        UART_USER_DATA2   => UART_USER_DATA2_net_0 
        );
-- AUTO_READ_0
AUTO_READ_0 : AUTO_READ
    port map( 
        -- Inputs
        RCLK              => RCLK,
        CLK_ENABLE        => AUTO_ON_net_0,
        start_auto        => AUTO_AXI_0_AUTO,
        END_AXI           => AUTO_AXI_0_END_AUTO_AXI,
        uart_next_address => uart_next_address,
        dt_hndl_ren       => dt_hndl_ren,
        dt_hndl_raddr     => dt_hndl_raddr,
        -- Outputs
        READ_PROGRESS     => AUTO_READ_0_READ_PROGRESS,
        TPSRAM_REN        => TPSRAM_REN_net_0,
        TPSRAM_RADDR      => TPSRAM_RADDR_net_0 
        );
-- LED_BLOCK_0
LED_BLOCK_0 : LED_BLOCK
    port map( 
        -- Inputs
        CLK        => WCLK,
        start_auto => AUTO_AXI_0_AUTO,
        -- Outputs
        AUTO_ON    => AUTO_ON_net_0 
        );

end RTL;
