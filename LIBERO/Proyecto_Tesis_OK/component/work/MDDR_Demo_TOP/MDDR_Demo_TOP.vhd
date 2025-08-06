----------------------------------------------------------------------
-- Created by SmartDesign Thu Feb 29 21:46:33 2024
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
-- MDDR_Demo_TOP entity declaration
----------------------------------------------------------------------
entity MDDR_Demo_TOP is
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
end MDDR_Demo_TOP;
----------------------------------------------------------------------
-- MDDR_Demo_TOP architecture body
----------------------------------------------------------------------
architecture RTL of MDDR_Demo_TOP is
----------------------------------------------------------------------
-- Component declarations
----------------------------------------------------------------------
-- AXI_MASTER_IF
component AXI_MASTER_IF
    generic( 
        Bresp_0 : integer := 5 ;
        Idle_0  : integer := 0 ;
        Idle_1  : integer := 1 ;
        Read_0  : integer := 0 ;
        Read_1  : integer := 1 ;
        Read_2  : integer := 2 ;
        Read_3  : integer := 3 ;
        Write_0 : integer := 2 ;
        Write_1 : integer := 3 ;
        Write_2 : integer := 4 
        );
    -- Port list
    port(
        -- Inputs
        ACLK          : in  std_logic;
        ARESETN       : in  std_logic;
        ARREADY       : in  std_logic;
        AWREADY       : in  std_logic;
        BID           : in  std_logic_vector(3 downto 0);
        BRESP         : in  std_logic_vector(1 downto 0);
        BVALID        : in  std_logic;
        DATA_IN       : in  std_logic_vector(63 downto 0);
        RDATA         : in  std_logic_vector(63 downto 0);
        READ          : in  std_logic;
        READ_ADDRESS  : in  std_logic_vector(31 downto 0);
        RID           : in  std_logic_vector(3 downto 0);
        RLAST         : in  std_logic;
        RLEN          : in  std_logic_vector(3 downto 0);
        RRESP         : in  std_logic_vector(1 downto 0);
        RVALID        : in  std_logic;
        WLEN          : in  std_logic_vector(3 downto 0);
        WREADY        : in  std_logic;
        WRITE         : in  std_logic;
        WRITE_ADDRESS : in  std_logic_vector(31 downto 0);
        -- Outputs
        ARADDR        : out std_logic_vector(31 downto 0);
        ARBURST       : out std_logic_vector(1 downto 0);
        ARID          : out std_logic_vector(3 downto 0);
        ARLEN         : out std_logic_vector(3 downto 0);
        ARLOCK        : out std_logic_vector(1 downto 0);
        ARSIZE        : out std_logic_vector(1 downto 0);
        ARVALID       : out std_logic;
        AWADDR        : out std_logic_vector(31 downto 0);
        AWBURST       : out std_logic_vector(1 downto 0);
        AWID          : out std_logic_vector(3 downto 0);
        AWLEN         : out std_logic_vector(3 downto 0);
        AWLOCK        : out std_logic_vector(1 downto 0);
        AWSIZE        : out std_logic_vector(2 downto 0);
        AWVALID       : out std_logic;
        AXI_RC_BUSY   : out std_logic;
        AXI_WC_BUSY   : out std_logic;
        BREADY        : out std_logic;
        Next_DATA_IN  : out std_logic;
        RREADY        : out std_logic;
        WDATA         : out std_logic_vector(63 downto 0);
        WID           : out std_logic_vector(3 downto 0);
        WLAST         : out std_logic;
        WSTRB         : out std_logic_vector(7 downto 0);
        WVALID        : out std_logic
        );
end component;
-- MDDR_Demo_sb_sb
component MDDR_Demo_sb_sb
    -- Port list
    port(
        -- Inputs
        AMBA_MASTER_0_ARADDR_M0    : in    std_logic_vector(31 downto 0);
        AMBA_MASTER_0_ARBURST_M0   : in    std_logic_vector(1 downto 0);
        AMBA_MASTER_0_ARCACHE_M0   : in    std_logic_vector(3 downto 0);
        AMBA_MASTER_0_ARID_M0      : in    std_logic_vector(3 downto 0);
        AMBA_MASTER_0_ARLEN_M0     : in    std_logic_vector(3 downto 0);
        AMBA_MASTER_0_ARLOCK_M0    : in    std_logic_vector(1 downto 0);
        AMBA_MASTER_0_ARPROT_M0    : in    std_logic_vector(2 downto 0);
        AMBA_MASTER_0_ARSIZE_M0    : in    std_logic_vector(2 downto 0);
        AMBA_MASTER_0_ARVALID_M0   : in    std_logic;
        AMBA_MASTER_0_AWADDR_M0    : in    std_logic_vector(31 downto 0);
        AMBA_MASTER_0_AWBURST_M0   : in    std_logic_vector(1 downto 0);
        AMBA_MASTER_0_AWCACHE_M0   : in    std_logic_vector(3 downto 0);
        AMBA_MASTER_0_AWID_M0      : in    std_logic_vector(3 downto 0);
        AMBA_MASTER_0_AWLEN_M0     : in    std_logic_vector(3 downto 0);
        AMBA_MASTER_0_AWLOCK_M0    : in    std_logic_vector(1 downto 0);
        AMBA_MASTER_0_AWPROT_M0    : in    std_logic_vector(2 downto 0);
        AMBA_MASTER_0_AWSIZE_M0    : in    std_logic_vector(2 downto 0);
        AMBA_MASTER_0_AWVALID_M0   : in    std_logic;
        AMBA_MASTER_0_BREADY_M0    : in    std_logic;
        AMBA_MASTER_0_RREADY_M0    : in    std_logic;
        AMBA_MASTER_0_WDATA_M0     : in    std_logic_vector(63 downto 0);
        AMBA_MASTER_0_WID_M0       : in    std_logic_vector(3 downto 0);
        AMBA_MASTER_0_WLAST_M0     : in    std_logic;
        AMBA_MASTER_0_WSTRB_M0     : in    std_logic_vector(7 downto 0);
        AMBA_MASTER_0_WVALID_M0    : in    std_logic;
        AMBA_SLAVE_0_PRDATAS0      : in    std_logic_vector(31 downto 0);
        AMBA_SLAVE_0_PREADYS0      : in    std_logic;
        AMBA_SLAVE_0_PSLVERRS0     : in    std_logic;
        DEVRST_N                   : in    std_logic;
        FAB_RESET_N                : in    std_logic;
        GPIO_0_F2M                 : in    std_logic;
        GPIO_1_F2M                 : in    std_logic;
        MDDR_AXI_S_RMW             : in    std_logic;
        MDDR_DQS_TMATCH_0_IN       : in    std_logic;
        MMUART_0_RXD_F2M           : in    std_logic;
        -- Outputs
        AMBA_MASTER_0_ARREADY_M0   : out   std_logic;
        AMBA_MASTER_0_AWREADY_M0   : out   std_logic;
        AMBA_MASTER_0_BID_M0       : out   std_logic_vector(3 downto 0);
        AMBA_MASTER_0_BRESP_M0     : out   std_logic_vector(1 downto 0);
        AMBA_MASTER_0_BVALID_M0    : out   std_logic;
        AMBA_MASTER_0_RDATA_M0     : out   std_logic_vector(63 downto 0);
        AMBA_MASTER_0_RID_M0       : out   std_logic_vector(3 downto 0);
        AMBA_MASTER_0_RLAST_M0     : out   std_logic;
        AMBA_MASTER_0_RRESP_M0     : out   std_logic_vector(1 downto 0);
        AMBA_MASTER_0_RVALID_M0    : out   std_logic;
        AMBA_MASTER_0_WREADY_M0    : out   std_logic;
        AMBA_SLAVE_0_PADDRS        : out   std_logic_vector(31 downto 0);
        AMBA_SLAVE_0_PENABLES      : out   std_logic;
        AMBA_SLAVE_0_PSELS0        : out   std_logic;
        AMBA_SLAVE_0_PWDATAS       : out   std_logic_vector(31 downto 0);
        AMBA_SLAVE_0_PWRITES       : out   std_logic;
        DDR_READY                  : out   std_logic;
        FIC_0_CLK                  : out   std_logic;
        FIC_0_LOCK                 : out   std_logic;
        INIT_DONE                  : out   std_logic;
        MDDR_ADDR                  : out   std_logic_vector(15 downto 0);
        MDDR_BA                    : out   std_logic_vector(2 downto 0);
        MDDR_CAS_N                 : out   std_logic;
        MDDR_CKE                   : out   std_logic;
        MDDR_CLK                   : out   std_logic;
        MDDR_CLK_N                 : out   std_logic;
        MDDR_CS_N                  : out   std_logic;
        MDDR_DQS_TMATCH_0_OUT      : out   std_logic;
        MDDR_ODT                   : out   std_logic;
        MDDR_RAS_N                 : out   std_logic;
        MDDR_RESET_N               : out   std_logic;
        MDDR_WE_N                  : out   std_logic;
        MMUART_0_TXD_M2F           : out   std_logic;
        MSS_DDR_FIC_SUBSYSTEM_CLK  : out   std_logic;
        MSS_DDR_FIC_SUBSYSTEM_LOCK : out   std_logic;
        MSS_READY                  : out   std_logic;
        POWER_ON_RESET_N           : out   std_logic;
        -- Inouts
        MDDR_DM_RDQS               : inout std_logic_vector(0 to 0);
        MDDR_DQ                    : inout std_logic_vector(7 downto 0);
        MDDR_DQS                   : inout std_logic_vector(0 to 0);
        MDDR_DQS_N                 : inout std_logic_vector(0 to 0)
        );
end component;
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
signal AMBA_MASTER_0_RDATA_M0_net_0    : std_logic_vector(63 downto 0);
signal AMBA_MASTER_0_RLAST_M0_net_0    : std_logic;
signal AMBA_MASTER_0_RVALID_M0_net_0   : std_logic;
signal AMBA_SLAVE_0_PADDR              : std_logic_vector(31 downto 0);
signal AMBA_SLAVE_0_PENABLE            : std_logic;
signal AMBA_SLAVE_0_PSELx              : std_logic;
signal AMBA_SLAVE_0_PWDATA             : std_logic_vector(31 downto 0);
signal AMBA_SLAVE_0_PWRITE             : std_logic;
signal AXI_IF_0_BIF_1_ARADDR           : std_logic_vector(31 downto 0);
signal AXI_IF_0_BIF_1_ARBURST          : std_logic_vector(1 downto 0);
signal AXI_IF_0_BIF_1_ARID             : std_logic_vector(3 downto 0);
signal AXI_IF_0_BIF_1_ARLEN            : std_logic_vector(3 downto 0);
signal AXI_IF_0_BIF_1_ARLOCK           : std_logic_vector(1 downto 0);
signal AXI_IF_0_BIF_1_ARREADY          : std_logic;
signal AXI_IF_0_BIF_1_ARVALID          : std_logic;
signal AXI_IF_0_BIF_1_AWADDR           : std_logic_vector(31 downto 0);
signal AXI_IF_0_BIF_1_AWBURST          : std_logic_vector(1 downto 0);
signal AXI_IF_0_BIF_1_AWID             : std_logic_vector(3 downto 0);
signal AXI_IF_0_BIF_1_AWLEN            : std_logic_vector(3 downto 0);
signal AXI_IF_0_BIF_1_AWLOCK           : std_logic_vector(1 downto 0);
signal AXI_IF_0_BIF_1_AWREADY          : std_logic;
signal AXI_IF_0_BIF_1_AWSIZE           : std_logic_vector(2 downto 0);
signal AXI_IF_0_BIF_1_AWVALID          : std_logic;
signal AXI_IF_0_BIF_1_BID              : std_logic_vector(3 downto 0);
signal AXI_IF_0_BIF_1_BREADY           : std_logic;
signal AXI_IF_0_BIF_1_BRESP            : std_logic_vector(1 downto 0);
signal AXI_IF_0_BIF_1_BVALID           : std_logic;
signal AXI_IF_0_BIF_1_RID              : std_logic_vector(3 downto 0);
signal AXI_IF_0_BIF_1_RREADY           : std_logic;
signal AXI_IF_0_BIF_1_RRESP            : std_logic_vector(1 downto 0);
signal AXI_IF_0_BIF_1_WDATA            : std_logic_vector(63 downto 0);
signal AXI_IF_0_BIF_1_WID              : std_logic_vector(3 downto 0);
signal AXI_IF_0_BIF_1_WLAST            : std_logic;
signal AXI_IF_0_BIF_1_WREADY           : std_logic;
signal AXI_IF_0_BIF_1_WSTRB            : std_logic_vector(7 downto 0);
signal AXI_IF_0_BIF_1_WVALID           : std_logic;
signal AXI_RBUSY_net_0                 : std_logic;
signal AXI_WBUSY_net_0                 : std_logic;
signal FIC_0_CLK_net_0                 : std_logic;
signal INIT_DONE_net_0                 : std_logic;
signal MDDR_ADDR_0_net_0               : std_logic_vector(15 downto 0);
signal MDDR_BA_0_net_0                 : std_logic_vector(2 downto 0);
signal MDDR_CAS_N_0_net_0              : std_logic;
signal MDDR_CKE_0_net_0                : std_logic;
signal MDDR_CLK_0_net_0                : std_logic;
signal MDDR_CLK_N_0_net_0              : std_logic;
signal MDDR_CS_N_0_net_0               : std_logic;
signal MDDR_DQS_TMATCH_0_OUT_0_net_0   : std_logic;
signal MDDR_ODT_0_net_0                : std_logic;
signal MDDR_RAS_N_0_net_0              : std_logic;
signal MDDR_RESET_N_0_net_0            : std_logic;
signal MDDR_WE_N_0_net_0               : std_logic;
signal MMUART_0_TXD_M2F_net_0          : std_logic;
signal MSS_DDR_FIC_SUBSYSTEM_CLK_net_0 : std_logic;
signal INIT_DONE_net_1                 : std_logic;
signal MSS_DDR_FIC_SUBSYSTEM_CLK_net_1 : std_logic;
signal FIC_0_CLK_net_1                 : std_logic;
signal AMBA_MASTER_0_RVALID_M0_net_1   : std_logic;
signal AMBA_MASTER_0_RLAST_M0_net_1    : std_logic;
signal MMUART_0_TXD_M2F_net_1          : std_logic;
signal AXI_RBUSY_net_1                 : std_logic;
signal AXI_WBUSY_net_1                 : std_logic;
signal AXI_IF_0_BIF_1_BREADY_net_0     : std_logic;
signal AXI_IF_0_BIF_1_RREADY_net_0     : std_logic;
signal MDDR_DQS_TMATCH_0_OUT_0_net_1   : std_logic;
signal MDDR_CAS_N_0_net_1              : std_logic;
signal MDDR_CLK_0_net_1                : std_logic;
signal MDDR_CLK_N_0_net_1              : std_logic;
signal MDDR_CKE_0_net_1                : std_logic;
signal MDDR_CS_N_0_net_1               : std_logic;
signal MDDR_ODT_0_net_1                : std_logic;
signal MDDR_RAS_N_0_net_1              : std_logic;
signal MDDR_RESET_N_0_net_1            : std_logic;
signal MDDR_WE_N_0_net_1               : std_logic;
signal AMBA_SLAVE_0_PSELx_net_0        : std_logic;
signal AMBA_SLAVE_0_PENABLE_net_0      : std_logic;
signal AMBA_SLAVE_0_PWRITE_net_0       : std_logic;
signal AMBA_MASTER_0_RDATA_M0_net_1    : std_logic_vector(63 downto 0);
signal MDDR_ADDR_0_net_1               : std_logic_vector(15 downto 0);
signal MDDR_BA_0_net_1                 : std_logic_vector(2 downto 0);
signal AMBA_SLAVE_0_PADDR_net_0        : std_logic_vector(31 downto 0);
signal AMBA_SLAVE_0_PWDATA_net_0       : std_logic_vector(31 downto 0);
----------------------------------------------------------------------
-- TiedOff Signals
----------------------------------------------------------------------
signal VCC_net                         : std_logic;
signal GND_net                         : std_logic;
signal AMBA_MASTER_0_AWCACHE_M0_const_net_0: std_logic_vector(3 downto 0);
signal AMBA_MASTER_0_AWPROT_M0_const_net_0: std_logic_vector(2 downto 0);
signal AMBA_MASTER_0_ARCACHE_M0_const_net_0: std_logic_vector(3 downto 0);
signal AMBA_MASTER_0_ARPROT_M0_const_net_0: std_logic_vector(2 downto 0);
----------------------------------------------------------------------
-- Bus Interface Nets Declarations - Unequal Pin Widths
----------------------------------------------------------------------
signal AXI_IF_0_BIF_1_ARSIZE           : std_logic_vector(1 downto 0);
signal AXI_IF_0_BIF_1_ARSIZE_0         : std_logic_vector(2 downto 0);
signal AXI_IF_0_BIF_1_ARSIZE_0_1to0    : std_logic_vector(1 downto 0);
signal AXI_IF_0_BIF_1_ARSIZE_0_2to2    : std_logic_vector(2 to 2);


begin
----------------------------------------------------------------------
-- Constant assignments
----------------------------------------------------------------------
 VCC_net                              <= '1';
 GND_net                              <= '0';
 AMBA_MASTER_0_AWCACHE_M0_const_net_0 <= B"0000";
 AMBA_MASTER_0_AWPROT_M0_const_net_0  <= B"000";
 AMBA_MASTER_0_ARCACHE_M0_const_net_0 <= B"0000";
 AMBA_MASTER_0_ARPROT_M0_const_net_0  <= B"000";
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 INIT_DONE_net_1                     <= INIT_DONE_net_0;
 INIT_DONE                           <= INIT_DONE_net_1;
 MSS_DDR_FIC_SUBSYSTEM_CLK_net_1     <= MSS_DDR_FIC_SUBSYSTEM_CLK_net_0;
 MSS_DDR_FIC_SUBSYSTEM_CLK           <= MSS_DDR_FIC_SUBSYSTEM_CLK_net_1;
 FIC_0_CLK_net_1                     <= FIC_0_CLK_net_0;
 FIC_0_CLK                           <= FIC_0_CLK_net_1;
 AMBA_MASTER_0_RVALID_M0_net_1       <= AMBA_MASTER_0_RVALID_M0_net_0;
 AMBA_MASTER_0_RVALID_M0             <= AMBA_MASTER_0_RVALID_M0_net_1;
 AMBA_MASTER_0_RLAST_M0_net_1        <= AMBA_MASTER_0_RLAST_M0_net_0;
 AMBA_MASTER_0_RLAST_M0              <= AMBA_MASTER_0_RLAST_M0_net_1;
 MMUART_0_TXD_M2F_net_1              <= MMUART_0_TXD_M2F_net_0;
 MMUART_0_TXD_M2F                    <= MMUART_0_TXD_M2F_net_1;
 AXI_RBUSY_net_1                     <= AXI_RBUSY_net_0;
 AXI_RBUSY                           <= AXI_RBUSY_net_1;
 AXI_WBUSY_net_1                     <= AXI_WBUSY_net_0;
 AXI_WBUSY                           <= AXI_WBUSY_net_1;
 AXI_IF_0_BIF_1_BREADY_net_0         <= AXI_IF_0_BIF_1_BREADY;
 BREADY                              <= AXI_IF_0_BIF_1_BREADY_net_0;
 AXI_IF_0_BIF_1_RREADY_net_0         <= AXI_IF_0_BIF_1_RREADY;
 RREADY                              <= AXI_IF_0_BIF_1_RREADY_net_0;
 MDDR_DQS_TMATCH_0_OUT_0_net_1       <= MDDR_DQS_TMATCH_0_OUT_0_net_0;
 MDDR_DQS_TMATCH_0_OUT_0             <= MDDR_DQS_TMATCH_0_OUT_0_net_1;
 MDDR_CAS_N_0_net_1                  <= MDDR_CAS_N_0_net_0;
 MDDR_CAS_N_0                        <= MDDR_CAS_N_0_net_1;
 MDDR_CLK_0_net_1                    <= MDDR_CLK_0_net_0;
 MDDR_CLK_0                          <= MDDR_CLK_0_net_1;
 MDDR_CLK_N_0_net_1                  <= MDDR_CLK_N_0_net_0;
 MDDR_CLK_N_0                        <= MDDR_CLK_N_0_net_1;
 MDDR_CKE_0_net_1                    <= MDDR_CKE_0_net_0;
 MDDR_CKE_0                          <= MDDR_CKE_0_net_1;
 MDDR_CS_N_0_net_1                   <= MDDR_CS_N_0_net_0;
 MDDR_CS_N_0                         <= MDDR_CS_N_0_net_1;
 MDDR_ODT_0_net_1                    <= MDDR_ODT_0_net_0;
 MDDR_ODT_0                          <= MDDR_ODT_0_net_1;
 MDDR_RAS_N_0_net_1                  <= MDDR_RAS_N_0_net_0;
 MDDR_RAS_N_0                        <= MDDR_RAS_N_0_net_1;
 MDDR_RESET_N_0_net_1                <= MDDR_RESET_N_0_net_0;
 MDDR_RESET_N_0                      <= MDDR_RESET_N_0_net_1;
 MDDR_WE_N_0_net_1                   <= MDDR_WE_N_0_net_0;
 MDDR_WE_N_0                         <= MDDR_WE_N_0_net_1;
 AMBA_SLAVE_0_PSELx_net_0            <= AMBA_SLAVE_0_PSELx;
 AMBA_SLAVE_0_PSELS0                 <= AMBA_SLAVE_0_PSELx_net_0;
 AMBA_SLAVE_0_PENABLE_net_0          <= AMBA_SLAVE_0_PENABLE;
 AMBA_SLAVE_0_PENABLES               <= AMBA_SLAVE_0_PENABLE_net_0;
 AMBA_SLAVE_0_PWRITE_net_0           <= AMBA_SLAVE_0_PWRITE;
 AMBA_SLAVE_0_PWRITES                <= AMBA_SLAVE_0_PWRITE_net_0;
 AMBA_MASTER_0_RDATA_M0_net_1        <= AMBA_MASTER_0_RDATA_M0_net_0;
 AMBA_MASTER_0_RDATA_M0(63 downto 0) <= AMBA_MASTER_0_RDATA_M0_net_1;
 MDDR_ADDR_0_net_1                   <= MDDR_ADDR_0_net_0;
 MDDR_ADDR_0(15 downto 0)            <= MDDR_ADDR_0_net_1;
 MDDR_BA_0_net_1                     <= MDDR_BA_0_net_0;
 MDDR_BA_0(2 downto 0)               <= MDDR_BA_0_net_1;
 AMBA_SLAVE_0_PADDR_net_0            <= AMBA_SLAVE_0_PADDR;
 AMBA_SLAVE_0_PADDRS(31 downto 0)    <= AMBA_SLAVE_0_PADDR_net_0;
 AMBA_SLAVE_0_PWDATA_net_0           <= AMBA_SLAVE_0_PWDATA;
 AMBA_SLAVE_0_PWDATAS(31 downto 0)   <= AMBA_SLAVE_0_PWDATA_net_0;
----------------------------------------------------------------------
-- Bus Interface Nets Assignments - Unequal Pin Widths
----------------------------------------------------------------------
 AXI_IF_0_BIF_1_ARSIZE_0(2 downto 0) <= ( AXI_IF_0_BIF_1_ARSIZE_0_2to2(2) & AXI_IF_0_BIF_1_ARSIZE_0_1to0(1 downto 0) );
 AXI_IF_0_BIF_1_ARSIZE_0_1to0(1 downto 0) <= AXI_IF_0_BIF_1_ARSIZE(1 downto 0);
 AXI_IF_0_BIF_1_ARSIZE_0_2to2(2) <= '0';

----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- AXI_IF_0
AXI_IF_0 : AXI_MASTER_IF
    generic map( 
        Bresp_0 => ( 5 ),
        Idle_0  => ( 0 ),
        Idle_1  => ( 1 ),
        Read_0  => ( 0 ),
        Read_1  => ( 1 ),
        Read_2  => ( 2 ),
        Read_3  => ( 3 ),
        Write_0 => ( 2 ),
        Write_1 => ( 3 ),
        Write_2 => ( 4 )
        )
    port map( 
        -- Inputs
        ACLK          => MSS_DDR_FIC_SUBSYSTEM_CLK_net_0,
        ARESETN       => INIT_DONE_net_0,
        WRITE         => write_start,
        READ          => read_start,
        AWREADY       => AXI_IF_0_BIF_1_AWREADY,
        WREADY        => AXI_IF_0_BIF_1_WREADY,
        BVALID        => AXI_IF_0_BIF_1_BVALID,
        ARREADY       => AXI_IF_0_BIF_1_ARREADY,
        RLAST         => AMBA_MASTER_0_RLAST_M0_net_0,
        RVALID        => AMBA_MASTER_0_RVALID_M0_net_0,
        WRITE_ADDRESS => AWADDR_int,
        DATA_IN       => WDATA_int_input,
        READ_ADDRESS  => ARADDR_int,
        WLEN          => WLEN,
        RLEN          => RLEN,
        BID           => AXI_IF_0_BIF_1_BID,
        BRESP         => AXI_IF_0_BIF_1_BRESP,
        RID           => AXI_IF_0_BIF_1_RID,
        RDATA         => AMBA_MASTER_0_RDATA_M0_net_0,
        RRESP         => AXI_IF_0_BIF_1_RRESP,
        -- Outputs
        Next_DATA_IN  => OPEN,
        AXI_WC_BUSY   => AXI_WBUSY_net_0,
        AXI_RC_BUSY   => AXI_RBUSY_net_0,
        AWVALID       => AXI_IF_0_BIF_1_AWVALID,
        WLAST         => AXI_IF_0_BIF_1_WLAST,
        WVALID        => AXI_IF_0_BIF_1_WVALID,
        BREADY        => AXI_IF_0_BIF_1_BREADY,
        ARVALID       => AXI_IF_0_BIF_1_ARVALID,
        RREADY        => AXI_IF_0_BIF_1_RREADY,
        AWID          => AXI_IF_0_BIF_1_AWID,
        AWADDR        => AXI_IF_0_BIF_1_AWADDR,
        AWLEN         => AXI_IF_0_BIF_1_AWLEN,
        AWSIZE        => AXI_IF_0_BIF_1_AWSIZE,
        AWLOCK        => AXI_IF_0_BIF_1_AWLOCK,
        AWBURST       => AXI_IF_0_BIF_1_AWBURST,
        WID           => AXI_IF_0_BIF_1_WID,
        WSTRB         => AXI_IF_0_BIF_1_WSTRB,
        WDATA         => AXI_IF_0_BIF_1_WDATA,
        ARID          => AXI_IF_0_BIF_1_ARID,
        ARADDR        => AXI_IF_0_BIF_1_ARADDR,
        ARLEN         => AXI_IF_0_BIF_1_ARLEN,
        ARSIZE        => AXI_IF_0_BIF_1_ARSIZE,
        ARLOCK        => AXI_IF_0_BIF_1_ARLOCK,
        ARBURST       => AXI_IF_0_BIF_1_ARBURST 
        );
-- MDDR_Demo_sb_sb_0
MDDR_Demo_sb_sb_0 : MDDR_Demo_sb_sb
    port map( 
        -- Inputs
        MDDR_DQS_TMATCH_0_IN       => MDDR_DQS_TMATCH_0_IN_0,
        FAB_RESET_N                => VCC_net,
        AMBA_MASTER_0_AWVALID_M0   => AXI_IF_0_BIF_1_AWVALID,
        AMBA_MASTER_0_WLAST_M0     => AXI_IF_0_BIF_1_WLAST,
        AMBA_MASTER_0_WVALID_M0    => AXI_IF_0_BIF_1_WVALID,
        AMBA_MASTER_0_BREADY_M0    => AXI_IF_0_BIF_1_BREADY,
        AMBA_MASTER_0_ARVALID_M0   => AXI_IF_0_BIF_1_ARVALID,
        AMBA_MASTER_0_RREADY_M0    => AXI_IF_0_BIF_1_RREADY,
        AMBA_SLAVE_0_PREADYS0      => AMBA_SLAVE_0_PREADYS0,
        AMBA_SLAVE_0_PSLVERRS0     => AMBA_SLAVE_0_PSLVERRS0,
        DEVRST_N                   => DEVRST_N_0,
        MDDR_AXI_S_RMW             => GND_net,
        MMUART_0_RXD_F2M           => MMUART_0_RXD_F2M,
        GPIO_0_F2M                 => GPIO_0_F2M,
        GPIO_1_F2M                 => GPIO_1_F2M,
        AMBA_MASTER_0_AWID_M0      => AXI_IF_0_BIF_1_AWID,
        AMBA_MASTER_0_AWADDR_M0    => AXI_IF_0_BIF_1_AWADDR,
        AMBA_MASTER_0_AWLEN_M0     => AXI_IF_0_BIF_1_AWLEN,
        AMBA_MASTER_0_AWSIZE_M0    => AXI_IF_0_BIF_1_AWSIZE,
        AMBA_MASTER_0_AWBURST_M0   => AXI_IF_0_BIF_1_AWBURST,
        AMBA_MASTER_0_AWLOCK_M0    => AXI_IF_0_BIF_1_AWLOCK,
        AMBA_MASTER_0_AWCACHE_M0   => AMBA_MASTER_0_AWCACHE_M0_const_net_0, -- tied to X"0" from definition
        AMBA_MASTER_0_AWPROT_M0    => AMBA_MASTER_0_AWPROT_M0_const_net_0, -- tied to X"0" from definition
        AMBA_MASTER_0_WDATA_M0     => AXI_IF_0_BIF_1_WDATA,
        AMBA_MASTER_0_WID_M0       => AXI_IF_0_BIF_1_WID,
        AMBA_MASTER_0_WSTRB_M0     => AXI_IF_0_BIF_1_WSTRB,
        AMBA_MASTER_0_ARID_M0      => AXI_IF_0_BIF_1_ARID,
        AMBA_MASTER_0_ARADDR_M0    => AXI_IF_0_BIF_1_ARADDR,
        AMBA_MASTER_0_ARLEN_M0     => AXI_IF_0_BIF_1_ARLEN,
        AMBA_MASTER_0_ARSIZE_M0    => AXI_IF_0_BIF_1_ARSIZE_0,
        AMBA_MASTER_0_ARBURST_M0   => AXI_IF_0_BIF_1_ARBURST,
        AMBA_MASTER_0_ARLOCK_M0    => AXI_IF_0_BIF_1_ARLOCK,
        AMBA_MASTER_0_ARCACHE_M0   => AMBA_MASTER_0_ARCACHE_M0_const_net_0, -- tied to X"0" from definition
        AMBA_MASTER_0_ARPROT_M0    => AMBA_MASTER_0_ARPROT_M0_const_net_0, -- tied to X"0" from definition
        AMBA_SLAVE_0_PRDATAS0      => AMBA_SLAVE_0_PRDATAS0,
        -- Outputs
        MDDR_DQS_TMATCH_0_OUT      => MDDR_DQS_TMATCH_0_OUT_0_net_0,
        MDDR_CAS_N                 => MDDR_CAS_N_0_net_0,
        MDDR_CLK                   => MDDR_CLK_0_net_0,
        MDDR_CLK_N                 => MDDR_CLK_N_0_net_0,
        MDDR_CKE                   => MDDR_CKE_0_net_0,
        MDDR_CS_N                  => MDDR_CS_N_0_net_0,
        MDDR_ODT                   => MDDR_ODT_0_net_0,
        MDDR_RAS_N                 => MDDR_RAS_N_0_net_0,
        MDDR_RESET_N               => MDDR_RESET_N_0_net_0,
        MDDR_WE_N                  => MDDR_WE_N_0_net_0,
        POWER_ON_RESET_N           => OPEN,
        INIT_DONE                  => INIT_DONE_net_0,
        AMBA_MASTER_0_AWREADY_M0   => AXI_IF_0_BIF_1_AWREADY,
        AMBA_MASTER_0_WREADY_M0    => AXI_IF_0_BIF_1_WREADY,
        AMBA_MASTER_0_BVALID_M0    => AXI_IF_0_BIF_1_BVALID,
        AMBA_MASTER_0_ARREADY_M0   => AXI_IF_0_BIF_1_ARREADY,
        AMBA_MASTER_0_RLAST_M0     => AMBA_MASTER_0_RLAST_M0_net_0,
        AMBA_MASTER_0_RVALID_M0    => AMBA_MASTER_0_RVALID_M0_net_0,
        MSS_DDR_FIC_SUBSYSTEM_CLK  => MSS_DDR_FIC_SUBSYSTEM_CLK_net_0,
        MSS_DDR_FIC_SUBSYSTEM_LOCK => OPEN,
        AMBA_SLAVE_0_PSELS0        => AMBA_SLAVE_0_PSELx,
        AMBA_SLAVE_0_PENABLES      => AMBA_SLAVE_0_PENABLE,
        AMBA_SLAVE_0_PWRITES       => AMBA_SLAVE_0_PWRITE,
        FIC_0_CLK                  => FIC_0_CLK_net_0,
        FIC_0_LOCK                 => OPEN,
        DDR_READY                  => OPEN,
        MSS_READY                  => OPEN,
        MMUART_0_TXD_M2F           => MMUART_0_TXD_M2F_net_0,
        MDDR_ADDR                  => MDDR_ADDR_0_net_0,
        MDDR_BA                    => MDDR_BA_0_net_0,
        AMBA_MASTER_0_BID_M0       => AXI_IF_0_BIF_1_BID,
        AMBA_MASTER_0_BRESP_M0     => AXI_IF_0_BIF_1_BRESP,
        AMBA_MASTER_0_RID_M0       => AXI_IF_0_BIF_1_RID,
        AMBA_MASTER_0_RDATA_M0     => AMBA_MASTER_0_RDATA_M0_net_0,
        AMBA_MASTER_0_RRESP_M0     => AXI_IF_0_BIF_1_RRESP,
        AMBA_SLAVE_0_PADDRS        => AMBA_SLAVE_0_PADDR,
        AMBA_SLAVE_0_PWDATAS       => AMBA_SLAVE_0_PWDATA,
        -- Inouts
        MDDR_DM_RDQS               => MDDR_DM_RDQS_0,
        MDDR_DQ                    => MDDR_DQ_0,
        MDDR_DQS                   => MDDR_DQS_0,
        MDDR_DQS_N                 => MDDR_DQS_N_0 
        );

end RTL;
