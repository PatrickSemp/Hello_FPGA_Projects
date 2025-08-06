----------------------------------------------------------------------
-- Created by SmartDesign Sat Mar  9 23:09:12 2024
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
-- TMR_3PS entity declaration
----------------------------------------------------------------------
entity TMR_3PS is
    -- Port list
    port(
        -- Inputs
        DEVRST_N_0              : in    std_logic;
        MDDR_DQS_TMATCH_0_IN_0  : in    std_logic;
        MMUART_0_RXD_F2M        : in    std_logic;
        -- Outputs
        MDDR_ADDR_0             : out   std_logic_vector(15 downto 0);
        MDDR_BA_0               : out   std_logic_vector(2 downto 0);
        MDDR_CAS_N_0            : out   std_logic;
        MDDR_CKE_0              : out   std_logic;
        MDDR_CLK_0              : out   std_logic;
        MDDR_CLK_N_0            : out   std_logic;
        MDDR_CS_N_0             : out   std_logic;
        MDDR_DQS_TMATCH_0_OUT_0 : out   std_logic;
        MDDR_ODT_0              : out   std_logic;
        MDDR_RAS_N_0            : out   std_logic;
        MDDR_RESET_N_0          : out   std_logic;
        MDDR_WE_N_0             : out   std_logic;
        MMUART_0_TXD_M2F        : out   std_logic;
        -- Inouts
        MDDR_DM_RDQS_0          : inout std_logic_vector(0 to 0);
        MDDR_DQS_0              : inout std_logic_vector(0 to 0);
        MDDR_DQS_N_0            : inout std_logic_vector(0 to 0);
        MDDR_DQ_0               : inout std_logic_vector(7 downto 0)
        );
end TMR_3PS;
----------------------------------------------------------------------
-- TMR_3PS architecture body
----------------------------------------------------------------------
architecture RTL of TMR_3PS is
----------------------------------------------------------------------
-- Component declarations
----------------------------------------------------------------------
-- REQUEST_WR
component REQUEST_WR
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
end component;
-- MEMORY_TMR
component MEMORY_TMR
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
end component;
-- MEM_FI
component MEM_FI
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
-- MDDR_Demo_TOP
component MDDR_Demo_TOP
    -- Port list
    port(
        -- Inputs
        AMBA_SLAVE_0_PRDATAS0     : in    std_logic_vector(31 downto 0);
        AMBA_SLAVE_0_PREADYS0     : in    std_logic;
        AMBA_SLAVE_0_PSLVERRS0    : in    std_logic;
        ARADDR_int                : in    std_logic_vector(31 downto 0);
        AWADDR_int                : in    std_logic_vector(31 downto 0);
        DEVRST_N_0                : in    std_logic;
        GPIO_0_F2M                : in    std_logic;
        GPIO_1_F2M                : in    std_logic;
        MDDR_DQS_TMATCH_0_IN_0    : in    std_logic;
        MMUART_0_RXD_F2M          : in    std_logic;
        RLEN                      : in    std_logic_vector(3 downto 0);
        WDATA_int_input           : in    std_logic_vector(63 downto 0);
        WLEN                      : in    std_logic_vector(3 downto 0);
        read_start                : in    std_logic;
        write_start               : in    std_logic;
        -- Outputs
        AMBA_MASTER_0_RDATA_M0    : out   std_logic_vector(63 downto 0);
        AMBA_MASTER_0_RLAST_M0    : out   std_logic;
        AMBA_MASTER_0_RVALID_M0   : out   std_logic;
        AMBA_SLAVE_0_PADDRS       : out   std_logic_vector(31 downto 0);
        AMBA_SLAVE_0_PENABLES     : out   std_logic;
        AMBA_SLAVE_0_PSELS0       : out   std_logic;
        AMBA_SLAVE_0_PWDATAS      : out   std_logic_vector(31 downto 0);
        AMBA_SLAVE_0_PWRITES      : out   std_logic;
        AXI_RBUSY                 : out   std_logic;
        AXI_WBUSY                 : out   std_logic;
        BREADY                    : out   std_logic;
        FIC_0_CLK                 : out   std_logic;
        INIT_DONE                 : out   std_logic;
        MDDR_ADDR_0               : out   std_logic_vector(15 downto 0);
        MDDR_BA_0                 : out   std_logic_vector(2 downto 0);
        MDDR_CAS_N_0              : out   std_logic;
        MDDR_CKE_0                : out   std_logic;
        MDDR_CLK_0                : out   std_logic;
        MDDR_CLK_N_0              : out   std_logic;
        MDDR_CS_N_0               : out   std_logic;
        MDDR_DQS_TMATCH_0_OUT_0   : out   std_logic;
        MDDR_ODT_0                : out   std_logic;
        MDDR_RAS_N_0              : out   std_logic;
        MDDR_RESET_N_0            : out   std_logic;
        MDDR_WE_N_0               : out   std_logic;
        MMUART_0_TXD_M2F          : out   std_logic;
        MSS_DDR_FIC_SUBSYSTEM_CLK : out   std_logic;
        RREADY                    : out   std_logic;
        -- Inouts
        MDDR_DM_RDQS_0            : inout std_logic_vector(0 to 0);
        MDDR_DQS_0                : inout std_logic_vector(0 to 0);
        MDDR_DQS_N_0              : inout std_logic_vector(0 to 0);
        MDDR_DQ_0                 : inout std_logic_vector(7 downto 0)
        );
end component;
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
signal MANEJO_SOLICITUDES_RAM01_EN          : std_logic;
signal MANEJO_SOLICITUDES_RAM02_EN          : std_logic;
signal MANEJO_SOLICITUDES_RAM03_EN          : std_logic;
signal MANEJO_SOLICITUDES_RAM04_EN          : std_logic;
signal MANEJO_SOLICITUDES_READ              : std_logic;
signal MANEJO_SOLICITUDES_RLEN              : std_logic_vector(3 downto 0);
signal MANEJO_SOLICITUDES_sple_rd_RADDR     : std_logic_vector(2 downto 0);
signal MANEJO_SOLICITUDES_tpsram_RADDR      : std_logic_vector(10 downto 0);
signal MANEJO_SOLICITUDES_tpsram_REN        : std_logic;
signal MANEJO_SOLICITUDES_TPSRAM_WADDR      : std_logic_vector(7 downto 0);
signal MANEJO_SOLICITUDES_WLEN              : std_logic_vector(3 downto 0);
signal MANEJO_SOLICITUDES_WRITE             : std_logic;
signal MDDR_ADDR_0_net_0                    : std_logic_vector(15 downto 0);
signal MDDR_BA_0_net_0                      : std_logic_vector(2 downto 0);
signal MDDR_CAS_N_0_net_0                   : std_logic;
signal MDDR_CKE_0_net_0                     : std_logic;
signal MDDR_CLK_0_net_0                     : std_logic;
signal MDDR_CLK_N_0_net_0                   : std_logic;
signal MDDR_CS_N_0_net_0                    : std_logic;
signal MDDR_Demo_TOP_0_AMBA_SLAVE_0_PADDR   : std_logic_vector(31 downto 0);
signal MDDR_Demo_TOP_0_AMBA_SLAVE_0_PENABLE : std_logic;
signal MDDR_Demo_TOP_0_AMBA_SLAVE_0_PREADY  : std_logic;
signal MDDR_Demo_TOP_0_AMBA_SLAVE_0_PSELx   : std_logic;
signal MDDR_Demo_TOP_0_AMBA_SLAVE_0_PSLVERR : std_logic;
signal MDDR_Demo_TOP_0_AMBA_SLAVE_0_PWDATA  : std_logic_vector(31 downto 0);
signal MDDR_Demo_TOP_0_AMBA_SLAVE_0_PWRITE  : std_logic;
signal MDDR_DQS_TMATCH_0_OUT_0_net_0        : std_logic;
signal MDDR_ODT_0_net_0                     : std_logic;
signal MDDR_RAS_N_0_net_0                   : std_logic;
signal MDDR_RESET_N_0_net_0                 : std_logic;
signal MDDR_WE_N_0_net_0                    : std_logic;
signal MEM_FI_0_RD                          : std_logic_vector(7 downto 0);
signal MEMORY_TMR_0_error                   : std_logic;
signal MMUART_0_TXD_M2F_net_0               : std_logic;
signal REDUNDANCIA_tpsram_DATA              : std_logic_vector(7 downto 0);
signal UART_IF_SN_AUTO_0_End_Write          : std_logic;
signal UART_IF_SN_AUTO_0_RD_ADDR            : std_logic_vector(31 downto 0);
signal UART_IF_SN_AUTO_0_WDATA_SDRAM        : std_logic_vector(63 downto 0);
signal UART_IF_SN_AUTO_0_WR_ADDR            : std_logic_vector(31 downto 0);
signal WR_MDDR_AMBA_MASTER_0_RDATA_M0       : std_logic_vector(63 downto 0);
signal WR_MDDR_AMBA_MASTER_0_RLAST_M0       : std_logic;
signal WR_MDDR_AMBA_MASTER_0_RVALID_M0      : std_logic;
signal WR_MDDR_AXI_RBUSY                    : std_logic;
signal WR_MDDR_AXI_WBUSY                    : std_logic;
signal WR_MDDR_BREADY                       : std_logic;
signal WR_MDDR_FIC_0_CLK                    : std_logic;
signal WR_MDDR_INIT_DONE                    : std_logic;
signal WR_MDDR_MSS_DDR_FIC_SUBSYSTEM_CLK    : std_logic;
signal WR_MDDR_RREADY                       : std_logic;
signal MDDR_DQS_TMATCH_0_OUT_0_net_1        : std_logic;
signal MDDR_CAS_N_0_net_1                   : std_logic;
signal MDDR_CLK_0_net_1                     : std_logic;
signal MDDR_CLK_N_0_net_1                   : std_logic;
signal MDDR_CKE_0_net_1                     : std_logic;
signal MDDR_CS_N_0_net_1                    : std_logic;
signal MDDR_ODT_0_net_1                     : std_logic;
signal MDDR_RAS_N_0_net_1                   : std_logic;
signal MDDR_RESET_N_0_net_1                 : std_logic;
signal MDDR_WE_N_0_net_1                    : std_logic;
signal MMUART_0_TXD_M2F_net_1               : std_logic;
signal MDDR_ADDR_0_net_1                    : std_logic_vector(15 downto 0);
signal MDDR_BA_0_net_1                      : std_logic_vector(2 downto 0);
----------------------------------------------------------------------
-- TiedOff Signals
----------------------------------------------------------------------
signal GND_net                              : std_logic;
----------------------------------------------------------------------
-- Bus Interface Nets Declarations - Unequal Pin Widths
----------------------------------------------------------------------
signal MDDR_Demo_TOP_0_AMBA_SLAVE_0_PRDATA  : std_logic_vector(7 downto 0);
signal MDDR_Demo_TOP_0_AMBA_SLAVE_0_PRDATA_0: std_logic_vector(31 downto 0);
signal MDDR_Demo_TOP_0_AMBA_SLAVE_0_PRDATA_0_31to8: std_logic_vector(31 downto 8);
signal MDDR_Demo_TOP_0_AMBA_SLAVE_0_PRDATA_0_7to0: std_logic_vector(7 downto 0);


begin
----------------------------------------------------------------------
-- Constant assignments
----------------------------------------------------------------------
 GND_net    <= '0';
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 MDDR_DQS_TMATCH_0_OUT_0_net_1 <= MDDR_DQS_TMATCH_0_OUT_0_net_0;
 MDDR_DQS_TMATCH_0_OUT_0       <= MDDR_DQS_TMATCH_0_OUT_0_net_1;
 MDDR_CAS_N_0_net_1            <= MDDR_CAS_N_0_net_0;
 MDDR_CAS_N_0                  <= MDDR_CAS_N_0_net_1;
 MDDR_CLK_0_net_1              <= MDDR_CLK_0_net_0;
 MDDR_CLK_0                    <= MDDR_CLK_0_net_1;
 MDDR_CLK_N_0_net_1            <= MDDR_CLK_N_0_net_0;
 MDDR_CLK_N_0                  <= MDDR_CLK_N_0_net_1;
 MDDR_CKE_0_net_1              <= MDDR_CKE_0_net_0;
 MDDR_CKE_0                    <= MDDR_CKE_0_net_1;
 MDDR_CS_N_0_net_1             <= MDDR_CS_N_0_net_0;
 MDDR_CS_N_0                   <= MDDR_CS_N_0_net_1;
 MDDR_ODT_0_net_1              <= MDDR_ODT_0_net_0;
 MDDR_ODT_0                    <= MDDR_ODT_0_net_1;
 MDDR_RAS_N_0_net_1            <= MDDR_RAS_N_0_net_0;
 MDDR_RAS_N_0                  <= MDDR_RAS_N_0_net_1;
 MDDR_RESET_N_0_net_1          <= MDDR_RESET_N_0_net_0;
 MDDR_RESET_N_0                <= MDDR_RESET_N_0_net_1;
 MDDR_WE_N_0_net_1             <= MDDR_WE_N_0_net_0;
 MDDR_WE_N_0                   <= MDDR_WE_N_0_net_1;
 MMUART_0_TXD_M2F_net_1        <= MMUART_0_TXD_M2F_net_0;
 MMUART_0_TXD_M2F              <= MMUART_0_TXD_M2F_net_1;
 MDDR_ADDR_0_net_1             <= MDDR_ADDR_0_net_0;
 MDDR_ADDR_0(15 downto 0)      <= MDDR_ADDR_0_net_1;
 MDDR_BA_0_net_1               <= MDDR_BA_0_net_0;
 MDDR_BA_0(2 downto 0)         <= MDDR_BA_0_net_1;
----------------------------------------------------------------------
-- Bus Interface Nets Assignments - Unequal Pin Widths
----------------------------------------------------------------------
 MDDR_Demo_TOP_0_AMBA_SLAVE_0_PRDATA_0(31 downto 0) <= ( MDDR_Demo_TOP_0_AMBA_SLAVE_0_PRDATA_0_31to8(31 downto 8) & MDDR_Demo_TOP_0_AMBA_SLAVE_0_PRDATA_0_7to0(7 downto 0) );
 MDDR_Demo_TOP_0_AMBA_SLAVE_0_PRDATA_0_31to8(31 downto 8) <= B"000000000000000000000000";
 MDDR_Demo_TOP_0_AMBA_SLAVE_0_PRDATA_0_7to0(7 downto 0) <= MDDR_Demo_TOP_0_AMBA_SLAVE_0_PRDATA(7 downto 0);

----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- MANEJO_SOLICITUDES
MANEJO_SOLICITUDES : REQUEST_WR
    port map( 
        -- Inputs
        BREADY        => WR_MDDR_BREADY,
        AXI_WBUSY     => WR_MDDR_AXI_WBUSY,
        RCLK          => WR_MDDR_FIC_0_CLK,
        RVALID        => WR_MDDR_AMBA_MASTER_0_RVALID_M0,
        WCLK          => WR_MDDR_MSS_DDR_FIC_SUBSYSTEM_CLK,
        AXI_RBUSY     => WR_MDDR_AXI_RBUSY,
        RLAST         => WR_MDDR_AMBA_MASTER_0_RLAST_M0,
        RREADY        => WR_MDDR_RREADY,
        PRESETN       => WR_MDDR_INIT_DONE,
        tpsram_DATA   => REDUNDANCIA_tpsram_DATA,
        tpsram_1MEM   => MEM_FI_0_RD,
        BIF_1_PADDR   => MDDR_Demo_TOP_0_AMBA_SLAVE_0_PADDR,
        BIF_1_PENABLE => MDDR_Demo_TOP_0_AMBA_SLAVE_0_PENABLE,
        BIF_1_PWRITE  => MDDR_Demo_TOP_0_AMBA_SLAVE_0_PWRITE,
        BIF_1_PWDATA  => MDDR_Demo_TOP_0_AMBA_SLAVE_0_PWDATA,
        BIF_1_PSEL    => MDDR_Demo_TOP_0_AMBA_SLAVE_0_PSELx,
        -- Outputs
        READ          => MANEJO_SOLICITUDES_READ,
        RAM02_EN      => MANEJO_SOLICITUDES_RAM02_EN,
        RAM01_EN      => MANEJO_SOLICITUDES_RAM01_EN,
        WRITE         => MANEJO_SOLICITUDES_WRITE,
        RAM03_EN      => MANEJO_SOLICITUDES_RAM03_EN,
        tpsram_REN    => MANEJO_SOLICITUDES_tpsram_REN,
        End_Write     => UART_IF_SN_AUTO_0_End_Write,
        Next_Address  => OPEN,
        RLEN          => MANEJO_SOLICITUDES_RLEN,
        TPSRAM_WADDR  => MANEJO_SOLICITUDES_TPSRAM_WADDR,
        WLEN          => MANEJO_SOLICITUDES_WLEN,
        WDATA_SDRAM   => UART_IF_SN_AUTO_0_WDATA_SDRAM,
        RD_ADDR       => UART_IF_SN_AUTO_0_RD_ADDR,
        WR_ADDR       => UART_IF_SN_AUTO_0_WR_ADDR,
        tpsram_RADDR  => MANEJO_SOLICITUDES_tpsram_RADDR,
        RAM04_EN      => MANEJO_SOLICITUDES_RAM04_EN,
        BIF_1_PRDATA  => MDDR_Demo_TOP_0_AMBA_SLAVE_0_PRDATA,
        BIF_1_PREADY  => MDDR_Demo_TOP_0_AMBA_SLAVE_0_PREADY,
        BIF_1_PSLVERR => MDDR_Demo_TOP_0_AMBA_SLAVE_0_PSLVERR,
        sple_rd_RADDR => MANEJO_SOLICITUDES_sple_rd_RADDR 
        );
-- REDUNDANCIA
REDUNDANCIA : MEMORY_TMR
    port map( 
        -- Inputs
        WCLK        => WR_MDDR_MSS_DDR_FIC_SUBSYSTEM_CLK,
        WEN01       => MANEJO_SOLICITUDES_RAM01_EN,
        WEN02       => MANEJO_SOLICITUDES_RAM02_EN,
        WEN03       => MANEJO_SOLICITUDES_RAM03_EN,
        REN         => MANEJO_SOLICITUDES_tpsram_REN,
        RCLK        => WR_MDDR_FIC_0_CLK,
        WADDR       => MANEJO_SOLICITUDES_TPSRAM_WADDR,
        WDATA       => WR_MDDR_AMBA_MASTER_0_RDATA_M0,
        RADDR       => MANEJO_SOLICITUDES_tpsram_RADDR,
        -- Outputs
        error       => MEMORY_TMR_0_error,
        tpsram_DATA => REDUNDANCIA_tpsram_DATA 
        );
-- SIMPLE_READ
SIMPLE_READ : MEM_FI
    port map( 
        -- Inputs
        WEN      => MANEJO_SOLICITUDES_RAM04_EN,
        WCLK     => WR_MDDR_MSS_DDR_FIC_SUBSYSTEM_CLK,
        RCLK     => WR_MDDR_FIC_0_CLK,
        WD       => WR_MDDR_AMBA_MASTER_0_RDATA_M0,
        WADDR(0) => GND_net,
        RADDR    => MANEJO_SOLICITUDES_sple_rd_RADDR,
        -- Outputs
        RD       => MEM_FI_0_RD 
        );
-- WR_MDDR
WR_MDDR : MDDR_Demo_TOP
    port map( 
        -- Inputs
        MMUART_0_RXD_F2M          => MMUART_0_RXD_F2M,
        read_start                => MANEJO_SOLICITUDES_READ,
        write_start               => MANEJO_SOLICITUDES_WRITE,
        MDDR_DQS_TMATCH_0_IN_0    => MDDR_DQS_TMATCH_0_IN_0,
        DEVRST_N_0                => DEVRST_N_0,
        GPIO_0_F2M                => MEMORY_TMR_0_error,
        AMBA_SLAVE_0_PREADYS0     => MDDR_Demo_TOP_0_AMBA_SLAVE_0_PREADY,
        AMBA_SLAVE_0_PSLVERRS0    => MDDR_Demo_TOP_0_AMBA_SLAVE_0_PSLVERR,
        GPIO_1_F2M                => UART_IF_SN_AUTO_0_End_Write,
        WLEN                      => MANEJO_SOLICITUDES_WLEN,
        RLEN                      => MANEJO_SOLICITUDES_RLEN,
        WDATA_int_input           => UART_IF_SN_AUTO_0_WDATA_SDRAM,
        AWADDR_int                => UART_IF_SN_AUTO_0_WR_ADDR,
        ARADDR_int                => UART_IF_SN_AUTO_0_RD_ADDR,
        AMBA_SLAVE_0_PRDATAS0     => MDDR_Demo_TOP_0_AMBA_SLAVE_0_PRDATA_0,
        -- Outputs
        INIT_DONE                 => WR_MDDR_INIT_DONE,
        MSS_DDR_FIC_SUBSYSTEM_CLK => WR_MDDR_MSS_DDR_FIC_SUBSYSTEM_CLK,
        FIC_0_CLK                 => WR_MDDR_FIC_0_CLK,
        AMBA_MASTER_0_RVALID_M0   => WR_MDDR_AMBA_MASTER_0_RVALID_M0,
        AMBA_MASTER_0_RLAST_M0    => WR_MDDR_AMBA_MASTER_0_RLAST_M0,
        MMUART_0_TXD_M2F          => MMUART_0_TXD_M2F_net_0,
        AXI_RBUSY                 => WR_MDDR_AXI_RBUSY,
        AXI_WBUSY                 => WR_MDDR_AXI_WBUSY,
        BREADY                    => WR_MDDR_BREADY,
        RREADY                    => WR_MDDR_RREADY,
        MDDR_DQS_TMATCH_0_OUT_0   => MDDR_DQS_TMATCH_0_OUT_0_net_0,
        MDDR_CAS_N_0              => MDDR_CAS_N_0_net_0,
        MDDR_CLK_0                => MDDR_CLK_0_net_0,
        MDDR_CLK_N_0              => MDDR_CLK_N_0_net_0,
        MDDR_CKE_0                => MDDR_CKE_0_net_0,
        MDDR_CS_N_0               => MDDR_CS_N_0_net_0,
        MDDR_ODT_0                => MDDR_ODT_0_net_0,
        MDDR_RAS_N_0              => MDDR_RAS_N_0_net_0,
        MDDR_RESET_N_0            => MDDR_RESET_N_0_net_0,
        MDDR_WE_N_0               => MDDR_WE_N_0_net_0,
        AMBA_SLAVE_0_PSELS0       => MDDR_Demo_TOP_0_AMBA_SLAVE_0_PSELx,
        AMBA_SLAVE_0_PENABLES     => MDDR_Demo_TOP_0_AMBA_SLAVE_0_PENABLE,
        AMBA_SLAVE_0_PWRITES      => MDDR_Demo_TOP_0_AMBA_SLAVE_0_PWRITE,
        AMBA_MASTER_0_RDATA_M0    => WR_MDDR_AMBA_MASTER_0_RDATA_M0,
        MDDR_ADDR_0               => MDDR_ADDR_0_net_0,
        MDDR_BA_0                 => MDDR_BA_0_net_0,
        AMBA_SLAVE_0_PADDRS       => MDDR_Demo_TOP_0_AMBA_SLAVE_0_PADDR,
        AMBA_SLAVE_0_PWDATAS      => MDDR_Demo_TOP_0_AMBA_SLAVE_0_PWDATA,
        -- Inouts
        MDDR_DM_RDQS_0            => MDDR_DM_RDQS_0,
        MDDR_DQ_0                 => MDDR_DQ_0,
        MDDR_DQS_0                => MDDR_DQS_0,
        MDDR_DQS_N_0              => MDDR_DQS_N_0 
        );

end RTL;
