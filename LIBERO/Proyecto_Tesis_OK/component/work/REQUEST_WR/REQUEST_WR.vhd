----------------------------------------------------------------------
-- Created by SmartDesign Sat Mar  9 23:06:28 2024
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
-- REQUEST_WR entity declaration
----------------------------------------------------------------------
entity REQUEST_WR is
    -- Port list
    port(
        -- Inputs
        AXI_RBUSY     : in  std_logic;
        AXI_WBUSY     : in  std_logic;
        BIF_1_PADDR   : in  std_logic_vector(31 downto 0);
        BIF_1_PENABLE : in  std_logic;
        BIF_1_PSEL    : in  std_logic;
        BIF_1_PWDATA  : in  std_logic_vector(31 downto 0);
        BIF_1_PWRITE  : in  std_logic;
        BREADY        : in  std_logic;
        PRESETN       : in  std_logic;
        RCLK          : in  std_logic;
        RLAST         : in  std_logic;
        RREADY        : in  std_logic;
        RVALID        : in  std_logic;
        WCLK          : in  std_logic;
        tpsram_1MEM   : in  std_logic_vector(7 downto 0);
        tpsram_DATA   : in  std_logic_vector(7 downto 0);
        -- Outputs
        BIF_1_PRDATA  : out std_logic_vector(7 downto 0);
        BIF_1_PREADY  : out std_logic;
        BIF_1_PSLVERR : out std_logic;
        End_Write     : out std_logic;
        Next_Address  : out std_logic;
        RAM01_EN      : out std_logic;
        RAM02_EN      : out std_logic;
        RAM03_EN      : out std_logic;
        RAM04_EN      : out std_logic;
        RD_ADDR       : out std_logic_vector(31 downto 0);
        READ          : out std_logic;
        RLEN          : out std_logic_vector(3 downto 0);
        TPSRAM_WADDR  : out std_logic_vector(7 downto 0);
        WDATA_SDRAM   : out std_logic_vector(63 downto 0);
        WLEN          : out std_logic_vector(3 downto 0);
        WRITE         : out std_logic;
        WR_ADDR       : out std_logic_vector(31 downto 0);
        sple_rd_RADDR : out std_logic_vector(2 downto 0);
        tpsram_RADDR  : out std_logic_vector(10 downto 0);
        tpsram_REN    : out std_logic
        );
end REQUEST_WR;
----------------------------------------------------------------------
-- REQUEST_WR architecture body
----------------------------------------------------------------------
architecture RTL of REQUEST_WR is
----------------------------------------------------------------------
-- Component declarations
----------------------------------------------------------------------
-- DATA_HANDLE_FSM_V2
-- using entity instantiation for component DATA_HANDLE_FSM_V2
-- UART_BRIDGE_IF
component UART_BRIDGE_IF
    -- Port list
    port(
        -- Inputs
        AXI_RBUSY         : in  std_logic;
        AXI_WBUSY         : in  std_logic;
        BREADY            : in  std_logic;
        CLK               : in  std_logic;
        RESET_N           : in  std_logic;
        RLAST             : in  std_logic;
        RREADY            : in  std_logic;
        RVALID            : in  std_logic;
        auto_hndl_address : in  std_logic_vector(31 downto 0);
        auto_hndl_data1   : in  std_logic_vector(31 downto 0);
        auto_hndl_data2   : in  std_logic_vector(31 downto 0);
        auto_hndl_option  : in  std_logic_vector(7 downto 0);
        start_axi         : in  std_logic;
        -- Outputs
        End_Write         : out std_logic;
        Next_Address      : out std_logic;
        RAM01_EN          : out std_logic;
        RAM02_EN          : out std_logic;
        RAM03_EN          : out std_logic;
        RAM04_EN          : out std_logic;
        RD_ADDR           : out std_logic_vector(31 downto 0);
        RD_START          : out std_logic;
        RLEN              : out std_logic_vector(3 downto 0);
        TPSRAM_WADDR      : out std_logic_vector(7 downto 0);
        WDATA_SDRAM       : out std_logic_vector(63 downto 0);
        WLEN              : out std_logic_vector(3 downto 0);
        WR_ADDR           : out std_logic_vector(31 downto 0);
        WR_START          : out std_logic
        );
end component;
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
signal BIF_1_PRDATA_net_0                     : std_logic_vector(7 downto 0);
signal BIF_1_PREADY_net_0                     : std_logic;
signal BIF_1_PSLVERR_net_0                    : std_logic;
signal DATA_HANDLE_FSM_V2_0_uart_start_axi    : std_logic;
signal DATA_HANDLE_FSM_V2_0_uart_user_address : std_logic_vector(31 downto 0);
signal DATA_HANDLE_FSM_V2_0_uart_user_data1   : std_logic_vector(31 downto 0);
signal DATA_HANDLE_FSM_V2_0_uart_user_data2   : std_logic_vector(31 downto 0);
signal DATA_HANDLE_FSM_V2_0_uart_user_option  : std_logic_vector(7 downto 0);
signal End_Write_net_0                        : std_logic;
signal Next_Address_net_0                     : std_logic;
signal RAM01_EN_net_0                         : std_logic;
signal RAM02_EN_net_0                         : std_logic;
signal RAM03_EN_net_0                         : std_logic;
signal RAM04_EN_net_0                         : std_logic;
signal RD_ADDR_net_0                          : std_logic_vector(31 downto 0);
signal READ_net_0                             : std_logic;
signal RLEN_net_0                             : std_logic_vector(3 downto 0);
signal sple_rd_RADDR_net_0                    : std_logic_vector(2 downto 0);
signal tpsram_RADDR_net_0                     : std_logic_vector(10 downto 0);
signal tpsram_REN_net_0                       : std_logic;
signal TPSRAM_WADDR_net_0                     : std_logic_vector(7 downto 0);
signal WDATA_SDRAM_net_0                      : std_logic_vector(63 downto 0);
signal WLEN_net_0                             : std_logic_vector(3 downto 0);
signal WR_ADDR_net_0                          : std_logic_vector(31 downto 0);
signal WRITE_net_0                            : std_logic;
signal READ_net_1                             : std_logic;
signal RAM02_EN_net_1                         : std_logic;
signal RAM01_EN_net_1                         : std_logic;
signal WRITE_net_1                            : std_logic;
signal RAM03_EN_net_1                         : std_logic;
signal tpsram_REN_net_1                       : std_logic;
signal End_Write_net_1                        : std_logic;
signal Next_Address_net_1                     : std_logic;
signal RLEN_net_1                             : std_logic_vector(3 downto 0);
signal TPSRAM_WADDR_net_1                     : std_logic_vector(7 downto 0);
signal WLEN_net_1                             : std_logic_vector(3 downto 0);
signal WDATA_SDRAM_net_1                      : std_logic_vector(63 downto 0);
signal RD_ADDR_net_1                          : std_logic_vector(31 downto 0);
signal WR_ADDR_net_1                          : std_logic_vector(31 downto 0);
signal tpsram_RADDR_net_1                     : std_logic_vector(10 downto 0);
signal RAM04_EN_net_1                         : std_logic;
signal BIF_1_PRDATA_net_1                     : std_logic_vector(7 downto 0);
signal BIF_1_PREADY_net_1                     : std_logic;
signal BIF_1_PSLVERR_net_1                    : std_logic;
signal sple_rd_RADDR_net_1                    : std_logic_vector(2 downto 0);

begin
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 READ_net_1                <= READ_net_0;
 READ                      <= READ_net_1;
 RAM02_EN_net_1            <= RAM02_EN_net_0;
 RAM02_EN                  <= RAM02_EN_net_1;
 RAM01_EN_net_1            <= RAM01_EN_net_0;
 RAM01_EN                  <= RAM01_EN_net_1;
 WRITE_net_1               <= WRITE_net_0;
 WRITE                     <= WRITE_net_1;
 RAM03_EN_net_1            <= RAM03_EN_net_0;
 RAM03_EN                  <= RAM03_EN_net_1;
 tpsram_REN_net_1          <= tpsram_REN_net_0;
 tpsram_REN                <= tpsram_REN_net_1;
 End_Write_net_1           <= End_Write_net_0;
 End_Write                 <= End_Write_net_1;
 Next_Address_net_1        <= Next_Address_net_0;
 Next_Address              <= Next_Address_net_1;
 RLEN_net_1                <= RLEN_net_0;
 RLEN(3 downto 0)          <= RLEN_net_1;
 TPSRAM_WADDR_net_1        <= TPSRAM_WADDR_net_0;
 TPSRAM_WADDR(7 downto 0)  <= TPSRAM_WADDR_net_1;
 WLEN_net_1                <= WLEN_net_0;
 WLEN(3 downto 0)          <= WLEN_net_1;
 WDATA_SDRAM_net_1         <= WDATA_SDRAM_net_0;
 WDATA_SDRAM(63 downto 0)  <= WDATA_SDRAM_net_1;
 RD_ADDR_net_1             <= RD_ADDR_net_0;
 RD_ADDR(31 downto 0)      <= RD_ADDR_net_1;
 WR_ADDR_net_1             <= WR_ADDR_net_0;
 WR_ADDR(31 downto 0)      <= WR_ADDR_net_1;
 tpsram_RADDR_net_1        <= tpsram_RADDR_net_0;
 tpsram_RADDR(10 downto 0) <= tpsram_RADDR_net_1;
 RAM04_EN_net_1            <= RAM04_EN_net_0;
 RAM04_EN                  <= RAM04_EN_net_1;
 BIF_1_PRDATA_net_1        <= BIF_1_PRDATA_net_0;
 BIF_1_PRDATA(7 downto 0)  <= BIF_1_PRDATA_net_1;
 BIF_1_PREADY_net_1        <= BIF_1_PREADY_net_0;
 BIF_1_PREADY              <= BIF_1_PREADY_net_1;
 BIF_1_PSLVERR_net_1       <= BIF_1_PSLVERR_net_0;
 BIF_1_PSLVERR             <= BIF_1_PSLVERR_net_1;
 sple_rd_RADDR_net_1       <= sple_rd_RADDR_net_0;
 sple_rd_RADDR(2 downto 0) <= sple_rd_RADDR_net_1;
----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- DATA_HANDLE_FSM_V2_0
DATA_HANDLE_FSM_V2_0 : entity work.DATA_HANDLE_FSM_V2
    generic map( 
        ADDR_WIDTH        => ( 32 ),
        ADDR_WIDTH_TPSRAM => ( 11 ),
        DATA_WIDTH        => ( 32 ),
        DATA_WIDTH_TPSRAM => ( 8 )
        )
    port map( 
        -- Inputs
        tpsram_DATA       => tpsram_DATA,
        tpsram_1MEM       => tpsram_1MEM,
        PCLK              => RCLK,
        PRESETn           => PRESETN,
        PSEL              => BIF_1_PSEL,
        PENABLE           => BIF_1_PENABLE,
        PWRITE            => BIF_1_PWRITE,
        PADDR             => BIF_1_PADDR,
        PWDATA            => BIF_1_PWDATA,
        -- Outputs
        uart_user_option  => DATA_HANDLE_FSM_V2_0_uart_user_option,
        uart_user_address => DATA_HANDLE_FSM_V2_0_uart_user_address,
        uart_user_data1   => DATA_HANDLE_FSM_V2_0_uart_user_data1,
        uart_user_data2   => DATA_HANDLE_FSM_V2_0_uart_user_data2,
        uart_start_axi    => DATA_HANDLE_FSM_V2_0_uart_start_axi,
        tpsram_REN        => tpsram_REN_net_0,
        tpsram_RADDR      => tpsram_RADDR_net_0,
        sple_rd_RADDR     => sple_rd_RADDR_net_0,
        PRDATA            => BIF_1_PRDATA_net_0,
        PREADY            => BIF_1_PREADY_net_0,
        PSLVEER           => BIF_1_PSLVERR_net_0 
        );
-- UART_IF_FSM_0
UART_IF_FSM_0 : UART_BRIDGE_IF
    port map( 
        -- Inputs
        CLK               => WCLK,
        RESET_N           => PRESETN,
        start_axi         => DATA_HANDLE_FSM_V2_0_uart_start_axi,
        auto_hndl_option  => DATA_HANDLE_FSM_V2_0_uart_user_option,
        auto_hndl_address => DATA_HANDLE_FSM_V2_0_uart_user_address,
        auto_hndl_data1   => DATA_HANDLE_FSM_V2_0_uart_user_data1,
        auto_hndl_data2   => DATA_HANDLE_FSM_V2_0_uart_user_data2,
        AXI_WBUSY         => AXI_WBUSY,
        AXI_RBUSY         => AXI_RBUSY,
        RVALID            => RVALID,
        RLAST             => RLAST,
        BREADY            => BREADY,
        RREADY            => RREADY,
        -- Outputs
        WR_START          => WRITE_net_0,
        RD_START          => READ_net_0,
        WLEN              => WLEN_net_0,
        RLEN              => RLEN_net_0,
        WR_ADDR           => WR_ADDR_net_0,
        RD_ADDR           => RD_ADDR_net_0,
        WDATA_SDRAM       => WDATA_SDRAM_net_0,
        TPSRAM_WADDR      => TPSRAM_WADDR_net_0,
        RAM01_EN          => RAM01_EN_net_0,
        RAM02_EN          => RAM02_EN_net_0,
        RAM03_EN          => RAM03_EN_net_0,
        RAM04_EN          => RAM04_EN_net_0,
        Next_Address      => Next_Address_net_0,
        End_Write         => End_Write_net_0 
        );

end RTL;
