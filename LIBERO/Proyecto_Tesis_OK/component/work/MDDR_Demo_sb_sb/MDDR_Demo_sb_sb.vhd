----------------------------------------------------------------------
-- Created by SmartDesign Thu Feb  1 10:18:14 2024
-- Version: 2023.2 2023.2.0.8
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Libraries
----------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library smartfusion2;
use smartfusion2.all;
library COREAPB3_LIB;
use COREAPB3_LIB.all;
use COREAPB3_LIB.components.all;
----------------------------------------------------------------------
-- MDDR_Demo_sb_sb entity declaration
----------------------------------------------------------------------
entity MDDR_Demo_sb_sb is
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
end MDDR_Demo_sb_sb;
----------------------------------------------------------------------
-- MDDR_Demo_sb_sb architecture body
----------------------------------------------------------------------
architecture RTL of MDDR_Demo_sb_sb is
----------------------------------------------------------------------
-- Component declarations
----------------------------------------------------------------------
-- MDDR_Demo_sb_sb_CCC_0_FCCC   -   Actel:SgCore:FCCC:2.0.201
component MDDR_Demo_sb_sb_CCC_0_FCCC
    -- Port list
    port(
        -- Inputs
        RCOSC_25_50MHZ : in  std_logic;
        -- Outputs
        GL0            : out std_logic;
        GL2            : out std_logic;
        LOCK           : out std_logic
        );
end component;
-- CoreAPB3   -   Actel:DirectCore:CoreAPB3:4.1.100
-- using entity instantiation for component CoreAPB3
-- MDDR_Demo_sb_sb_COREAXI_0_COREAXI   -   Actel:DirectCore:COREAXI:3.1.100
component MDDR_Demo_sb_sb_COREAXI_0_COREAXI
    generic( 
        ADDR_HGS_CFG     : integer := 1 ;
        AXI_DWIDTH       : integer := 64 ;
        FAMILY           : integer := 19 ;
        FEED_THROUGH     : integer := 1 ;
        HGS_CFG          : integer := 1 ;
        ID_WIDTH         : integer := 4 ;
        INP_REG_BUF      : integer := 1 ;
        M0_SLAVE0ENABLE  : integer := 1 ;
        M0_SLAVE1ENABLE  : integer := 0 ;
        M0_SLAVE2ENABLE  : integer := 0 ;
        M0_SLAVE3ENABLE  : integer := 0 ;
        M0_SLAVE4ENABLE  : integer := 0 ;
        M0_SLAVE5ENABLE  : integer := 0 ;
        M0_SLAVE6ENABLE  : integer := 0 ;
        M0_SLAVE7ENABLE  : integer := 0 ;
        M0_SLAVE8ENABLE  : integer := 0 ;
        M0_SLAVE9ENABLE  : integer := 0 ;
        M0_SLAVE10ENABLE : integer := 0 ;
        M0_SLAVE11ENABLE : integer := 0 ;
        M0_SLAVE12ENABLE : integer := 0 ;
        M0_SLAVE13ENABLE : integer := 0 ;
        M0_SLAVE14ENABLE : integer := 0 ;
        M0_SLAVE15ENABLE : integer := 0 ;
        M0_SLAVE16ENABLE : integer := 0 ;
        M1_SLAVE0ENABLE  : integer := 0 ;
        M1_SLAVE1ENABLE  : integer := 0 ;
        M1_SLAVE2ENABLE  : integer := 0 ;
        M1_SLAVE3ENABLE  : integer := 0 ;
        M1_SLAVE4ENABLE  : integer := 0 ;
        M1_SLAVE5ENABLE  : integer := 0 ;
        M1_SLAVE6ENABLE  : integer := 0 ;
        M1_SLAVE7ENABLE  : integer := 0 ;
        M1_SLAVE8ENABLE  : integer := 0 ;
        M1_SLAVE9ENABLE  : integer := 0 ;
        M1_SLAVE10ENABLE : integer := 0 ;
        M1_SLAVE11ENABLE : integer := 0 ;
        M1_SLAVE12ENABLE : integer := 0 ;
        M1_SLAVE13ENABLE : integer := 0 ;
        M1_SLAVE14ENABLE : integer := 0 ;
        M1_SLAVE15ENABLE : integer := 0 ;
        M1_SLAVE16ENABLE : integer := 0 ;
        M2_SLAVE0ENABLE  : integer := 0 ;
        M2_SLAVE1ENABLE  : integer := 0 ;
        M2_SLAVE2ENABLE  : integer := 0 ;
        M2_SLAVE3ENABLE  : integer := 0 ;
        M2_SLAVE4ENABLE  : integer := 0 ;
        M2_SLAVE5ENABLE  : integer := 0 ;
        M2_SLAVE6ENABLE  : integer := 0 ;
        M2_SLAVE7ENABLE  : integer := 0 ;
        M2_SLAVE8ENABLE  : integer := 0 ;
        M2_SLAVE9ENABLE  : integer := 0 ;
        M2_SLAVE10ENABLE : integer := 0 ;
        M2_SLAVE11ENABLE : integer := 0 ;
        M2_SLAVE12ENABLE : integer := 0 ;
        M2_SLAVE13ENABLE : integer := 0 ;
        M2_SLAVE14ENABLE : integer := 0 ;
        M2_SLAVE15ENABLE : integer := 0 ;
        M2_SLAVE16ENABLE : integer := 0 ;
        M3_SLAVE0ENABLE  : integer := 0 ;
        M3_SLAVE1ENABLE  : integer := 0 ;
        M3_SLAVE2ENABLE  : integer := 0 ;
        M3_SLAVE3ENABLE  : integer := 0 ;
        M3_SLAVE4ENABLE  : integer := 0 ;
        M3_SLAVE5ENABLE  : integer := 0 ;
        M3_SLAVE6ENABLE  : integer := 0 ;
        M3_SLAVE7ENABLE  : integer := 0 ;
        M3_SLAVE8ENABLE  : integer := 0 ;
        M3_SLAVE9ENABLE  : integer := 0 ;
        M3_SLAVE10ENABLE : integer := 0 ;
        M3_SLAVE11ENABLE : integer := 0 ;
        M3_SLAVE12ENABLE : integer := 0 ;
        M3_SLAVE13ENABLE : integer := 0 ;
        M3_SLAVE14ENABLE : integer := 0 ;
        M3_SLAVE15ENABLE : integer := 0 ;
        M3_SLAVE16ENABLE : integer := 0 ;
        MEMSPACE         : integer := 3 ;
        NUM_MASTER_SLOT  : integer := 1 ;
        OUT_REG_BUF      : integer := 1 ;
        RD_ACCEPTANCE    : integer := 4 ;
        SC_0             : integer := 0 ;
        SC_1             : integer := 0 ;
        SC_2             : integer := 0 ;
        SC_3             : integer := 0 ;
        SC_4             : integer := 0 ;
        SC_5             : integer := 0 ;
        SC_6             : integer := 0 ;
        SC_7             : integer := 0 ;
        SC_8             : integer := 0 ;
        SC_9             : integer := 0 ;
        SC_10            : integer := 0 ;
        SC_11            : integer := 0 ;
        SC_12            : integer := 0 ;
        SC_13            : integer := 0 ;
        SC_14            : integer := 0 ;
        SC_15            : integer := 0 
        );
    -- Port list
    port(
        -- Inputs
        ACLK        : in  std_logic;
        ARADDR_M0   : in  std_logic_vector(31 downto 0);
        ARADDR_M1   : in  std_logic_vector(31 downto 0);
        ARADDR_M2   : in  std_logic_vector(31 downto 0);
        ARADDR_M3   : in  std_logic_vector(31 downto 0);
        ARBURST_M0  : in  std_logic_vector(1 downto 0);
        ARBURST_M1  : in  std_logic_vector(1 downto 0);
        ARBURST_M2  : in  std_logic_vector(1 downto 0);
        ARBURST_M3  : in  std_logic_vector(1 downto 0);
        ARCACHE_M0  : in  std_logic_vector(3 downto 0);
        ARCACHE_M1  : in  std_logic_vector(3 downto 0);
        ARCACHE_M2  : in  std_logic_vector(3 downto 0);
        ARCACHE_M3  : in  std_logic_vector(3 downto 0);
        ARESETN     : in  std_logic;
        ARID_M0     : in  std_logic_vector(3 downto 0);
        ARID_M1     : in  std_logic_vector(3 downto 0);
        ARID_M2     : in  std_logic_vector(3 downto 0);
        ARID_M3     : in  std_logic_vector(3 downto 0);
        ARLEN_M0    : in  std_logic_vector(3 downto 0);
        ARLEN_M1    : in  std_logic_vector(3 downto 0);
        ARLEN_M2    : in  std_logic_vector(3 downto 0);
        ARLEN_M3    : in  std_logic_vector(3 downto 0);
        ARLOCK_M0   : in  std_logic_vector(1 downto 0);
        ARLOCK_M1   : in  std_logic_vector(1 downto 0);
        ARLOCK_M2   : in  std_logic_vector(1 downto 0);
        ARLOCK_M3   : in  std_logic_vector(1 downto 0);
        ARPROT_M0   : in  std_logic_vector(2 downto 0);
        ARPROT_M1   : in  std_logic_vector(2 downto 0);
        ARPROT_M2   : in  std_logic_vector(2 downto 0);
        ARPROT_M3   : in  std_logic_vector(2 downto 0);
        ARREADY_S0  : in  std_logic;
        ARREADY_S1  : in  std_logic;
        ARREADY_S10 : in  std_logic;
        ARREADY_S11 : in  std_logic;
        ARREADY_S12 : in  std_logic;
        ARREADY_S13 : in  std_logic;
        ARREADY_S14 : in  std_logic;
        ARREADY_S15 : in  std_logic;
        ARREADY_S16 : in  std_logic;
        ARREADY_S2  : in  std_logic;
        ARREADY_S3  : in  std_logic;
        ARREADY_S4  : in  std_logic;
        ARREADY_S5  : in  std_logic;
        ARREADY_S6  : in  std_logic;
        ARREADY_S7  : in  std_logic;
        ARREADY_S8  : in  std_logic;
        ARREADY_S9  : in  std_logic;
        ARSIZE_M0   : in  std_logic_vector(2 downto 0);
        ARSIZE_M1   : in  std_logic_vector(2 downto 0);
        ARSIZE_M2   : in  std_logic_vector(2 downto 0);
        ARSIZE_M3   : in  std_logic_vector(2 downto 0);
        ARVALID_M0  : in  std_logic;
        ARVALID_M1  : in  std_logic;
        ARVALID_M2  : in  std_logic;
        ARVALID_M3  : in  std_logic;
        AWADDR_M0   : in  std_logic_vector(31 downto 0);
        AWADDR_M1   : in  std_logic_vector(31 downto 0);
        AWADDR_M2   : in  std_logic_vector(31 downto 0);
        AWADDR_M3   : in  std_logic_vector(31 downto 0);
        AWBURST_M0  : in  std_logic_vector(1 downto 0);
        AWBURST_M1  : in  std_logic_vector(1 downto 0);
        AWBURST_M2  : in  std_logic_vector(1 downto 0);
        AWBURST_M3  : in  std_logic_vector(1 downto 0);
        AWCACHE_M0  : in  std_logic_vector(3 downto 0);
        AWCACHE_M1  : in  std_logic_vector(3 downto 0);
        AWCACHE_M2  : in  std_logic_vector(3 downto 0);
        AWCACHE_M3  : in  std_logic_vector(3 downto 0);
        AWID_M0     : in  std_logic_vector(3 downto 0);
        AWID_M1     : in  std_logic_vector(3 downto 0);
        AWID_M2     : in  std_logic_vector(3 downto 0);
        AWID_M3     : in  std_logic_vector(3 downto 0);
        AWLEN_M0    : in  std_logic_vector(3 downto 0);
        AWLEN_M1    : in  std_logic_vector(3 downto 0);
        AWLEN_M2    : in  std_logic_vector(3 downto 0);
        AWLEN_M3    : in  std_logic_vector(3 downto 0);
        AWLOCK_M0   : in  std_logic_vector(1 downto 0);
        AWLOCK_M1   : in  std_logic_vector(1 downto 0);
        AWLOCK_M2   : in  std_logic_vector(1 downto 0);
        AWLOCK_M3   : in  std_logic_vector(1 downto 0);
        AWPROT_M0   : in  std_logic_vector(2 downto 0);
        AWPROT_M1   : in  std_logic_vector(2 downto 0);
        AWPROT_M2   : in  std_logic_vector(2 downto 0);
        AWPROT_M3   : in  std_logic_vector(2 downto 0);
        AWREADY_S0  : in  std_logic;
        AWREADY_S1  : in  std_logic;
        AWREADY_S10 : in  std_logic;
        AWREADY_S11 : in  std_logic;
        AWREADY_S12 : in  std_logic;
        AWREADY_S13 : in  std_logic;
        AWREADY_S14 : in  std_logic;
        AWREADY_S15 : in  std_logic;
        AWREADY_S16 : in  std_logic;
        AWREADY_S2  : in  std_logic;
        AWREADY_S3  : in  std_logic;
        AWREADY_S4  : in  std_logic;
        AWREADY_S5  : in  std_logic;
        AWREADY_S6  : in  std_logic;
        AWREADY_S7  : in  std_logic;
        AWREADY_S8  : in  std_logic;
        AWREADY_S9  : in  std_logic;
        AWSIZE_M0   : in  std_logic_vector(2 downto 0);
        AWSIZE_M1   : in  std_logic_vector(2 downto 0);
        AWSIZE_M2   : in  std_logic_vector(2 downto 0);
        AWSIZE_M3   : in  std_logic_vector(2 downto 0);
        AWVALID_M0  : in  std_logic;
        AWVALID_M1  : in  std_logic;
        AWVALID_M2  : in  std_logic;
        AWVALID_M3  : in  std_logic;
        BID_S0      : in  std_logic_vector(5 downto 0);
        BID_S1      : in  std_logic_vector(5 downto 0);
        BID_S10     : in  std_logic_vector(5 downto 0);
        BID_S11     : in  std_logic_vector(5 downto 0);
        BID_S12     : in  std_logic_vector(5 downto 0);
        BID_S13     : in  std_logic_vector(5 downto 0);
        BID_S14     : in  std_logic_vector(5 downto 0);
        BID_S15     : in  std_logic_vector(5 downto 0);
        BID_S16     : in  std_logic_vector(5 downto 0);
        BID_S2      : in  std_logic_vector(5 downto 0);
        BID_S3      : in  std_logic_vector(5 downto 0);
        BID_S4      : in  std_logic_vector(5 downto 0);
        BID_S5      : in  std_logic_vector(5 downto 0);
        BID_S6      : in  std_logic_vector(5 downto 0);
        BID_S7      : in  std_logic_vector(5 downto 0);
        BID_S8      : in  std_logic_vector(5 downto 0);
        BID_S9      : in  std_logic_vector(5 downto 0);
        BREADY_M0   : in  std_logic;
        BREADY_M1   : in  std_logic;
        BREADY_M2   : in  std_logic;
        BREADY_M3   : in  std_logic;
        BRESP_S0    : in  std_logic_vector(1 downto 0);
        BRESP_S1    : in  std_logic_vector(1 downto 0);
        BRESP_S10   : in  std_logic_vector(1 downto 0);
        BRESP_S11   : in  std_logic_vector(1 downto 0);
        BRESP_S12   : in  std_logic_vector(1 downto 0);
        BRESP_S13   : in  std_logic_vector(1 downto 0);
        BRESP_S14   : in  std_logic_vector(1 downto 0);
        BRESP_S15   : in  std_logic_vector(1 downto 0);
        BRESP_S16   : in  std_logic_vector(1 downto 0);
        BRESP_S2    : in  std_logic_vector(1 downto 0);
        BRESP_S3    : in  std_logic_vector(1 downto 0);
        BRESP_S4    : in  std_logic_vector(1 downto 0);
        BRESP_S5    : in  std_logic_vector(1 downto 0);
        BRESP_S6    : in  std_logic_vector(1 downto 0);
        BRESP_S7    : in  std_logic_vector(1 downto 0);
        BRESP_S8    : in  std_logic_vector(1 downto 0);
        BRESP_S9    : in  std_logic_vector(1 downto 0);
        BVALID_S0   : in  std_logic;
        BVALID_S1   : in  std_logic;
        BVALID_S10  : in  std_logic;
        BVALID_S11  : in  std_logic;
        BVALID_S12  : in  std_logic;
        BVALID_S13  : in  std_logic;
        BVALID_S14  : in  std_logic;
        BVALID_S15  : in  std_logic;
        BVALID_S16  : in  std_logic;
        BVALID_S2   : in  std_logic;
        BVALID_S3   : in  std_logic;
        BVALID_S4   : in  std_logic;
        BVALID_S5   : in  std_logic;
        BVALID_S6   : in  std_logic;
        BVALID_S7   : in  std_logic;
        BVALID_S8   : in  std_logic;
        BVALID_S9   : in  std_logic;
        RDATA_S0    : in  std_logic_vector(63 downto 0);
        RDATA_S1    : in  std_logic_vector(63 downto 0);
        RDATA_S10   : in  std_logic_vector(63 downto 0);
        RDATA_S11   : in  std_logic_vector(63 downto 0);
        RDATA_S12   : in  std_logic_vector(63 downto 0);
        RDATA_S13   : in  std_logic_vector(63 downto 0);
        RDATA_S14   : in  std_logic_vector(63 downto 0);
        RDATA_S15   : in  std_logic_vector(63 downto 0);
        RDATA_S16   : in  std_logic_vector(63 downto 0);
        RDATA_S2    : in  std_logic_vector(63 downto 0);
        RDATA_S3    : in  std_logic_vector(63 downto 0);
        RDATA_S4    : in  std_logic_vector(63 downto 0);
        RDATA_S5    : in  std_logic_vector(63 downto 0);
        RDATA_S6    : in  std_logic_vector(63 downto 0);
        RDATA_S7    : in  std_logic_vector(63 downto 0);
        RDATA_S8    : in  std_logic_vector(63 downto 0);
        RDATA_S9    : in  std_logic_vector(63 downto 0);
        RID_S0      : in  std_logic_vector(5 downto 0);
        RID_S1      : in  std_logic_vector(5 downto 0);
        RID_S10     : in  std_logic_vector(5 downto 0);
        RID_S11     : in  std_logic_vector(5 downto 0);
        RID_S12     : in  std_logic_vector(5 downto 0);
        RID_S13     : in  std_logic_vector(5 downto 0);
        RID_S14     : in  std_logic_vector(5 downto 0);
        RID_S15     : in  std_logic_vector(5 downto 0);
        RID_S16     : in  std_logic_vector(5 downto 0);
        RID_S2      : in  std_logic_vector(5 downto 0);
        RID_S3      : in  std_logic_vector(5 downto 0);
        RID_S4      : in  std_logic_vector(5 downto 0);
        RID_S5      : in  std_logic_vector(5 downto 0);
        RID_S6      : in  std_logic_vector(5 downto 0);
        RID_S7      : in  std_logic_vector(5 downto 0);
        RID_S8      : in  std_logic_vector(5 downto 0);
        RID_S9      : in  std_logic_vector(5 downto 0);
        RLAST_S0    : in  std_logic;
        RLAST_S1    : in  std_logic;
        RLAST_S10   : in  std_logic;
        RLAST_S11   : in  std_logic;
        RLAST_S12   : in  std_logic;
        RLAST_S13   : in  std_logic;
        RLAST_S14   : in  std_logic;
        RLAST_S15   : in  std_logic;
        RLAST_S16   : in  std_logic;
        RLAST_S2    : in  std_logic;
        RLAST_S3    : in  std_logic;
        RLAST_S4    : in  std_logic;
        RLAST_S5    : in  std_logic;
        RLAST_S6    : in  std_logic;
        RLAST_S7    : in  std_logic;
        RLAST_S8    : in  std_logic;
        RLAST_S9    : in  std_logic;
        RREADY_M0   : in  std_logic;
        RREADY_M1   : in  std_logic;
        RREADY_M2   : in  std_logic;
        RREADY_M3   : in  std_logic;
        RRESP_S0    : in  std_logic_vector(1 downto 0);
        RRESP_S1    : in  std_logic_vector(1 downto 0);
        RRESP_S10   : in  std_logic_vector(1 downto 0);
        RRESP_S11   : in  std_logic_vector(1 downto 0);
        RRESP_S12   : in  std_logic_vector(1 downto 0);
        RRESP_S13   : in  std_logic_vector(1 downto 0);
        RRESP_S14   : in  std_logic_vector(1 downto 0);
        RRESP_S15   : in  std_logic_vector(1 downto 0);
        RRESP_S16   : in  std_logic_vector(1 downto 0);
        RRESP_S2    : in  std_logic_vector(1 downto 0);
        RRESP_S3    : in  std_logic_vector(1 downto 0);
        RRESP_S4    : in  std_logic_vector(1 downto 0);
        RRESP_S5    : in  std_logic_vector(1 downto 0);
        RRESP_S6    : in  std_logic_vector(1 downto 0);
        RRESP_S7    : in  std_logic_vector(1 downto 0);
        RRESP_S8    : in  std_logic_vector(1 downto 0);
        RRESP_S9    : in  std_logic_vector(1 downto 0);
        RVALID_S0   : in  std_logic;
        RVALID_S1   : in  std_logic;
        RVALID_S10  : in  std_logic;
        RVALID_S11  : in  std_logic;
        RVALID_S12  : in  std_logic;
        RVALID_S13  : in  std_logic;
        RVALID_S14  : in  std_logic;
        RVALID_S15  : in  std_logic;
        RVALID_S16  : in  std_logic;
        RVALID_S2   : in  std_logic;
        RVALID_S3   : in  std_logic;
        RVALID_S4   : in  std_logic;
        RVALID_S5   : in  std_logic;
        RVALID_S6   : in  std_logic;
        RVALID_S7   : in  std_logic;
        RVALID_S8   : in  std_logic;
        RVALID_S9   : in  std_logic;
        WDATA_M0    : in  std_logic_vector(63 downto 0);
        WDATA_M1    : in  std_logic_vector(63 downto 0);
        WDATA_M2    : in  std_logic_vector(63 downto 0);
        WDATA_M3    : in  std_logic_vector(63 downto 0);
        WID_M0      : in  std_logic_vector(3 downto 0);
        WID_M1      : in  std_logic_vector(3 downto 0);
        WID_M2      : in  std_logic_vector(3 downto 0);
        WID_M3      : in  std_logic_vector(3 downto 0);
        WLAST_M0    : in  std_logic;
        WLAST_M1    : in  std_logic;
        WLAST_M2    : in  std_logic;
        WLAST_M3    : in  std_logic;
        WREADY_S0   : in  std_logic;
        WREADY_S1   : in  std_logic;
        WREADY_S10  : in  std_logic;
        WREADY_S11  : in  std_logic;
        WREADY_S12  : in  std_logic;
        WREADY_S13  : in  std_logic;
        WREADY_S14  : in  std_logic;
        WREADY_S15  : in  std_logic;
        WREADY_S16  : in  std_logic;
        WREADY_S2   : in  std_logic;
        WREADY_S3   : in  std_logic;
        WREADY_S4   : in  std_logic;
        WREADY_S5   : in  std_logic;
        WREADY_S6   : in  std_logic;
        WREADY_S7   : in  std_logic;
        WREADY_S8   : in  std_logic;
        WREADY_S9   : in  std_logic;
        WSTRB_M0    : in  std_logic_vector(7 downto 0);
        WSTRB_M1    : in  std_logic_vector(7 downto 0);
        WSTRB_M2    : in  std_logic_vector(7 downto 0);
        WSTRB_M3    : in  std_logic_vector(7 downto 0);
        WVALID_M0   : in  std_logic;
        WVALID_M1   : in  std_logic;
        WVALID_M2   : in  std_logic;
        WVALID_M3   : in  std_logic;
        -- Outputs
        ARADDR_S0   : out std_logic_vector(31 downto 0);
        ARADDR_S1   : out std_logic_vector(31 downto 0);
        ARADDR_S10  : out std_logic_vector(31 downto 0);
        ARADDR_S11  : out std_logic_vector(31 downto 0);
        ARADDR_S12  : out std_logic_vector(31 downto 0);
        ARADDR_S13  : out std_logic_vector(31 downto 0);
        ARADDR_S14  : out std_logic_vector(31 downto 0);
        ARADDR_S15  : out std_logic_vector(31 downto 0);
        ARADDR_S16  : out std_logic_vector(31 downto 0);
        ARADDR_S2   : out std_logic_vector(31 downto 0);
        ARADDR_S3   : out std_logic_vector(31 downto 0);
        ARADDR_S4   : out std_logic_vector(31 downto 0);
        ARADDR_S5   : out std_logic_vector(31 downto 0);
        ARADDR_S6   : out std_logic_vector(31 downto 0);
        ARADDR_S7   : out std_logic_vector(31 downto 0);
        ARADDR_S8   : out std_logic_vector(31 downto 0);
        ARADDR_S9   : out std_logic_vector(31 downto 0);
        ARBURST_S0  : out std_logic_vector(1 downto 0);
        ARBURST_S1  : out std_logic_vector(1 downto 0);
        ARBURST_S10 : out std_logic_vector(1 downto 0);
        ARBURST_S11 : out std_logic_vector(1 downto 0);
        ARBURST_S12 : out std_logic_vector(1 downto 0);
        ARBURST_S13 : out std_logic_vector(1 downto 0);
        ARBURST_S14 : out std_logic_vector(1 downto 0);
        ARBURST_S15 : out std_logic_vector(1 downto 0);
        ARBURST_S16 : out std_logic_vector(1 downto 0);
        ARBURST_S2  : out std_logic_vector(1 downto 0);
        ARBURST_S3  : out std_logic_vector(1 downto 0);
        ARBURST_S4  : out std_logic_vector(1 downto 0);
        ARBURST_S5  : out std_logic_vector(1 downto 0);
        ARBURST_S6  : out std_logic_vector(1 downto 0);
        ARBURST_S7  : out std_logic_vector(1 downto 0);
        ARBURST_S8  : out std_logic_vector(1 downto 0);
        ARBURST_S9  : out std_logic_vector(1 downto 0);
        ARCACHE_S0  : out std_logic_vector(3 downto 0);
        ARCACHE_S1  : out std_logic_vector(3 downto 0);
        ARCACHE_S10 : out std_logic_vector(3 downto 0);
        ARCACHE_S11 : out std_logic_vector(3 downto 0);
        ARCACHE_S12 : out std_logic_vector(3 downto 0);
        ARCACHE_S13 : out std_logic_vector(3 downto 0);
        ARCACHE_S14 : out std_logic_vector(3 downto 0);
        ARCACHE_S15 : out std_logic_vector(3 downto 0);
        ARCACHE_S16 : out std_logic_vector(3 downto 0);
        ARCACHE_S2  : out std_logic_vector(3 downto 0);
        ARCACHE_S3  : out std_logic_vector(3 downto 0);
        ARCACHE_S4  : out std_logic_vector(3 downto 0);
        ARCACHE_S5  : out std_logic_vector(3 downto 0);
        ARCACHE_S6  : out std_logic_vector(3 downto 0);
        ARCACHE_S7  : out std_logic_vector(3 downto 0);
        ARCACHE_S8  : out std_logic_vector(3 downto 0);
        ARCACHE_S9  : out std_logic_vector(3 downto 0);
        ARID_S0     : out std_logic_vector(5 downto 0);
        ARID_S1     : out std_logic_vector(5 downto 0);
        ARID_S10    : out std_logic_vector(5 downto 0);
        ARID_S11    : out std_logic_vector(5 downto 0);
        ARID_S12    : out std_logic_vector(5 downto 0);
        ARID_S13    : out std_logic_vector(5 downto 0);
        ARID_S14    : out std_logic_vector(5 downto 0);
        ARID_S15    : out std_logic_vector(5 downto 0);
        ARID_S16    : out std_logic_vector(5 downto 0);
        ARID_S2     : out std_logic_vector(5 downto 0);
        ARID_S3     : out std_logic_vector(5 downto 0);
        ARID_S4     : out std_logic_vector(5 downto 0);
        ARID_S5     : out std_logic_vector(5 downto 0);
        ARID_S6     : out std_logic_vector(5 downto 0);
        ARID_S7     : out std_logic_vector(5 downto 0);
        ARID_S8     : out std_logic_vector(5 downto 0);
        ARID_S9     : out std_logic_vector(5 downto 0);
        ARLEN_S0    : out std_logic_vector(3 downto 0);
        ARLEN_S1    : out std_logic_vector(3 downto 0);
        ARLEN_S10   : out std_logic_vector(3 downto 0);
        ARLEN_S11   : out std_logic_vector(3 downto 0);
        ARLEN_S12   : out std_logic_vector(3 downto 0);
        ARLEN_S13   : out std_logic_vector(3 downto 0);
        ARLEN_S14   : out std_logic_vector(3 downto 0);
        ARLEN_S15   : out std_logic_vector(3 downto 0);
        ARLEN_S16   : out std_logic_vector(3 downto 0);
        ARLEN_S2    : out std_logic_vector(3 downto 0);
        ARLEN_S3    : out std_logic_vector(3 downto 0);
        ARLEN_S4    : out std_logic_vector(3 downto 0);
        ARLEN_S5    : out std_logic_vector(3 downto 0);
        ARLEN_S6    : out std_logic_vector(3 downto 0);
        ARLEN_S7    : out std_logic_vector(3 downto 0);
        ARLEN_S8    : out std_logic_vector(3 downto 0);
        ARLEN_S9    : out std_logic_vector(3 downto 0);
        ARLOCK_S0   : out std_logic_vector(1 downto 0);
        ARLOCK_S1   : out std_logic_vector(1 downto 0);
        ARLOCK_S10  : out std_logic_vector(1 downto 0);
        ARLOCK_S11  : out std_logic_vector(1 downto 0);
        ARLOCK_S12  : out std_logic_vector(1 downto 0);
        ARLOCK_S13  : out std_logic_vector(1 downto 0);
        ARLOCK_S14  : out std_logic_vector(1 downto 0);
        ARLOCK_S15  : out std_logic_vector(1 downto 0);
        ARLOCK_S16  : out std_logic_vector(1 downto 0);
        ARLOCK_S2   : out std_logic_vector(1 downto 0);
        ARLOCK_S3   : out std_logic_vector(1 downto 0);
        ARLOCK_S4   : out std_logic_vector(1 downto 0);
        ARLOCK_S5   : out std_logic_vector(1 downto 0);
        ARLOCK_S6   : out std_logic_vector(1 downto 0);
        ARLOCK_S7   : out std_logic_vector(1 downto 0);
        ARLOCK_S8   : out std_logic_vector(1 downto 0);
        ARLOCK_S9   : out std_logic_vector(1 downto 0);
        ARPROT_S0   : out std_logic_vector(2 downto 0);
        ARPROT_S1   : out std_logic_vector(2 downto 0);
        ARPROT_S10  : out std_logic_vector(2 downto 0);
        ARPROT_S11  : out std_logic_vector(2 downto 0);
        ARPROT_S12  : out std_logic_vector(2 downto 0);
        ARPROT_S13  : out std_logic_vector(2 downto 0);
        ARPROT_S14  : out std_logic_vector(2 downto 0);
        ARPROT_S15  : out std_logic_vector(2 downto 0);
        ARPROT_S16  : out std_logic_vector(2 downto 0);
        ARPROT_S2   : out std_logic_vector(2 downto 0);
        ARPROT_S3   : out std_logic_vector(2 downto 0);
        ARPROT_S4   : out std_logic_vector(2 downto 0);
        ARPROT_S5   : out std_logic_vector(2 downto 0);
        ARPROT_S6   : out std_logic_vector(2 downto 0);
        ARPROT_S7   : out std_logic_vector(2 downto 0);
        ARPROT_S8   : out std_logic_vector(2 downto 0);
        ARPROT_S9   : out std_logic_vector(2 downto 0);
        ARREADY_M0  : out std_logic;
        ARREADY_M1  : out std_logic;
        ARREADY_M2  : out std_logic;
        ARREADY_M3  : out std_logic;
        ARSIZE_S0   : out std_logic_vector(2 downto 0);
        ARSIZE_S1   : out std_logic_vector(2 downto 0);
        ARSIZE_S10  : out std_logic_vector(2 downto 0);
        ARSIZE_S11  : out std_logic_vector(2 downto 0);
        ARSIZE_S12  : out std_logic_vector(2 downto 0);
        ARSIZE_S13  : out std_logic_vector(2 downto 0);
        ARSIZE_S14  : out std_logic_vector(2 downto 0);
        ARSIZE_S15  : out std_logic_vector(2 downto 0);
        ARSIZE_S16  : out std_logic_vector(2 downto 0);
        ARSIZE_S2   : out std_logic_vector(2 downto 0);
        ARSIZE_S3   : out std_logic_vector(2 downto 0);
        ARSIZE_S4   : out std_logic_vector(2 downto 0);
        ARSIZE_S5   : out std_logic_vector(2 downto 0);
        ARSIZE_S6   : out std_logic_vector(2 downto 0);
        ARSIZE_S7   : out std_logic_vector(2 downto 0);
        ARSIZE_S8   : out std_logic_vector(2 downto 0);
        ARSIZE_S9   : out std_logic_vector(2 downto 0);
        ARVALID_S0  : out std_logic;
        ARVALID_S1  : out std_logic;
        ARVALID_S10 : out std_logic;
        ARVALID_S11 : out std_logic;
        ARVALID_S12 : out std_logic;
        ARVALID_S13 : out std_logic;
        ARVALID_S14 : out std_logic;
        ARVALID_S15 : out std_logic;
        ARVALID_S16 : out std_logic;
        ARVALID_S2  : out std_logic;
        ARVALID_S3  : out std_logic;
        ARVALID_S4  : out std_logic;
        ARVALID_S5  : out std_logic;
        ARVALID_S6  : out std_logic;
        ARVALID_S7  : out std_logic;
        ARVALID_S8  : out std_logic;
        ARVALID_S9  : out std_logic;
        AWADDR_S0   : out std_logic_vector(31 downto 0);
        AWADDR_S1   : out std_logic_vector(31 downto 0);
        AWADDR_S10  : out std_logic_vector(31 downto 0);
        AWADDR_S11  : out std_logic_vector(31 downto 0);
        AWADDR_S12  : out std_logic_vector(31 downto 0);
        AWADDR_S13  : out std_logic_vector(31 downto 0);
        AWADDR_S14  : out std_logic_vector(31 downto 0);
        AWADDR_S15  : out std_logic_vector(31 downto 0);
        AWADDR_S16  : out std_logic_vector(31 downto 0);
        AWADDR_S2   : out std_logic_vector(31 downto 0);
        AWADDR_S3   : out std_logic_vector(31 downto 0);
        AWADDR_S4   : out std_logic_vector(31 downto 0);
        AWADDR_S5   : out std_logic_vector(31 downto 0);
        AWADDR_S6   : out std_logic_vector(31 downto 0);
        AWADDR_S7   : out std_logic_vector(31 downto 0);
        AWADDR_S8   : out std_logic_vector(31 downto 0);
        AWADDR_S9   : out std_logic_vector(31 downto 0);
        AWBURST_S0  : out std_logic_vector(1 downto 0);
        AWBURST_S1  : out std_logic_vector(1 downto 0);
        AWBURST_S10 : out std_logic_vector(1 downto 0);
        AWBURST_S11 : out std_logic_vector(1 downto 0);
        AWBURST_S12 : out std_logic_vector(1 downto 0);
        AWBURST_S13 : out std_logic_vector(1 downto 0);
        AWBURST_S14 : out std_logic_vector(1 downto 0);
        AWBURST_S15 : out std_logic_vector(1 downto 0);
        AWBURST_S16 : out std_logic_vector(1 downto 0);
        AWBURST_S2  : out std_logic_vector(1 downto 0);
        AWBURST_S3  : out std_logic_vector(1 downto 0);
        AWBURST_S4  : out std_logic_vector(1 downto 0);
        AWBURST_S5  : out std_logic_vector(1 downto 0);
        AWBURST_S6  : out std_logic_vector(1 downto 0);
        AWBURST_S7  : out std_logic_vector(1 downto 0);
        AWBURST_S8  : out std_logic_vector(1 downto 0);
        AWBURST_S9  : out std_logic_vector(1 downto 0);
        AWCACHE_S0  : out std_logic_vector(3 downto 0);
        AWCACHE_S1  : out std_logic_vector(3 downto 0);
        AWCACHE_S10 : out std_logic_vector(3 downto 0);
        AWCACHE_S11 : out std_logic_vector(3 downto 0);
        AWCACHE_S12 : out std_logic_vector(3 downto 0);
        AWCACHE_S13 : out std_logic_vector(3 downto 0);
        AWCACHE_S14 : out std_logic_vector(3 downto 0);
        AWCACHE_S15 : out std_logic_vector(3 downto 0);
        AWCACHE_S16 : out std_logic_vector(3 downto 0);
        AWCACHE_S2  : out std_logic_vector(3 downto 0);
        AWCACHE_S3  : out std_logic_vector(3 downto 0);
        AWCACHE_S4  : out std_logic_vector(3 downto 0);
        AWCACHE_S5  : out std_logic_vector(3 downto 0);
        AWCACHE_S6  : out std_logic_vector(3 downto 0);
        AWCACHE_S7  : out std_logic_vector(3 downto 0);
        AWCACHE_S8  : out std_logic_vector(3 downto 0);
        AWCACHE_S9  : out std_logic_vector(3 downto 0);
        AWID_S0     : out std_logic_vector(5 downto 0);
        AWID_S1     : out std_logic_vector(5 downto 0);
        AWID_S10    : out std_logic_vector(5 downto 0);
        AWID_S11    : out std_logic_vector(5 downto 0);
        AWID_S12    : out std_logic_vector(5 downto 0);
        AWID_S13    : out std_logic_vector(5 downto 0);
        AWID_S14    : out std_logic_vector(5 downto 0);
        AWID_S15    : out std_logic_vector(5 downto 0);
        AWID_S16    : out std_logic_vector(5 downto 0);
        AWID_S2     : out std_logic_vector(5 downto 0);
        AWID_S3     : out std_logic_vector(5 downto 0);
        AWID_S4     : out std_logic_vector(5 downto 0);
        AWID_S5     : out std_logic_vector(5 downto 0);
        AWID_S6     : out std_logic_vector(5 downto 0);
        AWID_S7     : out std_logic_vector(5 downto 0);
        AWID_S8     : out std_logic_vector(5 downto 0);
        AWID_S9     : out std_logic_vector(5 downto 0);
        AWLEN_S0    : out std_logic_vector(3 downto 0);
        AWLEN_S1    : out std_logic_vector(3 downto 0);
        AWLEN_S10   : out std_logic_vector(3 downto 0);
        AWLEN_S11   : out std_logic_vector(3 downto 0);
        AWLEN_S12   : out std_logic_vector(3 downto 0);
        AWLEN_S13   : out std_logic_vector(3 downto 0);
        AWLEN_S14   : out std_logic_vector(3 downto 0);
        AWLEN_S15   : out std_logic_vector(3 downto 0);
        AWLEN_S16   : out std_logic_vector(3 downto 0);
        AWLEN_S2    : out std_logic_vector(3 downto 0);
        AWLEN_S3    : out std_logic_vector(3 downto 0);
        AWLEN_S4    : out std_logic_vector(3 downto 0);
        AWLEN_S5    : out std_logic_vector(3 downto 0);
        AWLEN_S6    : out std_logic_vector(3 downto 0);
        AWLEN_S7    : out std_logic_vector(3 downto 0);
        AWLEN_S8    : out std_logic_vector(3 downto 0);
        AWLEN_S9    : out std_logic_vector(3 downto 0);
        AWLOCK_S0   : out std_logic_vector(1 downto 0);
        AWLOCK_S1   : out std_logic_vector(1 downto 0);
        AWLOCK_S10  : out std_logic_vector(1 downto 0);
        AWLOCK_S11  : out std_logic_vector(1 downto 0);
        AWLOCK_S12  : out std_logic_vector(1 downto 0);
        AWLOCK_S13  : out std_logic_vector(1 downto 0);
        AWLOCK_S14  : out std_logic_vector(1 downto 0);
        AWLOCK_S15  : out std_logic_vector(1 downto 0);
        AWLOCK_S16  : out std_logic_vector(1 downto 0);
        AWLOCK_S2   : out std_logic_vector(1 downto 0);
        AWLOCK_S3   : out std_logic_vector(1 downto 0);
        AWLOCK_S4   : out std_logic_vector(1 downto 0);
        AWLOCK_S5   : out std_logic_vector(1 downto 0);
        AWLOCK_S6   : out std_logic_vector(1 downto 0);
        AWLOCK_S7   : out std_logic_vector(1 downto 0);
        AWLOCK_S8   : out std_logic_vector(1 downto 0);
        AWLOCK_S9   : out std_logic_vector(1 downto 0);
        AWPROT_S0   : out std_logic_vector(2 downto 0);
        AWPROT_S1   : out std_logic_vector(2 downto 0);
        AWPROT_S10  : out std_logic_vector(2 downto 0);
        AWPROT_S11  : out std_logic_vector(2 downto 0);
        AWPROT_S12  : out std_logic_vector(2 downto 0);
        AWPROT_S13  : out std_logic_vector(2 downto 0);
        AWPROT_S14  : out std_logic_vector(2 downto 0);
        AWPROT_S15  : out std_logic_vector(2 downto 0);
        AWPROT_S16  : out std_logic_vector(2 downto 0);
        AWPROT_S2   : out std_logic_vector(2 downto 0);
        AWPROT_S3   : out std_logic_vector(2 downto 0);
        AWPROT_S4   : out std_logic_vector(2 downto 0);
        AWPROT_S5   : out std_logic_vector(2 downto 0);
        AWPROT_S6   : out std_logic_vector(2 downto 0);
        AWPROT_S7   : out std_logic_vector(2 downto 0);
        AWPROT_S8   : out std_logic_vector(2 downto 0);
        AWPROT_S9   : out std_logic_vector(2 downto 0);
        AWREADY_M0  : out std_logic;
        AWREADY_M1  : out std_logic;
        AWREADY_M2  : out std_logic;
        AWREADY_M3  : out std_logic;
        AWSIZE_S0   : out std_logic_vector(2 downto 0);
        AWSIZE_S1   : out std_logic_vector(2 downto 0);
        AWSIZE_S10  : out std_logic_vector(2 downto 0);
        AWSIZE_S11  : out std_logic_vector(2 downto 0);
        AWSIZE_S12  : out std_logic_vector(2 downto 0);
        AWSIZE_S13  : out std_logic_vector(2 downto 0);
        AWSIZE_S14  : out std_logic_vector(2 downto 0);
        AWSIZE_S15  : out std_logic_vector(2 downto 0);
        AWSIZE_S16  : out std_logic_vector(2 downto 0);
        AWSIZE_S2   : out std_logic_vector(2 downto 0);
        AWSIZE_S3   : out std_logic_vector(2 downto 0);
        AWSIZE_S4   : out std_logic_vector(2 downto 0);
        AWSIZE_S5   : out std_logic_vector(2 downto 0);
        AWSIZE_S6   : out std_logic_vector(2 downto 0);
        AWSIZE_S7   : out std_logic_vector(2 downto 0);
        AWSIZE_S8   : out std_logic_vector(2 downto 0);
        AWSIZE_S9   : out std_logic_vector(2 downto 0);
        AWVALID_S0  : out std_logic;
        AWVALID_S1  : out std_logic;
        AWVALID_S10 : out std_logic;
        AWVALID_S11 : out std_logic;
        AWVALID_S12 : out std_logic;
        AWVALID_S13 : out std_logic;
        AWVALID_S14 : out std_logic;
        AWVALID_S15 : out std_logic;
        AWVALID_S16 : out std_logic;
        AWVALID_S2  : out std_logic;
        AWVALID_S3  : out std_logic;
        AWVALID_S4  : out std_logic;
        AWVALID_S5  : out std_logic;
        AWVALID_S6  : out std_logic;
        AWVALID_S7  : out std_logic;
        AWVALID_S8  : out std_logic;
        AWVALID_S9  : out std_logic;
        BID_M0      : out std_logic_vector(3 downto 0);
        BID_M1      : out std_logic_vector(3 downto 0);
        BID_M2      : out std_logic_vector(3 downto 0);
        BID_M3      : out std_logic_vector(3 downto 0);
        BREADY_S0   : out std_logic;
        BREADY_S1   : out std_logic;
        BREADY_S10  : out std_logic;
        BREADY_S11  : out std_logic;
        BREADY_S12  : out std_logic;
        BREADY_S13  : out std_logic;
        BREADY_S14  : out std_logic;
        BREADY_S15  : out std_logic;
        BREADY_S16  : out std_logic;
        BREADY_S2   : out std_logic;
        BREADY_S3   : out std_logic;
        BREADY_S4   : out std_logic;
        BREADY_S5   : out std_logic;
        BREADY_S6   : out std_logic;
        BREADY_S7   : out std_logic;
        BREADY_S8   : out std_logic;
        BREADY_S9   : out std_logic;
        BRESP_M0    : out std_logic_vector(1 downto 0);
        BRESP_M1    : out std_logic_vector(1 downto 0);
        BRESP_M2    : out std_logic_vector(1 downto 0);
        BRESP_M3    : out std_logic_vector(1 downto 0);
        BVALID_M0   : out std_logic;
        BVALID_M1   : out std_logic;
        BVALID_M2   : out std_logic;
        BVALID_M3   : out std_logic;
        RDATA_M0    : out std_logic_vector(63 downto 0);
        RDATA_M1    : out std_logic_vector(63 downto 0);
        RDATA_M2    : out std_logic_vector(63 downto 0);
        RDATA_M3    : out std_logic_vector(63 downto 0);
        RID_M0      : out std_logic_vector(3 downto 0);
        RID_M1      : out std_logic_vector(3 downto 0);
        RID_M2      : out std_logic_vector(3 downto 0);
        RID_M3      : out std_logic_vector(3 downto 0);
        RLAST_M0    : out std_logic;
        RLAST_M1    : out std_logic;
        RLAST_M2    : out std_logic;
        RLAST_M3    : out std_logic;
        RREADY_S0   : out std_logic;
        RREADY_S1   : out std_logic;
        RREADY_S10  : out std_logic;
        RREADY_S11  : out std_logic;
        RREADY_S12  : out std_logic;
        RREADY_S13  : out std_logic;
        RREADY_S14  : out std_logic;
        RREADY_S15  : out std_logic;
        RREADY_S16  : out std_logic;
        RREADY_S2   : out std_logic;
        RREADY_S3   : out std_logic;
        RREADY_S4   : out std_logic;
        RREADY_S5   : out std_logic;
        RREADY_S6   : out std_logic;
        RREADY_S7   : out std_logic;
        RREADY_S8   : out std_logic;
        RREADY_S9   : out std_logic;
        RRESP_M0    : out std_logic_vector(1 downto 0);
        RRESP_M1    : out std_logic_vector(1 downto 0);
        RRESP_M2    : out std_logic_vector(1 downto 0);
        RRESP_M3    : out std_logic_vector(1 downto 0);
        RVALID_M0   : out std_logic;
        RVALID_M1   : out std_logic;
        RVALID_M2   : out std_logic;
        RVALID_M3   : out std_logic;
        WDATA_S0    : out std_logic_vector(63 downto 0);
        WDATA_S1    : out std_logic_vector(63 downto 0);
        WDATA_S10   : out std_logic_vector(63 downto 0);
        WDATA_S11   : out std_logic_vector(63 downto 0);
        WDATA_S12   : out std_logic_vector(63 downto 0);
        WDATA_S13   : out std_logic_vector(63 downto 0);
        WDATA_S14   : out std_logic_vector(63 downto 0);
        WDATA_S15   : out std_logic_vector(63 downto 0);
        WDATA_S16   : out std_logic_vector(63 downto 0);
        WDATA_S2    : out std_logic_vector(63 downto 0);
        WDATA_S3    : out std_logic_vector(63 downto 0);
        WDATA_S4    : out std_logic_vector(63 downto 0);
        WDATA_S5    : out std_logic_vector(63 downto 0);
        WDATA_S6    : out std_logic_vector(63 downto 0);
        WDATA_S7    : out std_logic_vector(63 downto 0);
        WDATA_S8    : out std_logic_vector(63 downto 0);
        WDATA_S9    : out std_logic_vector(63 downto 0);
        WID_S0      : out std_logic_vector(5 downto 0);
        WID_S1      : out std_logic_vector(5 downto 0);
        WID_S10     : out std_logic_vector(5 downto 0);
        WID_S11     : out std_logic_vector(5 downto 0);
        WID_S12     : out std_logic_vector(5 downto 0);
        WID_S13     : out std_logic_vector(5 downto 0);
        WID_S14     : out std_logic_vector(5 downto 0);
        WID_S15     : out std_logic_vector(5 downto 0);
        WID_S16     : out std_logic_vector(5 downto 0);
        WID_S2      : out std_logic_vector(5 downto 0);
        WID_S3      : out std_logic_vector(5 downto 0);
        WID_S4      : out std_logic_vector(5 downto 0);
        WID_S5      : out std_logic_vector(5 downto 0);
        WID_S6      : out std_logic_vector(5 downto 0);
        WID_S7      : out std_logic_vector(5 downto 0);
        WID_S8      : out std_logic_vector(5 downto 0);
        WID_S9      : out std_logic_vector(5 downto 0);
        WLAST_S0    : out std_logic;
        WLAST_S1    : out std_logic;
        WLAST_S10   : out std_logic;
        WLAST_S11   : out std_logic;
        WLAST_S12   : out std_logic;
        WLAST_S13   : out std_logic;
        WLAST_S14   : out std_logic;
        WLAST_S15   : out std_logic;
        WLAST_S16   : out std_logic;
        WLAST_S2    : out std_logic;
        WLAST_S3    : out std_logic;
        WLAST_S4    : out std_logic;
        WLAST_S5    : out std_logic;
        WLAST_S6    : out std_logic;
        WLAST_S7    : out std_logic;
        WLAST_S8    : out std_logic;
        WLAST_S9    : out std_logic;
        WREADY_M0   : out std_logic;
        WREADY_M1   : out std_logic;
        WREADY_M2   : out std_logic;
        WREADY_M3   : out std_logic;
        WSTRB_S0    : out std_logic_vector(7 downto 0);
        WSTRB_S1    : out std_logic_vector(7 downto 0);
        WSTRB_S10   : out std_logic_vector(7 downto 0);
        WSTRB_S11   : out std_logic_vector(7 downto 0);
        WSTRB_S12   : out std_logic_vector(7 downto 0);
        WSTRB_S13   : out std_logic_vector(7 downto 0);
        WSTRB_S14   : out std_logic_vector(7 downto 0);
        WSTRB_S15   : out std_logic_vector(7 downto 0);
        WSTRB_S16   : out std_logic_vector(7 downto 0);
        WSTRB_S2    : out std_logic_vector(7 downto 0);
        WSTRB_S3    : out std_logic_vector(7 downto 0);
        WSTRB_S4    : out std_logic_vector(7 downto 0);
        WSTRB_S5    : out std_logic_vector(7 downto 0);
        WSTRB_S6    : out std_logic_vector(7 downto 0);
        WSTRB_S7    : out std_logic_vector(7 downto 0);
        WSTRB_S8    : out std_logic_vector(7 downto 0);
        WSTRB_S9    : out std_logic_vector(7 downto 0);
        WVALID_S0   : out std_logic;
        WVALID_S1   : out std_logic;
        WVALID_S10  : out std_logic;
        WVALID_S11  : out std_logic;
        WVALID_S12  : out std_logic;
        WVALID_S13  : out std_logic;
        WVALID_S14  : out std_logic;
        WVALID_S15  : out std_logic;
        WVALID_S16  : out std_logic;
        WVALID_S2   : out std_logic;
        WVALID_S3   : out std_logic;
        WVALID_S4   : out std_logic;
        WVALID_S5   : out std_logic;
        WVALID_S6   : out std_logic;
        WVALID_S7   : out std_logic;
        WVALID_S8   : out std_logic;
        WVALID_S9   : out std_logic
        );
end component;
-- CoreConfigP   -   Actel:DirectCore:CoreConfigP:7.1.100
component CoreConfigP
    generic( 
        DEVICE_090         : integer := 0 ;
        ENABLE_SOFT_RESETS : integer := 1 ;
        FDDR_IN_USE        : integer := 0 ;
        MDDR_IN_USE        : integer := 1 ;
        SDIF0_IN_USE       : integer := 0 ;
        SDIF0_PCIE         : integer := 0 ;
        SDIF1_IN_USE       : integer := 0 ;
        SDIF1_PCIE         : integer := 0 ;
        SDIF2_IN_USE       : integer := 0 ;
        SDIF2_PCIE         : integer := 0 ;
        SDIF3_IN_USE       : integer := 0 ;
        SDIF3_PCIE         : integer := 0 
        );
    -- Port list
    port(
        -- Inputs
        FDDR_PRDATA                    : in  std_logic_vector(31 downto 0);
        FDDR_PREADY                    : in  std_logic;
        FDDR_PSLVERR                   : in  std_logic;
        FIC_2_APB_M_PADDR              : in  std_logic_vector(16 downto 2);
        FIC_2_APB_M_PCLK               : in  std_logic;
        FIC_2_APB_M_PENABLE            : in  std_logic;
        FIC_2_APB_M_PRESET_N           : in  std_logic;
        FIC_2_APB_M_PSEL               : in  std_logic;
        FIC_2_APB_M_PWDATA             : in  std_logic_vector(31 downto 0);
        FIC_2_APB_M_PWRITE             : in  std_logic;
        INIT_DONE                      : in  std_logic;
        MDDR_PRDATA                    : in  std_logic_vector(31 downto 0);
        MDDR_PREADY                    : in  std_logic;
        MDDR_PSLVERR                   : in  std_logic;
        SDIF0_PRDATA                   : in  std_logic_vector(31 downto 0);
        SDIF0_PREADY                   : in  std_logic;
        SDIF0_PSLVERR                  : in  std_logic;
        SDIF1_PRDATA                   : in  std_logic_vector(31 downto 0);
        SDIF1_PREADY                   : in  std_logic;
        SDIF1_PSLVERR                  : in  std_logic;
        SDIF2_PRDATA                   : in  std_logic_vector(31 downto 0);
        SDIF2_PREADY                   : in  std_logic;
        SDIF2_PSLVERR                  : in  std_logic;
        SDIF3_PRDATA                   : in  std_logic_vector(31 downto 0);
        SDIF3_PREADY                   : in  std_logic;
        SDIF3_PSLVERR                  : in  std_logic;
        SDIF_RELEASED                  : in  std_logic;
        -- Outputs
        APB_S_PCLK                     : out std_logic;
        APB_S_PRESET_N                 : out std_logic;
        CONFIG1_DONE                   : out std_logic;
        CONFIG2_DONE                   : out std_logic;
        FDDR_PADDR                     : out std_logic_vector(15 downto 2);
        FDDR_PENABLE                   : out std_logic;
        FDDR_PSEL                      : out std_logic;
        FDDR_PWDATA                    : out std_logic_vector(31 downto 0);
        FDDR_PWRITE                    : out std_logic;
        FIC_2_APB_M_PRDATA             : out std_logic_vector(31 downto 0);
        FIC_2_APB_M_PREADY             : out std_logic;
        FIC_2_APB_M_PSLVERR            : out std_logic;
        MDDR_PADDR                     : out std_logic_vector(15 downto 2);
        MDDR_PENABLE                   : out std_logic;
        MDDR_PSEL                      : out std_logic;
        MDDR_PWDATA                    : out std_logic_vector(31 downto 0);
        MDDR_PWRITE                    : out std_logic;
        R_SDIF0_PRDATA                 : out std_logic_vector(31 downto 0);
        R_SDIF0_PSEL                   : out std_logic;
        R_SDIF0_PWRITE                 : out std_logic;
        R_SDIF1_PRDATA                 : out std_logic_vector(31 downto 0);
        R_SDIF1_PSEL                   : out std_logic;
        R_SDIF1_PWRITE                 : out std_logic;
        R_SDIF2_PRDATA                 : out std_logic_vector(31 downto 0);
        R_SDIF2_PSEL                   : out std_logic;
        R_SDIF2_PWRITE                 : out std_logic;
        R_SDIF3_PRDATA                 : out std_logic_vector(31 downto 0);
        R_SDIF3_PSEL                   : out std_logic;
        R_SDIF3_PWRITE                 : out std_logic;
        SDIF0_PADDR                    : out std_logic_vector(15 downto 2);
        SDIF0_PENABLE                  : out std_logic;
        SDIF0_PSEL                     : out std_logic;
        SDIF0_PWDATA                   : out std_logic_vector(31 downto 0);
        SDIF0_PWRITE                   : out std_logic;
        SDIF1_PADDR                    : out std_logic_vector(15 downto 2);
        SDIF1_PENABLE                  : out std_logic;
        SDIF1_PSEL                     : out std_logic;
        SDIF1_PWDATA                   : out std_logic_vector(31 downto 0);
        SDIF1_PWRITE                   : out std_logic;
        SDIF2_PADDR                    : out std_logic_vector(15 downto 2);
        SDIF2_PENABLE                  : out std_logic;
        SDIF2_PSEL                     : out std_logic;
        SDIF2_PWDATA                   : out std_logic_vector(31 downto 0);
        SDIF2_PWRITE                   : out std_logic;
        SDIF3_PADDR                    : out std_logic_vector(15 downto 2);
        SDIF3_PENABLE                  : out std_logic;
        SDIF3_PSEL                     : out std_logic;
        SDIF3_PWDATA                   : out std_logic_vector(31 downto 0);
        SDIF3_PWRITE                   : out std_logic;
        SOFT_EXT_RESET_OUT             : out std_logic;
        SOFT_FDDR_CORE_RESET           : out std_logic;
        SOFT_M3_RESET                  : out std_logic;
        SOFT_MDDR_DDR_AXI_S_CORE_RESET : out std_logic;
        SOFT_RESET_F2M                 : out std_logic;
        SOFT_SDIF0_0_CORE_RESET        : out std_logic;
        SOFT_SDIF0_1_CORE_RESET        : out std_logic;
        SOFT_SDIF0_CORE_RESET          : out std_logic;
        SOFT_SDIF0_PHY_RESET           : out std_logic;
        SOFT_SDIF1_CORE_RESET          : out std_logic;
        SOFT_SDIF1_PHY_RESET           : out std_logic;
        SOFT_SDIF2_CORE_RESET          : out std_logic;
        SOFT_SDIF2_PHY_RESET           : out std_logic;
        SOFT_SDIF3_CORE_RESET          : out std_logic;
        SOFT_SDIF3_PHY_RESET           : out std_logic
        );
end component;
-- CoreResetP   -   Actel:DirectCore:CoreResetP:7.1.100
component CoreResetP
    generic( 
        DDR_WAIT            : integer := 200 ;
        DEVICE_090          : integer := 0 ;
        DEVICE_VOLTAGE      : integer := 2 ;
        ENABLE_SOFT_RESETS  : integer := 1 ;
        EXT_RESET_CFG       : integer := 0 ;
        FDDR_IN_USE         : integer := 0 ;
        MDDR_IN_USE         : integer := 1 ;
        SDIF0_IN_USE        : integer := 0 ;
        SDIF0_PCIE          : integer := 0 ;
        SDIF0_PCIE_HOTRESET : integer := 1 ;
        SDIF0_PCIE_L2P2     : integer := 1 ;
        SDIF1_IN_USE        : integer := 0 ;
        SDIF1_PCIE          : integer := 0 ;
        SDIF1_PCIE_HOTRESET : integer := 1 ;
        SDIF1_PCIE_L2P2     : integer := 1 ;
        SDIF2_IN_USE        : integer := 0 ;
        SDIF2_PCIE          : integer := 0 ;
        SDIF2_PCIE_HOTRESET : integer := 1 ;
        SDIF2_PCIE_L2P2     : integer := 1 ;
        SDIF3_IN_USE        : integer := 0 ;
        SDIF3_PCIE          : integer := 0 ;
        SDIF3_PCIE_HOTRESET : integer := 1 ;
        SDIF3_PCIE_L2P2     : integer := 1 
        );
    -- Port list
    port(
        -- Inputs
        CLK_BASE                       : in  std_logic;
        CLK_LTSSM                      : in  std_logic;
        CONFIG1_DONE                   : in  std_logic;
        CONFIG2_DONE                   : in  std_logic;
        FAB_RESET_N                    : in  std_logic;
        FIC_2_APB_M_PRESET_N           : in  std_logic;
        FPLL_LOCK                      : in  std_logic;
        POWER_ON_RESET_N               : in  std_logic;
        RCOSC_25_50MHZ                 : in  std_logic;
        RESET_N_M2F                    : in  std_logic;
        SDIF0_PERST_N                  : in  std_logic;
        SDIF0_PRDATA                   : in  std_logic_vector(31 downto 0);
        SDIF0_PSEL                     : in  std_logic;
        SDIF0_PWRITE                   : in  std_logic;
        SDIF0_SPLL_LOCK                : in  std_logic;
        SDIF1_PERST_N                  : in  std_logic;
        SDIF1_PRDATA                   : in  std_logic_vector(31 downto 0);
        SDIF1_PSEL                     : in  std_logic;
        SDIF1_PWRITE                   : in  std_logic;
        SDIF1_SPLL_LOCK                : in  std_logic;
        SDIF2_PERST_N                  : in  std_logic;
        SDIF2_PRDATA                   : in  std_logic_vector(31 downto 0);
        SDIF2_PSEL                     : in  std_logic;
        SDIF2_PWRITE                   : in  std_logic;
        SDIF2_SPLL_LOCK                : in  std_logic;
        SDIF3_PERST_N                  : in  std_logic;
        SDIF3_PRDATA                   : in  std_logic_vector(31 downto 0);
        SDIF3_PSEL                     : in  std_logic;
        SDIF3_PWRITE                   : in  std_logic;
        SDIF3_SPLL_LOCK                : in  std_logic;
        SOFT_EXT_RESET_OUT             : in  std_logic;
        SOFT_FDDR_CORE_RESET           : in  std_logic;
        SOFT_M3_RESET                  : in  std_logic;
        SOFT_MDDR_DDR_AXI_S_CORE_RESET : in  std_logic;
        SOFT_RESET_F2M                 : in  std_logic;
        SOFT_SDIF0_0_CORE_RESET        : in  std_logic;
        SOFT_SDIF0_1_CORE_RESET        : in  std_logic;
        SOFT_SDIF0_CORE_RESET          : in  std_logic;
        SOFT_SDIF0_PHY_RESET           : in  std_logic;
        SOFT_SDIF1_CORE_RESET          : in  std_logic;
        SOFT_SDIF1_PHY_RESET           : in  std_logic;
        SOFT_SDIF2_CORE_RESET          : in  std_logic;
        SOFT_SDIF2_PHY_RESET           : in  std_logic;
        SOFT_SDIF3_CORE_RESET          : in  std_logic;
        SOFT_SDIF3_PHY_RESET           : in  std_logic;
        -- Outputs
        DDR_READY                      : out std_logic;
        EXT_RESET_OUT                  : out std_logic;
        FDDR_CORE_RESET_N              : out std_logic;
        INIT_DONE                      : out std_logic;
        M3_RESET_N                     : out std_logic;
        MDDR_DDR_AXI_S_CORE_RESET_N    : out std_logic;
        MSS_HPMS_READY                 : out std_logic;
        RESET_N_F2M                    : out std_logic;
        SDIF0_0_CORE_RESET_N           : out std_logic;
        SDIF0_1_CORE_RESET_N           : out std_logic;
        SDIF0_CORE_RESET_N             : out std_logic;
        SDIF0_PHY_RESET_N              : out std_logic;
        SDIF1_CORE_RESET_N             : out std_logic;
        SDIF1_PHY_RESET_N              : out std_logic;
        SDIF2_CORE_RESET_N             : out std_logic;
        SDIF2_PHY_RESET_N              : out std_logic;
        SDIF3_CORE_RESET_N             : out std_logic;
        SDIF3_PHY_RESET_N              : out std_logic;
        SDIF_READY                     : out std_logic;
        SDIF_RELEASED                  : out std_logic
        );
end component;
-- MDDR_Demo_sb_sb_FABOSC_0_OSC   -   Actel:SgCore:OSC:2.0.101
component MDDR_Demo_sb_sb_FABOSC_0_OSC
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
-- MDDR_Demo_sb_sb_MSS
component MDDR_Demo_sb_sb_MSS
    -- Port list
    port(
        -- Inputs
        FIC_0_APB_M_PRDATA     : in    std_logic_vector(31 downto 0);
        FIC_0_APB_M_PREADY     : in    std_logic;
        FIC_0_APB_M_PSLVERR    : in    std_logic;
        FIC_2_APB_M_PRDATA     : in    std_logic_vector(31 downto 0);
        FIC_2_APB_M_PREADY     : in    std_logic;
        FIC_2_APB_M_PSLVERR    : in    std_logic;
        GPIO_0_F2M             : in    std_logic;
        GPIO_1_F2M             : in    std_logic;
        M3_RESET_N             : in    std_logic;
        MCCC_CLK_BASE          : in    std_logic;
        MCCC_CLK_BASE_PLL_LOCK : in    std_logic;
        MDDR_APB_S_PADDR       : in    std_logic_vector(10 downto 2);
        MDDR_APB_S_PCLK        : in    std_logic;
        MDDR_APB_S_PENABLE     : in    std_logic;
        MDDR_APB_S_PRESET_N    : in    std_logic;
        MDDR_APB_S_PSEL        : in    std_logic;
        MDDR_APB_S_PWDATA      : in    std_logic_vector(15 downto 0);
        MDDR_APB_S_PWRITE      : in    std_logic;
        MDDR_DDR_AXI_S_ARADDR  : in    std_logic_vector(31 downto 0);
        MDDR_DDR_AXI_S_ARBURST : in    std_logic_vector(1 downto 0);
        MDDR_DDR_AXI_S_ARID    : in    std_logic_vector(3 downto 0);
        MDDR_DDR_AXI_S_ARLEN   : in    std_logic_vector(3 downto 0);
        MDDR_DDR_AXI_S_ARLOCK  : in    std_logic_vector(1 downto 0);
        MDDR_DDR_AXI_S_ARSIZE  : in    std_logic_vector(1 downto 0);
        MDDR_DDR_AXI_S_ARVALID : in    std_logic;
        MDDR_DDR_AXI_S_AWADDR  : in    std_logic_vector(31 downto 0);
        MDDR_DDR_AXI_S_AWBURST : in    std_logic_vector(1 downto 0);
        MDDR_DDR_AXI_S_AWID    : in    std_logic_vector(3 downto 0);
        MDDR_DDR_AXI_S_AWLEN   : in    std_logic_vector(3 downto 0);
        MDDR_DDR_AXI_S_AWLOCK  : in    std_logic_vector(1 downto 0);
        MDDR_DDR_AXI_S_AWSIZE  : in    std_logic_vector(1 downto 0);
        MDDR_DDR_AXI_S_AWVALID : in    std_logic;
        MDDR_DDR_AXI_S_BREADY  : in    std_logic;
        MDDR_DDR_AXI_S_RMW     : in    std_logic;
        MDDR_DDR_AXI_S_RREADY  : in    std_logic;
        MDDR_DDR_AXI_S_WDATA   : in    std_logic_vector(63 downto 0);
        MDDR_DDR_AXI_S_WID     : in    std_logic_vector(3 downto 0);
        MDDR_DDR_AXI_S_WLAST   : in    std_logic;
        MDDR_DDR_AXI_S_WSTRB   : in    std_logic_vector(7 downto 0);
        MDDR_DDR_AXI_S_WVALID  : in    std_logic;
        MDDR_DDR_CORE_RESET_N  : in    std_logic;
        MDDR_DQS_TMATCH_0_IN   : in    std_logic;
        MMUART_0_RXD_F2M       : in    std_logic;
        MSS_RESET_N_F2M        : in    std_logic;
        -- Outputs
        FIC_0_APB_M_PADDR      : out   std_logic_vector(31 downto 0);
        FIC_0_APB_M_PENABLE    : out   std_logic;
        FIC_0_APB_M_PSEL       : out   std_logic;
        FIC_0_APB_M_PWDATA     : out   std_logic_vector(31 downto 0);
        FIC_0_APB_M_PWRITE     : out   std_logic;
        FIC_2_APB_M_PADDR      : out   std_logic_vector(15 downto 2);
        FIC_2_APB_M_PCLK       : out   std_logic;
        FIC_2_APB_M_PENABLE    : out   std_logic;
        FIC_2_APB_M_PRESET_N   : out   std_logic;
        FIC_2_APB_M_PSEL       : out   std_logic;
        FIC_2_APB_M_PWDATA     : out   std_logic_vector(31 downto 0);
        FIC_2_APB_M_PWRITE     : out   std_logic;
        MDDR_ADDR              : out   std_logic_vector(15 downto 0);
        MDDR_APB_S_PRDATA      : out   std_logic_vector(15 downto 0);
        MDDR_APB_S_PREADY      : out   std_logic;
        MDDR_APB_S_PSLVERR     : out   std_logic;
        MDDR_BA                : out   std_logic_vector(2 downto 0);
        MDDR_CAS_N             : out   std_logic;
        MDDR_CKE               : out   std_logic;
        MDDR_CLK               : out   std_logic;
        MDDR_CLK_N             : out   std_logic;
        MDDR_CS_N              : out   std_logic;
        MDDR_DDR_AXI_S_ARREADY : out   std_logic;
        MDDR_DDR_AXI_S_AWREADY : out   std_logic;
        MDDR_DDR_AXI_S_BID     : out   std_logic_vector(3 downto 0);
        MDDR_DDR_AXI_S_BRESP   : out   std_logic_vector(1 downto 0);
        MDDR_DDR_AXI_S_BVALID  : out   std_logic;
        MDDR_DDR_AXI_S_RDATA   : out   std_logic_vector(63 downto 0);
        MDDR_DDR_AXI_S_RID     : out   std_logic_vector(3 downto 0);
        MDDR_DDR_AXI_S_RLAST   : out   std_logic;
        MDDR_DDR_AXI_S_RRESP   : out   std_logic_vector(1 downto 0);
        MDDR_DDR_AXI_S_RVALID  : out   std_logic;
        MDDR_DDR_AXI_S_WREADY  : out   std_logic;
        MDDR_DQS_TMATCH_0_OUT  : out   std_logic;
        MDDR_ODT               : out   std_logic;
        MDDR_RAS_N             : out   std_logic;
        MDDR_RESET_N           : out   std_logic;
        MDDR_WE_N              : out   std_logic;
        MMUART_0_TXD_M2F       : out   std_logic;
        MSS_RESET_N_M2F        : out   std_logic;
        -- Inouts
        MDDR_DM_RDQS           : inout std_logic_vector(0 to 0);
        MDDR_DQ                : inout std_logic_vector(7 downto 0);
        MDDR_DQS               : inout std_logic_vector(0 to 0);
        MDDR_DQS_N             : inout std_logic_vector(0 to 0)
        );
end component;
-- SYSRESET
component SYSRESET
    -- Port list
    port(
        -- Inputs
        DEVRST_N         : in  std_logic;
        -- Outputs
        POWER_ON_RESET_N : out std_logic
        );
end component;
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
signal AMBA_MASTER_0_ARREADY                              : std_logic;
signal AMBA_MASTER_0_AWREADY                              : std_logic;
signal AMBA_MASTER_0_BID                                  : std_logic_vector(3 downto 0);
signal AMBA_MASTER_0_BRESP                                : std_logic_vector(1 downto 0);
signal AMBA_MASTER_0_BVALID                               : std_logic;
signal AMBA_MASTER_0_RDATA                                : std_logic_vector(63 downto 0);
signal AMBA_MASTER_0_RID                                  : std_logic_vector(3 downto 0);
signal AMBA_MASTER_0_RLAST                                : std_logic;
signal AMBA_MASTER_0_RRESP                                : std_logic_vector(1 downto 0);
signal AMBA_MASTER_0_RVALID                               : std_logic;
signal AMBA_MASTER_0_WREADY                               : std_logic;
signal AMBA_SLAVE_0_PADDR                                 : std_logic_vector(31 downto 0);
signal AMBA_SLAVE_0_PENABLE                               : std_logic;
signal AMBA_SLAVE_0_PSELx                                 : std_logic;
signal AMBA_SLAVE_0_PWDATA                                : std_logic_vector(31 downto 0);
signal AMBA_SLAVE_0_PWRITE                                : std_logic;
signal COREAXI_0_AXImslave0_ARADDR                        : std_logic_vector(31 downto 0);
signal COREAXI_0_AXImslave0_ARBURST                       : std_logic_vector(1 downto 0);
signal COREAXI_0_AXImslave0_ARCACHE                       : std_logic_vector(3 downto 0);
signal COREAXI_0_AXImslave0_ARLEN                         : std_logic_vector(3 downto 0);
signal COREAXI_0_AXImslave0_ARLOCK                        : std_logic_vector(1 downto 0);
signal COREAXI_0_AXImslave0_ARPROT                        : std_logic_vector(2 downto 0);
signal COREAXI_0_AXImslave0_ARREADY                       : std_logic;
signal COREAXI_0_AXImslave0_ARVALID                       : std_logic;
signal COREAXI_0_AXImslave0_AWADDR                        : std_logic_vector(31 downto 0);
signal COREAXI_0_AXImslave0_AWBURST                       : std_logic_vector(1 downto 0);
signal COREAXI_0_AXImslave0_AWCACHE                       : std_logic_vector(3 downto 0);
signal COREAXI_0_AXImslave0_AWLEN                         : std_logic_vector(3 downto 0);
signal COREAXI_0_AXImslave0_AWLOCK                        : std_logic_vector(1 downto 0);
signal COREAXI_0_AXImslave0_AWPROT                        : std_logic_vector(2 downto 0);
signal COREAXI_0_AXImslave0_AWREADY                       : std_logic;
signal COREAXI_0_AXImslave0_AWVALID                       : std_logic;
signal COREAXI_0_AXImslave0_BREADY                        : std_logic;
signal COREAXI_0_AXImslave0_BRESP                         : std_logic_vector(1 downto 0);
signal COREAXI_0_AXImslave0_BVALID                        : std_logic;
signal COREAXI_0_AXImslave0_RDATA                         : std_logic_vector(63 downto 0);
signal COREAXI_0_AXImslave0_RLAST                         : std_logic;
signal COREAXI_0_AXImslave0_RREADY                        : std_logic;
signal COREAXI_0_AXImslave0_RRESP                         : std_logic_vector(1 downto 0);
signal COREAXI_0_AXImslave0_RVALID                        : std_logic;
signal COREAXI_0_AXImslave0_WDATA                         : std_logic_vector(63 downto 0);
signal COREAXI_0_AXImslave0_WLAST                         : std_logic;
signal COREAXI_0_AXImslave0_WREADY                        : std_logic;
signal COREAXI_0_AXImslave0_WSTRB                         : std_logic_vector(7 downto 0);
signal COREAXI_0_AXImslave0_WVALID                        : std_logic;
signal CORECONFIGP_0_APB_S_PCLK                           : std_logic;
signal CORECONFIGP_0_APB_S_PRESET_N                       : std_logic;
signal CORECONFIGP_0_CONFIG1_DONE                         : std_logic;
signal CORECONFIGP_0_CONFIG2_DONE                         : std_logic;
signal CORECONFIGP_0_MDDR_APBmslave_PENABLE               : std_logic;
signal CORECONFIGP_0_MDDR_APBmslave_PREADY                : std_logic;
signal CORECONFIGP_0_MDDR_APBmslave_PSELx                 : std_logic;
signal CORECONFIGP_0_MDDR_APBmslave_PSLVERR               : std_logic;
signal CORECONFIGP_0_MDDR_APBmslave_PWRITE                : std_logic;
signal CORECONFIGP_0_SOFT_EXT_RESET_OUT                   : std_logic;
signal CORECONFIGP_0_SOFT_M3_RESET                        : std_logic;
signal CORECONFIGP_0_SOFT_MDDR_DDR_AXI_S_CORE_RESET       : std_logic;
signal CORECONFIGP_0_SOFT_RESET_F2M                       : std_logic;
signal CORERESETP_0_M3_RESET_N                            : std_logic;
signal CORERESETP_0_MDDR_DDR_AXI_S_CORE_RESET_N           : std_logic;
signal CORERESETP_0_RESET_N_F2M                           : std_logic;
signal DDR_READY_net_0                                    : std_logic;
signal FABOSC_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC : std_logic;
signal FABOSC_0_RCOSC_25_50MHZ_O2F                        : std_logic;
signal FIC_0_CLK_net_0                                    : std_logic;
signal INIT_DONE_net_0                                    : std_logic;
signal MDDR_ADDR_net_0                                    : std_logic_vector(15 downto 0);
signal MDDR_BA_net_0                                      : std_logic_vector(2 downto 0);
signal MDDR_CAS_N_net_0                                   : std_logic;
signal MDDR_CKE_net_0                                     : std_logic;
signal MDDR_CLK_net_0                                     : std_logic;
signal MDDR_CLK_N_net_0                                   : std_logic;
signal MDDR_CS_N_net_0                                    : std_logic;
signal MDDR_Demo_sb_sb_MSS_TMP_0_FIC_0_APB_MASTER_PADDR   : std_logic_vector(31 downto 0);
signal MDDR_Demo_sb_sb_MSS_TMP_0_FIC_0_APB_MASTER_PENABLE : std_logic;
signal MDDR_Demo_sb_sb_MSS_TMP_0_FIC_0_APB_MASTER_PRDATA  : std_logic_vector(31 downto 0);
signal MDDR_Demo_sb_sb_MSS_TMP_0_FIC_0_APB_MASTER_PREADY  : std_logic;
signal MDDR_Demo_sb_sb_MSS_TMP_0_FIC_0_APB_MASTER_PSELx   : std_logic;
signal MDDR_Demo_sb_sb_MSS_TMP_0_FIC_0_APB_MASTER_PSLVERR : std_logic;
signal MDDR_Demo_sb_sb_MSS_TMP_0_FIC_0_APB_MASTER_PWDATA  : std_logic_vector(31 downto 0);
signal MDDR_Demo_sb_sb_MSS_TMP_0_FIC_0_APB_MASTER_PWRITE  : std_logic;
signal MDDR_Demo_sb_sb_MSS_TMP_0_FIC_2_APB_M_PCLK         : std_logic;
signal MDDR_Demo_sb_sb_MSS_TMP_0_FIC_2_APB_M_PRESET_N     : std_logic;
signal MDDR_Demo_sb_sb_MSS_TMP_0_FIC_2_APB_MASTER_PENABLE : std_logic;
signal MDDR_Demo_sb_sb_MSS_TMP_0_FIC_2_APB_MASTER_PRDATA  : std_logic_vector(31 downto 0);
signal MDDR_Demo_sb_sb_MSS_TMP_0_FIC_2_APB_MASTER_PREADY  : std_logic;
signal MDDR_Demo_sb_sb_MSS_TMP_0_FIC_2_APB_MASTER_PSELx   : std_logic;
signal MDDR_Demo_sb_sb_MSS_TMP_0_FIC_2_APB_MASTER_PSLVERR : std_logic;
signal MDDR_Demo_sb_sb_MSS_TMP_0_FIC_2_APB_MASTER_PWDATA  : std_logic_vector(31 downto 0);
signal MDDR_Demo_sb_sb_MSS_TMP_0_FIC_2_APB_MASTER_PWRITE  : std_logic;
signal MDDR_Demo_sb_sb_MSS_TMP_0_MSS_RESET_N_M2F          : std_logic;
signal MDDR_DQS_TMATCH_0_OUT_net_0                        : std_logic;
signal MDDR_ODT_net_0                                     : std_logic;
signal MDDR_RAS_N_net_0                                   : std_logic;
signal MDDR_RESET_N_net_0                                 : std_logic;
signal MDDR_WE_N_net_0                                    : std_logic;
signal MMUART_0_TXD_M2F_net_0                             : std_logic;
signal MSS_DDR_FIC_SUBSYSTEM_CLK_net_0                    : std_logic;
signal MSS_DDR_FIC_SUBSYSTEM_LOCK_net_0                   : std_logic;
signal MSS_READY_net_0                                    : std_logic;
signal POWER_ON_RESET_N_net_0                             : std_logic;
signal MDDR_DQS_TMATCH_0_OUT_net_1                        : std_logic;
signal MDDR_CAS_N_net_1                                   : std_logic;
signal MDDR_CLK_net_1                                     : std_logic;
signal MDDR_CLK_N_net_1                                   : std_logic;
signal MDDR_CKE_net_1                                     : std_logic;
signal MDDR_CS_N_net_1                                    : std_logic;
signal MDDR_ODT_net_1                                     : std_logic;
signal MDDR_RAS_N_net_1                                   : std_logic;
signal MDDR_RESET_N_net_1                                 : std_logic;
signal MDDR_WE_N_net_1                                    : std_logic;
signal MDDR_ADDR_net_1                                    : std_logic_vector(15 downto 0);
signal MDDR_BA_net_1                                      : std_logic_vector(2 downto 0);
signal POWER_ON_RESET_N_net_1                             : std_logic;
signal INIT_DONE_net_1                                    : std_logic;
signal AMBA_MASTER_0_AWREADY_net_0                        : std_logic;
signal AMBA_MASTER_0_WREADY_net_0                         : std_logic;
signal AMBA_MASTER_0_BID_net_0                            : std_logic_vector(3 downto 0);
signal AMBA_MASTER_0_BRESP_net_0                          : std_logic_vector(1 downto 0);
signal AMBA_MASTER_0_BVALID_net_0                         : std_logic;
signal AMBA_MASTER_0_ARREADY_net_0                        : std_logic;
signal AMBA_MASTER_0_RID_net_0                            : std_logic_vector(3 downto 0);
signal AMBA_MASTER_0_RDATA_net_0                          : std_logic_vector(63 downto 0);
signal AMBA_MASTER_0_RRESP_net_0                          : std_logic_vector(1 downto 0);
signal AMBA_MASTER_0_RLAST_net_0                          : std_logic;
signal AMBA_MASTER_0_RVALID_net_0                         : std_logic;
signal MSS_DDR_FIC_SUBSYSTEM_CLK_net_1                    : std_logic;
signal MSS_DDR_FIC_SUBSYSTEM_LOCK_net_1                   : std_logic;
signal AMBA_SLAVE_0_PADDR_net_0                           : std_logic_vector(31 downto 0);
signal AMBA_SLAVE_0_PSELx_net_0                           : std_logic;
signal AMBA_SLAVE_0_PENABLE_net_0                         : std_logic;
signal AMBA_SLAVE_0_PWRITE_net_0                          : std_logic;
signal AMBA_SLAVE_0_PWDATA_net_0                          : std_logic_vector(31 downto 0);
signal FIC_0_CLK_net_1                                    : std_logic;
signal MSS_DDR_FIC_SUBSYSTEM_LOCK_net_2                   : std_logic;
signal DDR_READY_net_1                                    : std_logic;
signal MSS_READY_net_1                                    : std_logic;
signal MMUART_0_TXD_M2F_net_1                             : std_logic;
----------------------------------------------------------------------
-- TiedOff Signals
----------------------------------------------------------------------
signal GND_net                                            : std_logic;
signal PADDR_const_net_0                                  : std_logic_vector(7 downto 2);
signal PWDATA_const_net_0                                 : std_logic_vector(7 downto 0);
signal VCC_net                                            : std_logic;
signal IADDR_const_net_0                                  : std_logic_vector(31 downto 0);
signal FDDR_PRDATA_const_net_0                            : std_logic_vector(31 downto 0);
signal SDIF0_PRDATA_const_net_0                           : std_logic_vector(31 downto 0);
signal SDIF1_PRDATA_const_net_0                           : std_logic_vector(31 downto 0);
signal SDIF2_PRDATA_const_net_0                           : std_logic_vector(31 downto 0);
signal SDIF3_PRDATA_const_net_0                           : std_logic_vector(31 downto 0);
signal SDIF0_PRDATA_const_net_1                           : std_logic_vector(31 downto 0);
signal SDIF1_PRDATA_const_net_1                           : std_logic_vector(31 downto 0);
signal SDIF2_PRDATA_const_net_1                           : std_logic_vector(31 downto 0);
signal SDIF3_PRDATA_const_net_1                           : std_logic_vector(31 downto 0);
signal PRDATAS1_const_net_0                               : std_logic_vector(31 downto 0);
signal PRDATAS2_const_net_0                               : std_logic_vector(31 downto 0);
signal PRDATAS3_const_net_0                               : std_logic_vector(31 downto 0);
signal PRDATAS4_const_net_0                               : std_logic_vector(31 downto 0);
signal PRDATAS5_const_net_0                               : std_logic_vector(31 downto 0);
signal PRDATAS6_const_net_0                               : std_logic_vector(31 downto 0);
signal PRDATAS7_const_net_0                               : std_logic_vector(31 downto 0);
signal PRDATAS8_const_net_0                               : std_logic_vector(31 downto 0);
signal PRDATAS9_const_net_0                               : std_logic_vector(31 downto 0);
signal PRDATAS10_const_net_0                              : std_logic_vector(31 downto 0);
signal PRDATAS11_const_net_0                              : std_logic_vector(31 downto 0);
signal PRDATAS12_const_net_0                              : std_logic_vector(31 downto 0);
signal PRDATAS13_const_net_0                              : std_logic_vector(31 downto 0);
signal PRDATAS14_const_net_0                              : std_logic_vector(31 downto 0);
signal PRDATAS15_const_net_0                              : std_logic_vector(31 downto 0);
signal PRDATAS16_const_net_0                              : std_logic_vector(31 downto 0);
signal BID_S1_const_net_0                                 : std_logic_vector(5 downto 0);
signal BRESP_S1_const_net_0                               : std_logic_vector(1 downto 0);
signal RID_S1_const_net_0                                 : std_logic_vector(5 downto 0);
signal RDATA_S1_const_net_0                               : std_logic_vector(63 downto 0);
signal RRESP_S1_const_net_0                               : std_logic_vector(1 downto 0);
signal BID_S2_const_net_0                                 : std_logic_vector(5 downto 0);
signal BRESP_S2_const_net_0                               : std_logic_vector(1 downto 0);
signal RID_S2_const_net_0                                 : std_logic_vector(5 downto 0);
signal RDATA_S2_const_net_0                               : std_logic_vector(63 downto 0);
signal RRESP_S2_const_net_0                               : std_logic_vector(1 downto 0);
signal BID_S3_const_net_0                                 : std_logic_vector(5 downto 0);
signal BRESP_S3_const_net_0                               : std_logic_vector(1 downto 0);
signal RID_S3_const_net_0                                 : std_logic_vector(5 downto 0);
signal RDATA_S3_const_net_0                               : std_logic_vector(63 downto 0);
signal RRESP_S3_const_net_0                               : std_logic_vector(1 downto 0);
signal BID_S4_const_net_0                                 : std_logic_vector(5 downto 0);
signal BRESP_S4_const_net_0                               : std_logic_vector(1 downto 0);
signal RID_S4_const_net_0                                 : std_logic_vector(5 downto 0);
signal RDATA_S4_const_net_0                               : std_logic_vector(63 downto 0);
signal RRESP_S4_const_net_0                               : std_logic_vector(1 downto 0);
signal BID_S5_const_net_0                                 : std_logic_vector(5 downto 0);
signal BRESP_S5_const_net_0                               : std_logic_vector(1 downto 0);
signal RID_S5_const_net_0                                 : std_logic_vector(5 downto 0);
signal RDATA_S5_const_net_0                               : std_logic_vector(63 downto 0);
signal RRESP_S5_const_net_0                               : std_logic_vector(1 downto 0);
signal BID_S6_const_net_0                                 : std_logic_vector(5 downto 0);
signal BRESP_S6_const_net_0                               : std_logic_vector(1 downto 0);
signal RID_S6_const_net_0                                 : std_logic_vector(5 downto 0);
signal RDATA_S6_const_net_0                               : std_logic_vector(63 downto 0);
signal RRESP_S6_const_net_0                               : std_logic_vector(1 downto 0);
signal BID_S7_const_net_0                                 : std_logic_vector(5 downto 0);
signal BRESP_S7_const_net_0                               : std_logic_vector(1 downto 0);
signal RID_S7_const_net_0                                 : std_logic_vector(5 downto 0);
signal RDATA_S7_const_net_0                               : std_logic_vector(63 downto 0);
signal RRESP_S7_const_net_0                               : std_logic_vector(1 downto 0);
signal BID_S8_const_net_0                                 : std_logic_vector(5 downto 0);
signal BRESP_S8_const_net_0                               : std_logic_vector(1 downto 0);
signal RID_S8_const_net_0                                 : std_logic_vector(5 downto 0);
signal RDATA_S8_const_net_0                               : std_logic_vector(63 downto 0);
signal RRESP_S8_const_net_0                               : std_logic_vector(1 downto 0);
signal BID_S9_const_net_0                                 : std_logic_vector(5 downto 0);
signal BRESP_S9_const_net_0                               : std_logic_vector(1 downto 0);
signal RID_S9_const_net_0                                 : std_logic_vector(5 downto 0);
signal RDATA_S9_const_net_0                               : std_logic_vector(63 downto 0);
signal RRESP_S9_const_net_0                               : std_logic_vector(1 downto 0);
signal BID_S10_const_net_0                                : std_logic_vector(5 downto 0);
signal BRESP_S10_const_net_0                              : std_logic_vector(1 downto 0);
signal RID_S10_const_net_0                                : std_logic_vector(5 downto 0);
signal RDATA_S10_const_net_0                              : std_logic_vector(63 downto 0);
signal RRESP_S10_const_net_0                              : std_logic_vector(1 downto 0);
signal BID_S11_const_net_0                                : std_logic_vector(5 downto 0);
signal BRESP_S11_const_net_0                              : std_logic_vector(1 downto 0);
signal RID_S11_const_net_0                                : std_logic_vector(5 downto 0);
signal RDATA_S11_const_net_0                              : std_logic_vector(63 downto 0);
signal RRESP_S11_const_net_0                              : std_logic_vector(1 downto 0);
signal BID_S12_const_net_0                                : std_logic_vector(5 downto 0);
signal BRESP_S12_const_net_0                              : std_logic_vector(1 downto 0);
signal RID_S12_const_net_0                                : std_logic_vector(5 downto 0);
signal RDATA_S12_const_net_0                              : std_logic_vector(63 downto 0);
signal RRESP_S12_const_net_0                              : std_logic_vector(1 downto 0);
signal BID_S13_const_net_0                                : std_logic_vector(5 downto 0);
signal BRESP_S13_const_net_0                              : std_logic_vector(1 downto 0);
signal RID_S13_const_net_0                                : std_logic_vector(5 downto 0);
signal RDATA_S13_const_net_0                              : std_logic_vector(63 downto 0);
signal RRESP_S13_const_net_0                              : std_logic_vector(1 downto 0);
signal BID_S14_const_net_0                                : std_logic_vector(5 downto 0);
signal BRESP_S14_const_net_0                              : std_logic_vector(1 downto 0);
signal RID_S14_const_net_0                                : std_logic_vector(5 downto 0);
signal RDATA_S14_const_net_0                              : std_logic_vector(63 downto 0);
signal RRESP_S14_const_net_0                              : std_logic_vector(1 downto 0);
signal BID_S15_const_net_0                                : std_logic_vector(5 downto 0);
signal BRESP_S15_const_net_0                              : std_logic_vector(1 downto 0);
signal RID_S15_const_net_0                                : std_logic_vector(5 downto 0);
signal RDATA_S15_const_net_0                              : std_logic_vector(63 downto 0);
signal RRESP_S15_const_net_0                              : std_logic_vector(1 downto 0);
signal BID_S16_const_net_0                                : std_logic_vector(5 downto 0);
signal BRESP_S16_const_net_0                              : std_logic_vector(1 downto 0);
signal RID_S16_const_net_0                                : std_logic_vector(5 downto 0);
signal RDATA_S16_const_net_0                              : std_logic_vector(63 downto 0);
signal RRESP_S16_const_net_0                              : std_logic_vector(1 downto 0);
signal AWID_M1_const_net_0                                : std_logic_vector(3 downto 0);
signal AWADDR_M1_const_net_0                              : std_logic_vector(31 downto 0);
signal AWLEN_M1_const_net_0                               : std_logic_vector(3 downto 0);
signal AWSIZE_M1_const_net_0                              : std_logic_vector(2 downto 0);
signal AWBURST_M1_const_net_0                             : std_logic_vector(1 downto 0);
signal AWLOCK_M1_const_net_0                              : std_logic_vector(1 downto 0);
signal AWCACHE_M1_const_net_0                             : std_logic_vector(3 downto 0);
signal AWPROT_M1_const_net_0                              : std_logic_vector(2 downto 0);
signal WDATA_M1_const_net_0                               : std_logic_vector(63 downto 0);
signal WID_M1_const_net_0                                 : std_logic_vector(3 downto 0);
signal WSTRB_M1_const_net_0                               : std_logic_vector(7 downto 0);
signal ARID_M1_const_net_0                                : std_logic_vector(3 downto 0);
signal ARADDR_M1_const_net_0                              : std_logic_vector(31 downto 0);
signal ARLEN_M1_const_net_0                               : std_logic_vector(3 downto 0);
signal ARSIZE_M1_const_net_0                              : std_logic_vector(2 downto 0);
signal ARBURST_M1_const_net_0                             : std_logic_vector(1 downto 0);
signal ARLOCK_M1_const_net_0                              : std_logic_vector(1 downto 0);
signal ARCACHE_M1_const_net_0                             : std_logic_vector(3 downto 0);
signal ARPROT_M1_const_net_0                              : std_logic_vector(2 downto 0);
signal AWID_M2_const_net_0                                : std_logic_vector(3 downto 0);
signal AWADDR_M2_const_net_0                              : std_logic_vector(31 downto 0);
signal AWLEN_M2_const_net_0                               : std_logic_vector(3 downto 0);
signal AWSIZE_M2_const_net_0                              : std_logic_vector(2 downto 0);
signal AWBURST_M2_const_net_0                             : std_logic_vector(1 downto 0);
signal AWLOCK_M2_const_net_0                              : std_logic_vector(1 downto 0);
signal AWCACHE_M2_const_net_0                             : std_logic_vector(3 downto 0);
signal AWPROT_M2_const_net_0                              : std_logic_vector(2 downto 0);
signal WDATA_M2_const_net_0                               : std_logic_vector(63 downto 0);
signal WID_M2_const_net_0                                 : std_logic_vector(3 downto 0);
signal WSTRB_M2_const_net_0                               : std_logic_vector(7 downto 0);
signal ARID_M2_const_net_0                                : std_logic_vector(3 downto 0);
signal ARADDR_M2_const_net_0                              : std_logic_vector(31 downto 0);
signal ARLEN_M2_const_net_0                               : std_logic_vector(3 downto 0);
signal ARSIZE_M2_const_net_0                              : std_logic_vector(2 downto 0);
signal ARBURST_M2_const_net_0                             : std_logic_vector(1 downto 0);
signal ARLOCK_M2_const_net_0                              : std_logic_vector(1 downto 0);
signal ARCACHE_M2_const_net_0                             : std_logic_vector(3 downto 0);
signal ARPROT_M2_const_net_0                              : std_logic_vector(2 downto 0);
signal AWID_M3_const_net_0                                : std_logic_vector(3 downto 0);
signal AWADDR_M3_const_net_0                              : std_logic_vector(31 downto 0);
signal AWLEN_M3_const_net_0                               : std_logic_vector(3 downto 0);
signal AWSIZE_M3_const_net_0                              : std_logic_vector(2 downto 0);
signal AWBURST_M3_const_net_0                             : std_logic_vector(1 downto 0);
signal AWLOCK_M3_const_net_0                              : std_logic_vector(1 downto 0);
signal AWCACHE_M3_const_net_0                             : std_logic_vector(3 downto 0);
signal AWPROT_M3_const_net_0                              : std_logic_vector(2 downto 0);
signal WDATA_M3_const_net_0                               : std_logic_vector(63 downto 0);
signal WID_M3_const_net_0                                 : std_logic_vector(3 downto 0);
signal WSTRB_M3_const_net_0                               : std_logic_vector(7 downto 0);
signal ARID_M3_const_net_0                                : std_logic_vector(3 downto 0);
signal ARADDR_M3_const_net_0                              : std_logic_vector(31 downto 0);
signal ARLEN_M3_const_net_0                               : std_logic_vector(3 downto 0);
signal ARSIZE_M3_const_net_0                              : std_logic_vector(2 downto 0);
signal ARBURST_M3_const_net_0                             : std_logic_vector(1 downto 0);
signal ARLOCK_M3_const_net_0                              : std_logic_vector(1 downto 0);
signal ARCACHE_M3_const_net_0                             : std_logic_vector(3 downto 0);
signal ARPROT_M3_const_net_0                              : std_logic_vector(2 downto 0);
----------------------------------------------------------------------
-- Bus Interface Nets Declarations - Unequal Pin Widths
----------------------------------------------------------------------
signal COREAXI_0_AXImslave0_ARID                          : std_logic_vector(5 downto 0);
signal COREAXI_0_AXImslave0_ARID_0                        : std_logic_vector(3 downto 0);
signal COREAXI_0_AXImslave0_ARID_0_3to0                   : std_logic_vector(3 downto 0);

signal COREAXI_0_AXImslave0_ARSIZE                        : std_logic_vector(2 downto 0);
signal COREAXI_0_AXImslave0_ARSIZE_0                      : std_logic_vector(1 downto 0);
signal COREAXI_0_AXImslave0_ARSIZE_0_1to0                 : std_logic_vector(1 downto 0);

signal COREAXI_0_AXImslave0_AWID                          : std_logic_vector(5 downto 0);
signal COREAXI_0_AXImslave0_AWID_0                        : std_logic_vector(3 downto 0);
signal COREAXI_0_AXImslave0_AWID_0_3to0                   : std_logic_vector(3 downto 0);

signal COREAXI_0_AXImslave0_AWSIZE                        : std_logic_vector(2 downto 0);
signal COREAXI_0_AXImslave0_AWSIZE_0                      : std_logic_vector(1 downto 0);
signal COREAXI_0_AXImslave0_AWSIZE_0_1to0                 : std_logic_vector(1 downto 0);

signal COREAXI_0_AXImslave0_BID                           : std_logic_vector(3 downto 0);
signal COREAXI_0_AXImslave0_BID_0                         : std_logic_vector(5 downto 0);
signal COREAXI_0_AXImslave0_BID_0_3to0                    : std_logic_vector(3 downto 0);
signal COREAXI_0_AXImslave0_BID_0_5to4                    : std_logic_vector(5 downto 4);

signal COREAXI_0_AXImslave0_RID                           : std_logic_vector(3 downto 0);
signal COREAXI_0_AXImslave0_RID_0                         : std_logic_vector(5 downto 0);
signal COREAXI_0_AXImslave0_RID_0_3to0                    : std_logic_vector(3 downto 0);
signal COREAXI_0_AXImslave0_RID_0_5to4                    : std_logic_vector(5 downto 4);

signal COREAXI_0_AXImslave0_WID                           : std_logic_vector(5 downto 0);
signal COREAXI_0_AXImslave0_WID_0                         : std_logic_vector(3 downto 0);
signal COREAXI_0_AXImslave0_WID_0_3to0                    : std_logic_vector(3 downto 0);

signal CORECONFIGP_0_MDDR_APBmslave_PADDR                 : std_logic_vector(15 downto 2);
signal CORECONFIGP_0_MDDR_APBmslave_PADDR_0               : std_logic_vector(10 downto 2);
signal CORECONFIGP_0_MDDR_APBmslave_PADDR_0_10to2         : std_logic_vector(10 downto 2);

signal CORECONFIGP_0_MDDR_APBmslave_PRDATA                : std_logic_vector(15 downto 0);
signal CORECONFIGP_0_MDDR_APBmslave_PRDATA_0              : std_logic_vector(31 downto 0);
signal CORECONFIGP_0_MDDR_APBmslave_PRDATA_0_15to0        : std_logic_vector(15 downto 0);
signal CORECONFIGP_0_MDDR_APBmslave_PRDATA_0_31to16       : std_logic_vector(31 downto 16);

signal CORECONFIGP_0_MDDR_APBmslave_PWDATA                : std_logic_vector(31 downto 0);
signal CORECONFIGP_0_MDDR_APBmslave_PWDATA_0              : std_logic_vector(15 downto 0);
signal CORECONFIGP_0_MDDR_APBmslave_PWDATA_0_15to0        : std_logic_vector(15 downto 0);

signal MDDR_Demo_sb_sb_MSS_TMP_0_FIC_2_APB_MASTER_PADDR   : std_logic_vector(15 downto 2);
signal MDDR_Demo_sb_sb_MSS_TMP_0_FIC_2_APB_MASTER_PADDR_0 : std_logic_vector(16 downto 2);
signal MDDR_Demo_sb_sb_MSS_TMP_0_FIC_2_APB_MASTER_PADDR_0_15to2: std_logic_vector(15 downto 2);
signal MDDR_Demo_sb_sb_MSS_TMP_0_FIC_2_APB_MASTER_PADDR_0_16to16: std_logic_vector(16 to 16);


begin
----------------------------------------------------------------------
-- Constant assignments
----------------------------------------------------------------------
 GND_net                  <= '0';
 PADDR_const_net_0        <= B"000000";
 PWDATA_const_net_0       <= B"00000000";
 VCC_net                  <= '1';
 IADDR_const_net_0        <= B"00000000000000000000000000000000";
 FDDR_PRDATA_const_net_0  <= B"00000000000000000000000000000000";
 SDIF0_PRDATA_const_net_0 <= B"00000000000000000000000000000000";
 SDIF1_PRDATA_const_net_0 <= B"00000000000000000000000000000000";
 SDIF2_PRDATA_const_net_0 <= B"00000000000000000000000000000000";
 SDIF3_PRDATA_const_net_0 <= B"00000000000000000000000000000000";
 SDIF0_PRDATA_const_net_1 <= B"00000000000000000000000000000000";
 SDIF1_PRDATA_const_net_1 <= B"00000000000000000000000000000000";
 SDIF2_PRDATA_const_net_1 <= B"00000000000000000000000000000000";
 SDIF3_PRDATA_const_net_1 <= B"00000000000000000000000000000000";
 PRDATAS1_const_net_0     <= B"00000000000000000000000000000000";
 PRDATAS2_const_net_0     <= B"00000000000000000000000000000000";
 PRDATAS3_const_net_0     <= B"00000000000000000000000000000000";
 PRDATAS4_const_net_0     <= B"00000000000000000000000000000000";
 PRDATAS5_const_net_0     <= B"00000000000000000000000000000000";
 PRDATAS6_const_net_0     <= B"00000000000000000000000000000000";
 PRDATAS7_const_net_0     <= B"00000000000000000000000000000000";
 PRDATAS8_const_net_0     <= B"00000000000000000000000000000000";
 PRDATAS9_const_net_0     <= B"00000000000000000000000000000000";
 PRDATAS10_const_net_0    <= B"00000000000000000000000000000000";
 PRDATAS11_const_net_0    <= B"00000000000000000000000000000000";
 PRDATAS12_const_net_0    <= B"00000000000000000000000000000000";
 PRDATAS13_const_net_0    <= B"00000000000000000000000000000000";
 PRDATAS14_const_net_0    <= B"00000000000000000000000000000000";
 PRDATAS15_const_net_0    <= B"00000000000000000000000000000000";
 PRDATAS16_const_net_0    <= B"00000000000000000000000000000000";
 BID_S1_const_net_0       <= B"000000";
 BRESP_S1_const_net_0     <= B"00";
 RID_S1_const_net_0       <= B"000000";
 RDATA_S1_const_net_0     <= B"0000000000000000000000000000000000000000000000000000000000000000";
 RRESP_S1_const_net_0     <= B"00";
 BID_S2_const_net_0       <= B"000000";
 BRESP_S2_const_net_0     <= B"00";
 RID_S2_const_net_0       <= B"000000";
 RDATA_S2_const_net_0     <= B"0000000000000000000000000000000000000000000000000000000000000000";
 RRESP_S2_const_net_0     <= B"00";
 BID_S3_const_net_0       <= B"000000";
 BRESP_S3_const_net_0     <= B"00";
 RID_S3_const_net_0       <= B"000000";
 RDATA_S3_const_net_0     <= B"0000000000000000000000000000000000000000000000000000000000000000";
 RRESP_S3_const_net_0     <= B"00";
 BID_S4_const_net_0       <= B"000000";
 BRESP_S4_const_net_0     <= B"00";
 RID_S4_const_net_0       <= B"000000";
 RDATA_S4_const_net_0     <= B"0000000000000000000000000000000000000000000000000000000000000000";
 RRESP_S4_const_net_0     <= B"00";
 BID_S5_const_net_0       <= B"000000";
 BRESP_S5_const_net_0     <= B"00";
 RID_S5_const_net_0       <= B"000000";
 RDATA_S5_const_net_0     <= B"0000000000000000000000000000000000000000000000000000000000000000";
 RRESP_S5_const_net_0     <= B"00";
 BID_S6_const_net_0       <= B"000000";
 BRESP_S6_const_net_0     <= B"00";
 RID_S6_const_net_0       <= B"000000";
 RDATA_S6_const_net_0     <= B"0000000000000000000000000000000000000000000000000000000000000000";
 RRESP_S6_const_net_0     <= B"00";
 BID_S7_const_net_0       <= B"000000";
 BRESP_S7_const_net_0     <= B"00";
 RID_S7_const_net_0       <= B"000000";
 RDATA_S7_const_net_0     <= B"0000000000000000000000000000000000000000000000000000000000000000";
 RRESP_S7_const_net_0     <= B"00";
 BID_S8_const_net_0       <= B"000000";
 BRESP_S8_const_net_0     <= B"00";
 RID_S8_const_net_0       <= B"000000";
 RDATA_S8_const_net_0     <= B"0000000000000000000000000000000000000000000000000000000000000000";
 RRESP_S8_const_net_0     <= B"00";
 BID_S9_const_net_0       <= B"000000";
 BRESP_S9_const_net_0     <= B"00";
 RID_S9_const_net_0       <= B"000000";
 RDATA_S9_const_net_0     <= B"0000000000000000000000000000000000000000000000000000000000000000";
 RRESP_S9_const_net_0     <= B"00";
 BID_S10_const_net_0      <= B"000000";
 BRESP_S10_const_net_0    <= B"00";
 RID_S10_const_net_0      <= B"000000";
 RDATA_S10_const_net_0    <= B"0000000000000000000000000000000000000000000000000000000000000000";
 RRESP_S10_const_net_0    <= B"00";
 BID_S11_const_net_0      <= B"000000";
 BRESP_S11_const_net_0    <= B"00";
 RID_S11_const_net_0      <= B"000000";
 RDATA_S11_const_net_0    <= B"0000000000000000000000000000000000000000000000000000000000000000";
 RRESP_S11_const_net_0    <= B"00";
 BID_S12_const_net_0      <= B"000000";
 BRESP_S12_const_net_0    <= B"00";
 RID_S12_const_net_0      <= B"000000";
 RDATA_S12_const_net_0    <= B"0000000000000000000000000000000000000000000000000000000000000000";
 RRESP_S12_const_net_0    <= B"00";
 BID_S13_const_net_0      <= B"000000";
 BRESP_S13_const_net_0    <= B"00";
 RID_S13_const_net_0      <= B"000000";
 RDATA_S13_const_net_0    <= B"0000000000000000000000000000000000000000000000000000000000000000";
 RRESP_S13_const_net_0    <= B"00";
 BID_S14_const_net_0      <= B"000000";
 BRESP_S14_const_net_0    <= B"00";
 RID_S14_const_net_0      <= B"000000";
 RDATA_S14_const_net_0    <= B"0000000000000000000000000000000000000000000000000000000000000000";
 RRESP_S14_const_net_0    <= B"00";
 BID_S15_const_net_0      <= B"000000";
 BRESP_S15_const_net_0    <= B"00";
 RID_S15_const_net_0      <= B"000000";
 RDATA_S15_const_net_0    <= B"0000000000000000000000000000000000000000000000000000000000000000";
 RRESP_S15_const_net_0    <= B"00";
 BID_S16_const_net_0      <= B"000000";
 BRESP_S16_const_net_0    <= B"00";
 RID_S16_const_net_0      <= B"000000";
 RDATA_S16_const_net_0    <= B"0000000000000000000000000000000000000000000000000000000000000000";
 RRESP_S16_const_net_0    <= B"00";
 AWID_M1_const_net_0      <= B"0000";
 AWADDR_M1_const_net_0    <= B"00000000000000000000000000000000";
 AWLEN_M1_const_net_0     <= B"0000";
 AWSIZE_M1_const_net_0    <= B"000";
 AWBURST_M1_const_net_0   <= B"00";
 AWLOCK_M1_const_net_0    <= B"00";
 AWCACHE_M1_const_net_0   <= B"0000";
 AWPROT_M1_const_net_0    <= B"000";
 WDATA_M1_const_net_0     <= B"0000000000000000000000000000000000000000000000000000000000000000";
 WID_M1_const_net_0       <= B"0000";
 WSTRB_M1_const_net_0     <= B"00000000";
 ARID_M1_const_net_0      <= B"0000";
 ARADDR_M1_const_net_0    <= B"00000000000000000000000000000000";
 ARLEN_M1_const_net_0     <= B"0000";
 ARSIZE_M1_const_net_0    <= B"000";
 ARBURST_M1_const_net_0   <= B"00";
 ARLOCK_M1_const_net_0    <= B"00";
 ARCACHE_M1_const_net_0   <= B"0000";
 ARPROT_M1_const_net_0    <= B"000";
 AWID_M2_const_net_0      <= B"0000";
 AWADDR_M2_const_net_0    <= B"00000000000000000000000000000000";
 AWLEN_M2_const_net_0     <= B"0000";
 AWSIZE_M2_const_net_0    <= B"000";
 AWBURST_M2_const_net_0   <= B"00";
 AWLOCK_M2_const_net_0    <= B"00";
 AWCACHE_M2_const_net_0   <= B"0000";
 AWPROT_M2_const_net_0    <= B"000";
 WDATA_M2_const_net_0     <= B"0000000000000000000000000000000000000000000000000000000000000000";
 WID_M2_const_net_0       <= B"0000";
 WSTRB_M2_const_net_0     <= B"00000000";
 ARID_M2_const_net_0      <= B"0000";
 ARADDR_M2_const_net_0    <= B"00000000000000000000000000000000";
 ARLEN_M2_const_net_0     <= B"0000";
 ARSIZE_M2_const_net_0    <= B"000";
 ARBURST_M2_const_net_0   <= B"00";
 ARLOCK_M2_const_net_0    <= B"00";
 ARCACHE_M2_const_net_0   <= B"0000";
 ARPROT_M2_const_net_0    <= B"000";
 AWID_M3_const_net_0      <= B"0000";
 AWADDR_M3_const_net_0    <= B"00000000000000000000000000000000";
 AWLEN_M3_const_net_0     <= B"0000";
 AWSIZE_M3_const_net_0    <= B"000";
 AWBURST_M3_const_net_0   <= B"00";
 AWLOCK_M3_const_net_0    <= B"00";
 AWCACHE_M3_const_net_0   <= B"0000";
 AWPROT_M3_const_net_0    <= B"000";
 WDATA_M3_const_net_0     <= B"0000000000000000000000000000000000000000000000000000000000000000";
 WID_M3_const_net_0       <= B"0000";
 WSTRB_M3_const_net_0     <= B"00000000";
 ARID_M3_const_net_0      <= B"0000";
 ARADDR_M3_const_net_0    <= B"00000000000000000000000000000000";
 ARLEN_M3_const_net_0     <= B"0000";
 ARSIZE_M3_const_net_0    <= B"000";
 ARBURST_M3_const_net_0   <= B"00";
 ARLOCK_M3_const_net_0    <= B"00";
 ARCACHE_M3_const_net_0   <= B"0000";
 ARPROT_M3_const_net_0    <= B"000";
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 MDDR_DQS_TMATCH_0_OUT_net_1         <= MDDR_DQS_TMATCH_0_OUT_net_0;
 MDDR_DQS_TMATCH_0_OUT               <= MDDR_DQS_TMATCH_0_OUT_net_1;
 MDDR_CAS_N_net_1                    <= MDDR_CAS_N_net_0;
 MDDR_CAS_N                          <= MDDR_CAS_N_net_1;
 MDDR_CLK_net_1                      <= MDDR_CLK_net_0;
 MDDR_CLK                            <= MDDR_CLK_net_1;
 MDDR_CLK_N_net_1                    <= MDDR_CLK_N_net_0;
 MDDR_CLK_N                          <= MDDR_CLK_N_net_1;
 MDDR_CKE_net_1                      <= MDDR_CKE_net_0;
 MDDR_CKE                            <= MDDR_CKE_net_1;
 MDDR_CS_N_net_1                     <= MDDR_CS_N_net_0;
 MDDR_CS_N                           <= MDDR_CS_N_net_1;
 MDDR_ODT_net_1                      <= MDDR_ODT_net_0;
 MDDR_ODT                            <= MDDR_ODT_net_1;
 MDDR_RAS_N_net_1                    <= MDDR_RAS_N_net_0;
 MDDR_RAS_N                          <= MDDR_RAS_N_net_1;
 MDDR_RESET_N_net_1                  <= MDDR_RESET_N_net_0;
 MDDR_RESET_N                        <= MDDR_RESET_N_net_1;
 MDDR_WE_N_net_1                     <= MDDR_WE_N_net_0;
 MDDR_WE_N                           <= MDDR_WE_N_net_1;
 MDDR_ADDR_net_1                     <= MDDR_ADDR_net_0;
 MDDR_ADDR(15 downto 0)              <= MDDR_ADDR_net_1;
 MDDR_BA_net_1                       <= MDDR_BA_net_0;
 MDDR_BA(2 downto 0)                 <= MDDR_BA_net_1;
 POWER_ON_RESET_N_net_1              <= POWER_ON_RESET_N_net_0;
 POWER_ON_RESET_N                    <= POWER_ON_RESET_N_net_1;
 INIT_DONE_net_1                     <= INIT_DONE_net_0;
 INIT_DONE                           <= INIT_DONE_net_1;
 AMBA_MASTER_0_AWREADY_net_0         <= AMBA_MASTER_0_AWREADY;
 AMBA_MASTER_0_AWREADY_M0            <= AMBA_MASTER_0_AWREADY_net_0;
 AMBA_MASTER_0_WREADY_net_0          <= AMBA_MASTER_0_WREADY;
 AMBA_MASTER_0_WREADY_M0             <= AMBA_MASTER_0_WREADY_net_0;
 AMBA_MASTER_0_BID_net_0             <= AMBA_MASTER_0_BID;
 AMBA_MASTER_0_BID_M0(3 downto 0)    <= AMBA_MASTER_0_BID_net_0;
 AMBA_MASTER_0_BRESP_net_0           <= AMBA_MASTER_0_BRESP;
 AMBA_MASTER_0_BRESP_M0(1 downto 0)  <= AMBA_MASTER_0_BRESP_net_0;
 AMBA_MASTER_0_BVALID_net_0          <= AMBA_MASTER_0_BVALID;
 AMBA_MASTER_0_BVALID_M0             <= AMBA_MASTER_0_BVALID_net_0;
 AMBA_MASTER_0_ARREADY_net_0         <= AMBA_MASTER_0_ARREADY;
 AMBA_MASTER_0_ARREADY_M0            <= AMBA_MASTER_0_ARREADY_net_0;
 AMBA_MASTER_0_RID_net_0             <= AMBA_MASTER_0_RID;
 AMBA_MASTER_0_RID_M0(3 downto 0)    <= AMBA_MASTER_0_RID_net_0;
 AMBA_MASTER_0_RDATA_net_0           <= AMBA_MASTER_0_RDATA;
 AMBA_MASTER_0_RDATA_M0(63 downto 0) <= AMBA_MASTER_0_RDATA_net_0;
 AMBA_MASTER_0_RRESP_net_0           <= AMBA_MASTER_0_RRESP;
 AMBA_MASTER_0_RRESP_M0(1 downto 0)  <= AMBA_MASTER_0_RRESP_net_0;
 AMBA_MASTER_0_RLAST_net_0           <= AMBA_MASTER_0_RLAST;
 AMBA_MASTER_0_RLAST_M0              <= AMBA_MASTER_0_RLAST_net_0;
 AMBA_MASTER_0_RVALID_net_0          <= AMBA_MASTER_0_RVALID;
 AMBA_MASTER_0_RVALID_M0             <= AMBA_MASTER_0_RVALID_net_0;
 MSS_DDR_FIC_SUBSYSTEM_CLK_net_1     <= MSS_DDR_FIC_SUBSYSTEM_CLK_net_0;
 MSS_DDR_FIC_SUBSYSTEM_CLK           <= MSS_DDR_FIC_SUBSYSTEM_CLK_net_1;
 MSS_DDR_FIC_SUBSYSTEM_LOCK_net_1    <= MSS_DDR_FIC_SUBSYSTEM_LOCK_net_0;
 MSS_DDR_FIC_SUBSYSTEM_LOCK          <= MSS_DDR_FIC_SUBSYSTEM_LOCK_net_1;
 AMBA_SLAVE_0_PADDR_net_0            <= AMBA_SLAVE_0_PADDR;
 AMBA_SLAVE_0_PADDRS(31 downto 0)    <= AMBA_SLAVE_0_PADDR_net_0;
 AMBA_SLAVE_0_PSELx_net_0            <= AMBA_SLAVE_0_PSELx;
 AMBA_SLAVE_0_PSELS0                 <= AMBA_SLAVE_0_PSELx_net_0;
 AMBA_SLAVE_0_PENABLE_net_0          <= AMBA_SLAVE_0_PENABLE;
 AMBA_SLAVE_0_PENABLES               <= AMBA_SLAVE_0_PENABLE_net_0;
 AMBA_SLAVE_0_PWRITE_net_0           <= AMBA_SLAVE_0_PWRITE;
 AMBA_SLAVE_0_PWRITES                <= AMBA_SLAVE_0_PWRITE_net_0;
 AMBA_SLAVE_0_PWDATA_net_0           <= AMBA_SLAVE_0_PWDATA;
 AMBA_SLAVE_0_PWDATAS(31 downto 0)   <= AMBA_SLAVE_0_PWDATA_net_0;
 FIC_0_CLK_net_1                     <= FIC_0_CLK_net_0;
 FIC_0_CLK                           <= FIC_0_CLK_net_1;
 MSS_DDR_FIC_SUBSYSTEM_LOCK_net_2    <= MSS_DDR_FIC_SUBSYSTEM_LOCK_net_0;
 FIC_0_LOCK                          <= MSS_DDR_FIC_SUBSYSTEM_LOCK_net_2;
 DDR_READY_net_1                     <= DDR_READY_net_0;
 DDR_READY                           <= DDR_READY_net_1;
 MSS_READY_net_1                     <= MSS_READY_net_0;
 MSS_READY                           <= MSS_READY_net_1;
 MMUART_0_TXD_M2F_net_1              <= MMUART_0_TXD_M2F_net_0;
 MMUART_0_TXD_M2F                    <= MMUART_0_TXD_M2F_net_1;
----------------------------------------------------------------------
-- Bus Interface Nets Assignments - Unequal Pin Widths
----------------------------------------------------------------------
 COREAXI_0_AXImslave0_ARID_0(3 downto 0) <= ( COREAXI_0_AXImslave0_ARID_0_3to0(3 downto 0) );
 COREAXI_0_AXImslave0_ARID_0_3to0(3 downto 0) <= COREAXI_0_AXImslave0_ARID(3 downto 0);

 COREAXI_0_AXImslave0_ARSIZE_0(1 downto 0) <= ( COREAXI_0_AXImslave0_ARSIZE_0_1to0(1 downto 0) );
 COREAXI_0_AXImslave0_ARSIZE_0_1to0(1 downto 0) <= COREAXI_0_AXImslave0_ARSIZE(1 downto 0);

 COREAXI_0_AXImslave0_AWID_0(3 downto 0) <= ( COREAXI_0_AXImslave0_AWID_0_3to0(3 downto 0) );
 COREAXI_0_AXImslave0_AWID_0_3to0(3 downto 0) <= COREAXI_0_AXImslave0_AWID(3 downto 0);

 COREAXI_0_AXImslave0_AWSIZE_0(1 downto 0) <= ( COREAXI_0_AXImslave0_AWSIZE_0_1to0(1 downto 0) );
 COREAXI_0_AXImslave0_AWSIZE_0_1to0(1 downto 0) <= COREAXI_0_AXImslave0_AWSIZE(1 downto 0);

 COREAXI_0_AXImslave0_BID_0(5 downto 0) <= ( COREAXI_0_AXImslave0_BID_0_5to4(5 downto 4) & COREAXI_0_AXImslave0_BID_0_3to0(3 downto 0) );
 COREAXI_0_AXImslave0_BID_0_3to0(3 downto 0) <= COREAXI_0_AXImslave0_BID(3 downto 0);
 COREAXI_0_AXImslave0_BID_0_5to4(5 downto 4) <= B"00";

 COREAXI_0_AXImslave0_RID_0(5 downto 0) <= ( COREAXI_0_AXImslave0_RID_0_5to4(5 downto 4) & COREAXI_0_AXImslave0_RID_0_3to0(3 downto 0) );
 COREAXI_0_AXImslave0_RID_0_3to0(3 downto 0) <= COREAXI_0_AXImslave0_RID(3 downto 0);
 COREAXI_0_AXImslave0_RID_0_5to4(5 downto 4) <= B"00";

 COREAXI_0_AXImslave0_WID_0(3 downto 0) <= ( COREAXI_0_AXImslave0_WID_0_3to0(3 downto 0) );
 COREAXI_0_AXImslave0_WID_0_3to0(3 downto 0) <= COREAXI_0_AXImslave0_WID(3 downto 0);

 CORECONFIGP_0_MDDR_APBmslave_PADDR_0(10 downto 2) <= ( CORECONFIGP_0_MDDR_APBmslave_PADDR_0_10to2(10 downto 2) );
 CORECONFIGP_0_MDDR_APBmslave_PADDR_0_10to2(10 downto 2) <= CORECONFIGP_0_MDDR_APBmslave_PADDR(10 downto 2);

 CORECONFIGP_0_MDDR_APBmslave_PRDATA_0(31 downto 0) <= ( CORECONFIGP_0_MDDR_APBmslave_PRDATA_0_31to16(31 downto 16) & CORECONFIGP_0_MDDR_APBmslave_PRDATA_0_15to0(15 downto 0) );
 CORECONFIGP_0_MDDR_APBmslave_PRDATA_0_15to0(15 downto 0) <= CORECONFIGP_0_MDDR_APBmslave_PRDATA(15 downto 0);
 CORECONFIGP_0_MDDR_APBmslave_PRDATA_0_31to16(31 downto 16) <= B"0000000000000000";

 CORECONFIGP_0_MDDR_APBmslave_PWDATA_0(15 downto 0) <= ( CORECONFIGP_0_MDDR_APBmslave_PWDATA_0_15to0(15 downto 0) );
 CORECONFIGP_0_MDDR_APBmslave_PWDATA_0_15to0(15 downto 0) <= CORECONFIGP_0_MDDR_APBmslave_PWDATA(15 downto 0);

 MDDR_Demo_sb_sb_MSS_TMP_0_FIC_2_APB_MASTER_PADDR_0(16 downto 2) <= ( MDDR_Demo_sb_sb_MSS_TMP_0_FIC_2_APB_MASTER_PADDR_0_16to16(16) & MDDR_Demo_sb_sb_MSS_TMP_0_FIC_2_APB_MASTER_PADDR_0_15to2(15 downto 2) );
 MDDR_Demo_sb_sb_MSS_TMP_0_FIC_2_APB_MASTER_PADDR_0_15to2(15 downto 2) <= MDDR_Demo_sb_sb_MSS_TMP_0_FIC_2_APB_MASTER_PADDR(15 downto 2);
 MDDR_Demo_sb_sb_MSS_TMP_0_FIC_2_APB_MASTER_PADDR_0_16to16(16) <= '0';

----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- CCC_0   -   Actel:SgCore:FCCC:2.0.201
CCC_0 : MDDR_Demo_sb_sb_CCC_0_FCCC
    port map( 
        -- Inputs
        RCOSC_25_50MHZ => FABOSC_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC,
        -- Outputs
        GL0            => FIC_0_CLK_net_0,
        GL2            => MSS_DDR_FIC_SUBSYSTEM_CLK_net_0,
        LOCK           => MSS_DDR_FIC_SUBSYSTEM_LOCK_net_0 
        );
-- CoreAPB3_0   -   Actel:DirectCore:CoreAPB3:4.1.100
CoreAPB3_0 : entity COREAPB3_LIB.CoreAPB3
    generic map( 
        APB_DWIDTH      => ( 32 ),
        APBSLOT0ENABLE  => ( 1 ),
        APBSLOT1ENABLE  => ( 0 ),
        APBSLOT2ENABLE  => ( 0 ),
        APBSLOT3ENABLE  => ( 0 ),
        APBSLOT4ENABLE  => ( 0 ),
        APBSLOT5ENABLE  => ( 0 ),
        APBSLOT6ENABLE  => ( 0 ),
        APBSLOT7ENABLE  => ( 0 ),
        APBSLOT8ENABLE  => ( 0 ),
        APBSLOT9ENABLE  => ( 0 ),
        APBSLOT10ENABLE => ( 0 ),
        APBSLOT11ENABLE => ( 0 ),
        APBSLOT12ENABLE => ( 0 ),
        APBSLOT13ENABLE => ( 0 ),
        APBSLOT14ENABLE => ( 0 ),
        APBSLOT15ENABLE => ( 0 ),
        FAMILY          => ( 19 ),
        IADDR_OPTION    => ( 0 ),
        MADDR_BITS      => ( 16 ),
        SC_0            => ( 0 ),
        SC_1            => ( 0 ),
        SC_2            => ( 0 ),
        SC_3            => ( 0 ),
        SC_4            => ( 0 ),
        SC_5            => ( 0 ),
        SC_6            => ( 0 ),
        SC_7            => ( 0 ),
        SC_8            => ( 0 ),
        SC_9            => ( 0 ),
        SC_10           => ( 0 ),
        SC_11           => ( 0 ),
        SC_12           => ( 0 ),
        SC_13           => ( 0 ),
        SC_14           => ( 0 ),
        SC_15           => ( 0 ),
        UPR_NIBBLE_POSN => ( 3 )
        )
    port map( 
        -- Inputs
        PRESETN    => GND_net, -- tied to '0' from definition
        PCLK       => GND_net, -- tied to '0' from definition
        PADDR      => MDDR_Demo_sb_sb_MSS_TMP_0_FIC_0_APB_MASTER_PADDR,
        PWRITE     => MDDR_Demo_sb_sb_MSS_TMP_0_FIC_0_APB_MASTER_PWRITE,
        PENABLE    => MDDR_Demo_sb_sb_MSS_TMP_0_FIC_0_APB_MASTER_PENABLE,
        PWDATA     => MDDR_Demo_sb_sb_MSS_TMP_0_FIC_0_APB_MASTER_PWDATA,
        PSEL       => MDDR_Demo_sb_sb_MSS_TMP_0_FIC_0_APB_MASTER_PSELx,
        PRDATAS0   => AMBA_SLAVE_0_PRDATAS0,
        PREADYS0   => AMBA_SLAVE_0_PREADYS0,
        PSLVERRS0  => AMBA_SLAVE_0_PSLVERRS0,
        PRDATAS1   => PRDATAS1_const_net_0, -- tied to X"0" from definition
        PREADYS1   => VCC_net, -- tied to '1' from definition
        PSLVERRS1  => GND_net, -- tied to '0' from definition
        PRDATAS2   => PRDATAS2_const_net_0, -- tied to X"0" from definition
        PREADYS2   => VCC_net, -- tied to '1' from definition
        PSLVERRS2  => GND_net, -- tied to '0' from definition
        PRDATAS3   => PRDATAS3_const_net_0, -- tied to X"0" from definition
        PREADYS3   => VCC_net, -- tied to '1' from definition
        PSLVERRS3  => GND_net, -- tied to '0' from definition
        PRDATAS4   => PRDATAS4_const_net_0, -- tied to X"0" from definition
        PREADYS4   => VCC_net, -- tied to '1' from definition
        PSLVERRS4  => GND_net, -- tied to '0' from definition
        PRDATAS5   => PRDATAS5_const_net_0, -- tied to X"0" from definition
        PREADYS5   => VCC_net, -- tied to '1' from definition
        PSLVERRS5  => GND_net, -- tied to '0' from definition
        PRDATAS6   => PRDATAS6_const_net_0, -- tied to X"0" from definition
        PREADYS6   => VCC_net, -- tied to '1' from definition
        PSLVERRS6  => GND_net, -- tied to '0' from definition
        PRDATAS7   => PRDATAS7_const_net_0, -- tied to X"0" from definition
        PREADYS7   => VCC_net, -- tied to '1' from definition
        PSLVERRS7  => GND_net, -- tied to '0' from definition
        PRDATAS8   => PRDATAS8_const_net_0, -- tied to X"0" from definition
        PREADYS8   => VCC_net, -- tied to '1' from definition
        PSLVERRS8  => GND_net, -- tied to '0' from definition
        PRDATAS9   => PRDATAS9_const_net_0, -- tied to X"0" from definition
        PREADYS9   => VCC_net, -- tied to '1' from definition
        PSLVERRS9  => GND_net, -- tied to '0' from definition
        PRDATAS10  => PRDATAS10_const_net_0, -- tied to X"0" from definition
        PREADYS10  => VCC_net, -- tied to '1' from definition
        PSLVERRS10 => GND_net, -- tied to '0' from definition
        PRDATAS11  => PRDATAS11_const_net_0, -- tied to X"0" from definition
        PREADYS11  => VCC_net, -- tied to '1' from definition
        PSLVERRS11 => GND_net, -- tied to '0' from definition
        PRDATAS12  => PRDATAS12_const_net_0, -- tied to X"0" from definition
        PREADYS12  => VCC_net, -- tied to '1' from definition
        PSLVERRS12 => GND_net, -- tied to '0' from definition
        PRDATAS13  => PRDATAS13_const_net_0, -- tied to X"0" from definition
        PREADYS13  => VCC_net, -- tied to '1' from definition
        PSLVERRS13 => GND_net, -- tied to '0' from definition
        PRDATAS14  => PRDATAS14_const_net_0, -- tied to X"0" from definition
        PREADYS14  => VCC_net, -- tied to '1' from definition
        PSLVERRS14 => GND_net, -- tied to '0' from definition
        PRDATAS15  => PRDATAS15_const_net_0, -- tied to X"0" from definition
        PREADYS15  => VCC_net, -- tied to '1' from definition
        PSLVERRS15 => GND_net, -- tied to '0' from definition
        PRDATAS16  => PRDATAS16_const_net_0, -- tied to X"0" from definition
        PREADYS16  => VCC_net, -- tied to '1' from definition
        PSLVERRS16 => GND_net, -- tied to '0' from definition
        IADDR      => IADDR_const_net_0, -- tied to X"0" from definition
        -- Outputs
        PRDATA     => MDDR_Demo_sb_sb_MSS_TMP_0_FIC_0_APB_MASTER_PRDATA,
        PREADY     => MDDR_Demo_sb_sb_MSS_TMP_0_FIC_0_APB_MASTER_PREADY,
        PSLVERR    => MDDR_Demo_sb_sb_MSS_TMP_0_FIC_0_APB_MASTER_PSLVERR,
        PADDRS     => AMBA_SLAVE_0_PADDR,
        PWRITES    => AMBA_SLAVE_0_PWRITE,
        PENABLES   => AMBA_SLAVE_0_PENABLE,
        PWDATAS    => AMBA_SLAVE_0_PWDATA,
        PSELS0     => AMBA_SLAVE_0_PSELx,
        PSELS1     => OPEN,
        PSELS2     => OPEN,
        PSELS3     => OPEN,
        PSELS4     => OPEN,
        PSELS5     => OPEN,
        PSELS6     => OPEN,
        PSELS7     => OPEN,
        PSELS8     => OPEN,
        PSELS9     => OPEN,
        PSELS10    => OPEN,
        PSELS11    => OPEN,
        PSELS12    => OPEN,
        PSELS13    => OPEN,
        PSELS14    => OPEN,
        PSELS15    => OPEN,
        PSELS16    => OPEN 
        );
-- COREAXI_0   -   Actel:DirectCore:COREAXI:3.1.100
COREAXI_0 : MDDR_Demo_sb_sb_COREAXI_0_COREAXI
    generic map( 
        ADDR_HGS_CFG     => ( 1 ),
        AXI_DWIDTH       => ( 64 ),
        FAMILY           => ( 19 ),
        FEED_THROUGH     => ( 1 ),
        HGS_CFG          => ( 1 ),
        ID_WIDTH         => ( 4 ),
        INP_REG_BUF      => ( 1 ),
        M0_SLAVE0ENABLE  => ( 1 ),
        M0_SLAVE1ENABLE  => ( 0 ),
        M0_SLAVE2ENABLE  => ( 0 ),
        M0_SLAVE3ENABLE  => ( 0 ),
        M0_SLAVE4ENABLE  => ( 0 ),
        M0_SLAVE5ENABLE  => ( 0 ),
        M0_SLAVE6ENABLE  => ( 0 ),
        M0_SLAVE7ENABLE  => ( 0 ),
        M0_SLAVE8ENABLE  => ( 0 ),
        M0_SLAVE9ENABLE  => ( 0 ),
        M0_SLAVE10ENABLE => ( 0 ),
        M0_SLAVE11ENABLE => ( 0 ),
        M0_SLAVE12ENABLE => ( 0 ),
        M0_SLAVE13ENABLE => ( 0 ),
        M0_SLAVE14ENABLE => ( 0 ),
        M0_SLAVE15ENABLE => ( 0 ),
        M0_SLAVE16ENABLE => ( 0 ),
        M1_SLAVE0ENABLE  => ( 0 ),
        M1_SLAVE1ENABLE  => ( 0 ),
        M1_SLAVE2ENABLE  => ( 0 ),
        M1_SLAVE3ENABLE  => ( 0 ),
        M1_SLAVE4ENABLE  => ( 0 ),
        M1_SLAVE5ENABLE  => ( 0 ),
        M1_SLAVE6ENABLE  => ( 0 ),
        M1_SLAVE7ENABLE  => ( 0 ),
        M1_SLAVE8ENABLE  => ( 0 ),
        M1_SLAVE9ENABLE  => ( 0 ),
        M1_SLAVE10ENABLE => ( 0 ),
        M1_SLAVE11ENABLE => ( 0 ),
        M1_SLAVE12ENABLE => ( 0 ),
        M1_SLAVE13ENABLE => ( 0 ),
        M1_SLAVE14ENABLE => ( 0 ),
        M1_SLAVE15ENABLE => ( 0 ),
        M1_SLAVE16ENABLE => ( 0 ),
        M2_SLAVE0ENABLE  => ( 0 ),
        M2_SLAVE1ENABLE  => ( 0 ),
        M2_SLAVE2ENABLE  => ( 0 ),
        M2_SLAVE3ENABLE  => ( 0 ),
        M2_SLAVE4ENABLE  => ( 0 ),
        M2_SLAVE5ENABLE  => ( 0 ),
        M2_SLAVE6ENABLE  => ( 0 ),
        M2_SLAVE7ENABLE  => ( 0 ),
        M2_SLAVE8ENABLE  => ( 0 ),
        M2_SLAVE9ENABLE  => ( 0 ),
        M2_SLAVE10ENABLE => ( 0 ),
        M2_SLAVE11ENABLE => ( 0 ),
        M2_SLAVE12ENABLE => ( 0 ),
        M2_SLAVE13ENABLE => ( 0 ),
        M2_SLAVE14ENABLE => ( 0 ),
        M2_SLAVE15ENABLE => ( 0 ),
        M2_SLAVE16ENABLE => ( 0 ),
        M3_SLAVE0ENABLE  => ( 0 ),
        M3_SLAVE1ENABLE  => ( 0 ),
        M3_SLAVE2ENABLE  => ( 0 ),
        M3_SLAVE3ENABLE  => ( 0 ),
        M3_SLAVE4ENABLE  => ( 0 ),
        M3_SLAVE5ENABLE  => ( 0 ),
        M3_SLAVE6ENABLE  => ( 0 ),
        M3_SLAVE7ENABLE  => ( 0 ),
        M3_SLAVE8ENABLE  => ( 0 ),
        M3_SLAVE9ENABLE  => ( 0 ),
        M3_SLAVE10ENABLE => ( 0 ),
        M3_SLAVE11ENABLE => ( 0 ),
        M3_SLAVE12ENABLE => ( 0 ),
        M3_SLAVE13ENABLE => ( 0 ),
        M3_SLAVE14ENABLE => ( 0 ),
        M3_SLAVE15ENABLE => ( 0 ),
        M3_SLAVE16ENABLE => ( 0 ),
        MEMSPACE         => ( 3 ),
        NUM_MASTER_SLOT  => ( 1 ),
        OUT_REG_BUF      => ( 1 ),
        RD_ACCEPTANCE    => ( 4 ),
        SC_0             => ( 0 ),
        SC_1             => ( 0 ),
        SC_2             => ( 0 ),
        SC_3             => ( 0 ),
        SC_4             => ( 0 ),
        SC_5             => ( 0 ),
        SC_6             => ( 0 ),
        SC_7             => ( 0 ),
        SC_8             => ( 0 ),
        SC_9             => ( 0 ),
        SC_10            => ( 0 ),
        SC_11            => ( 0 ),
        SC_12            => ( 0 ),
        SC_13            => ( 0 ),
        SC_14            => ( 0 ),
        SC_15            => ( 0 )
        )
    port map( 
        -- Inputs
        ACLK        => MSS_DDR_FIC_SUBSYSTEM_CLK_net_0,
        ARESETN     => MSS_READY_net_0,
        AWID_M0     => AMBA_MASTER_0_AWID_M0,
        AWADDR_M0   => AMBA_MASTER_0_AWADDR_M0,
        AWLEN_M0    => AMBA_MASTER_0_AWLEN_M0,
        AWSIZE_M0   => AMBA_MASTER_0_AWSIZE_M0,
        AWBURST_M0  => AMBA_MASTER_0_AWBURST_M0,
        AWLOCK_M0   => AMBA_MASTER_0_AWLOCK_M0,
        AWCACHE_M0  => AMBA_MASTER_0_AWCACHE_M0,
        AWPROT_M0   => AMBA_MASTER_0_AWPROT_M0,
        AWVALID_M0  => AMBA_MASTER_0_AWVALID_M0,
        WID_M0      => AMBA_MASTER_0_WID_M0,
        WDATA_M0    => AMBA_MASTER_0_WDATA_M0,
        WSTRB_M0    => AMBA_MASTER_0_WSTRB_M0,
        WLAST_M0    => AMBA_MASTER_0_WLAST_M0,
        WVALID_M0   => AMBA_MASTER_0_WVALID_M0,
        BREADY_M0   => AMBA_MASTER_0_BREADY_M0,
        ARID_M0     => AMBA_MASTER_0_ARID_M0,
        ARADDR_M0   => AMBA_MASTER_0_ARADDR_M0,
        ARLEN_M0    => AMBA_MASTER_0_ARLEN_M0,
        ARSIZE_M0   => AMBA_MASTER_0_ARSIZE_M0,
        ARBURST_M0  => AMBA_MASTER_0_ARBURST_M0,
        ARLOCK_M0   => AMBA_MASTER_0_ARLOCK_M0,
        ARCACHE_M0  => AMBA_MASTER_0_ARCACHE_M0,
        ARPROT_M0   => AMBA_MASTER_0_ARPROT_M0,
        ARVALID_M0  => AMBA_MASTER_0_ARVALID_M0,
        RREADY_M0   => AMBA_MASTER_0_RREADY_M0,
        AWID_M1     => AWID_M1_const_net_0, -- tied to X"0" from definition
        AWADDR_M1   => AWADDR_M1_const_net_0, -- tied to X"0" from definition
        AWLEN_M1    => AWLEN_M1_const_net_0, -- tied to X"0" from definition
        AWSIZE_M1   => AWSIZE_M1_const_net_0, -- tied to X"0" from definition
        AWBURST_M1  => AWBURST_M1_const_net_0, -- tied to X"0" from definition
        AWLOCK_M1   => AWLOCK_M1_const_net_0, -- tied to X"0" from definition
        AWCACHE_M1  => AWCACHE_M1_const_net_0, -- tied to X"0" from definition
        AWPROT_M1   => AWPROT_M1_const_net_0, -- tied to X"0" from definition
        AWVALID_M1  => GND_net, -- tied to '0' from definition
        WID_M1      => WID_M1_const_net_0, -- tied to X"0" from definition
        WDATA_M1    => WDATA_M1_const_net_0, -- tied to X"0" from definition
        WSTRB_M1    => WSTRB_M1_const_net_0, -- tied to X"0" from definition
        WLAST_M1    => GND_net, -- tied to '0' from definition
        WVALID_M1   => GND_net, -- tied to '0' from definition
        BREADY_M1   => GND_net, -- tied to '0' from definition
        ARID_M1     => ARID_M1_const_net_0, -- tied to X"0" from definition
        ARADDR_M1   => ARADDR_M1_const_net_0, -- tied to X"0" from definition
        ARLEN_M1    => ARLEN_M1_const_net_0, -- tied to X"0" from definition
        ARSIZE_M1   => ARSIZE_M1_const_net_0, -- tied to X"0" from definition
        ARBURST_M1  => ARBURST_M1_const_net_0, -- tied to X"0" from definition
        ARLOCK_M1   => ARLOCK_M1_const_net_0, -- tied to X"0" from definition
        ARCACHE_M1  => ARCACHE_M1_const_net_0, -- tied to X"0" from definition
        ARPROT_M1   => ARPROT_M1_const_net_0, -- tied to X"0" from definition
        ARVALID_M1  => GND_net, -- tied to '0' from definition
        RREADY_M1   => GND_net, -- tied to '0' from definition
        AWID_M2     => AWID_M2_const_net_0, -- tied to X"0" from definition
        AWADDR_M2   => AWADDR_M2_const_net_0, -- tied to X"0" from definition
        AWLEN_M2    => AWLEN_M2_const_net_0, -- tied to X"0" from definition
        AWSIZE_M2   => AWSIZE_M2_const_net_0, -- tied to X"0" from definition
        AWBURST_M2  => AWBURST_M2_const_net_0, -- tied to X"0" from definition
        AWLOCK_M2   => AWLOCK_M2_const_net_0, -- tied to X"0" from definition
        AWCACHE_M2  => AWCACHE_M2_const_net_0, -- tied to X"0" from definition
        AWPROT_M2   => AWPROT_M2_const_net_0, -- tied to X"0" from definition
        AWVALID_M2  => GND_net, -- tied to '0' from definition
        WID_M2      => WID_M2_const_net_0, -- tied to X"0" from definition
        WDATA_M2    => WDATA_M2_const_net_0, -- tied to X"0" from definition
        WSTRB_M2    => WSTRB_M2_const_net_0, -- tied to X"0" from definition
        WLAST_M2    => GND_net, -- tied to '0' from definition
        WVALID_M2   => GND_net, -- tied to '0' from definition
        BREADY_M2   => GND_net, -- tied to '0' from definition
        ARID_M2     => ARID_M2_const_net_0, -- tied to X"0" from definition
        ARADDR_M2   => ARADDR_M2_const_net_0, -- tied to X"0" from definition
        ARLEN_M2    => ARLEN_M2_const_net_0, -- tied to X"0" from definition
        ARSIZE_M2   => ARSIZE_M2_const_net_0, -- tied to X"0" from definition
        ARBURST_M2  => ARBURST_M2_const_net_0, -- tied to X"0" from definition
        ARLOCK_M2   => ARLOCK_M2_const_net_0, -- tied to X"0" from definition
        ARCACHE_M2  => ARCACHE_M2_const_net_0, -- tied to X"0" from definition
        ARPROT_M2   => ARPROT_M2_const_net_0, -- tied to X"0" from definition
        ARVALID_M2  => GND_net, -- tied to '0' from definition
        RREADY_M2   => GND_net, -- tied to '0' from definition
        AWID_M3     => AWID_M3_const_net_0, -- tied to X"0" from definition
        AWADDR_M3   => AWADDR_M3_const_net_0, -- tied to X"0" from definition
        AWLEN_M3    => AWLEN_M3_const_net_0, -- tied to X"0" from definition
        AWSIZE_M3   => AWSIZE_M3_const_net_0, -- tied to X"0" from definition
        AWBURST_M3  => AWBURST_M3_const_net_0, -- tied to X"0" from definition
        AWLOCK_M3   => AWLOCK_M3_const_net_0, -- tied to X"0" from definition
        AWCACHE_M3  => AWCACHE_M3_const_net_0, -- tied to X"0" from definition
        AWPROT_M3   => AWPROT_M3_const_net_0, -- tied to X"0" from definition
        AWVALID_M3  => GND_net, -- tied to '0' from definition
        WID_M3      => WID_M3_const_net_0, -- tied to X"0" from definition
        WDATA_M3    => WDATA_M3_const_net_0, -- tied to X"0" from definition
        WSTRB_M3    => WSTRB_M3_const_net_0, -- tied to X"0" from definition
        WLAST_M3    => GND_net, -- tied to '0' from definition
        WVALID_M3   => GND_net, -- tied to '0' from definition
        BREADY_M3   => GND_net, -- tied to '0' from definition
        ARID_M3     => ARID_M3_const_net_0, -- tied to X"0" from definition
        ARADDR_M3   => ARADDR_M3_const_net_0, -- tied to X"0" from definition
        ARLEN_M3    => ARLEN_M3_const_net_0, -- tied to X"0" from definition
        ARSIZE_M3   => ARSIZE_M3_const_net_0, -- tied to X"0" from definition
        ARBURST_M3  => ARBURST_M3_const_net_0, -- tied to X"0" from definition
        ARLOCK_M3   => ARLOCK_M3_const_net_0, -- tied to X"0" from definition
        ARCACHE_M3  => ARCACHE_M3_const_net_0, -- tied to X"0" from definition
        ARPROT_M3   => ARPROT_M3_const_net_0, -- tied to X"0" from definition
        ARVALID_M3  => GND_net, -- tied to '0' from definition
        RREADY_M3   => GND_net, -- tied to '0' from definition
        AWREADY_S0  => COREAXI_0_AXImslave0_AWREADY,
        WREADY_S0   => COREAXI_0_AXImslave0_WREADY,
        BID_S0      => COREAXI_0_AXImslave0_BID_0,
        BRESP_S0    => COREAXI_0_AXImslave0_BRESP,
        BVALID_S0   => COREAXI_0_AXImslave0_BVALID,
        ARREADY_S0  => COREAXI_0_AXImslave0_ARREADY,
        RID_S0      => COREAXI_0_AXImslave0_RID_0,
        RDATA_S0    => COREAXI_0_AXImslave0_RDATA,
        RRESP_S0    => COREAXI_0_AXImslave0_RRESP,
        RLAST_S0    => COREAXI_0_AXImslave0_RLAST,
        RVALID_S0   => COREAXI_0_AXImslave0_RVALID,
        AWREADY_S1  => GND_net, -- tied to '0' from definition
        WREADY_S1   => GND_net, -- tied to '0' from definition
        BID_S1      => BID_S1_const_net_0, -- tied to X"0" from definition
        BRESP_S1    => BRESP_S1_const_net_0, -- tied to X"0" from definition
        BVALID_S1   => GND_net, -- tied to '0' from definition
        ARREADY_S1  => GND_net, -- tied to '0' from definition
        RID_S1      => RID_S1_const_net_0, -- tied to X"0" from definition
        RDATA_S1    => RDATA_S1_const_net_0, -- tied to X"0" from definition
        RRESP_S1    => RRESP_S1_const_net_0, -- tied to X"0" from definition
        RLAST_S1    => GND_net, -- tied to '0' from definition
        RVALID_S1   => GND_net, -- tied to '0' from definition
        AWREADY_S2  => GND_net, -- tied to '0' from definition
        WREADY_S2   => GND_net, -- tied to '0' from definition
        BID_S2      => BID_S2_const_net_0, -- tied to X"0" from definition
        BRESP_S2    => BRESP_S2_const_net_0, -- tied to X"0" from definition
        BVALID_S2   => GND_net, -- tied to '0' from definition
        ARREADY_S2  => GND_net, -- tied to '0' from definition
        RID_S2      => RID_S2_const_net_0, -- tied to X"0" from definition
        RDATA_S2    => RDATA_S2_const_net_0, -- tied to X"0" from definition
        RRESP_S2    => RRESP_S2_const_net_0, -- tied to X"0" from definition
        RLAST_S2    => GND_net, -- tied to '0' from definition
        RVALID_S2   => GND_net, -- tied to '0' from definition
        AWREADY_S3  => GND_net, -- tied to '0' from definition
        WREADY_S3   => GND_net, -- tied to '0' from definition
        BID_S3      => BID_S3_const_net_0, -- tied to X"0" from definition
        BRESP_S3    => BRESP_S3_const_net_0, -- tied to X"0" from definition
        BVALID_S3   => GND_net, -- tied to '0' from definition
        ARREADY_S3  => GND_net, -- tied to '0' from definition
        RID_S3      => RID_S3_const_net_0, -- tied to X"0" from definition
        RDATA_S3    => RDATA_S3_const_net_0, -- tied to X"0" from definition
        RRESP_S3    => RRESP_S3_const_net_0, -- tied to X"0" from definition
        RLAST_S3    => GND_net, -- tied to '0' from definition
        RVALID_S3   => GND_net, -- tied to '0' from definition
        AWREADY_S4  => GND_net, -- tied to '0' from definition
        WREADY_S4   => GND_net, -- tied to '0' from definition
        BID_S4      => BID_S4_const_net_0, -- tied to X"0" from definition
        BRESP_S4    => BRESP_S4_const_net_0, -- tied to X"0" from definition
        BVALID_S4   => GND_net, -- tied to '0' from definition
        ARREADY_S4  => GND_net, -- tied to '0' from definition
        RID_S4      => RID_S4_const_net_0, -- tied to X"0" from definition
        RDATA_S4    => RDATA_S4_const_net_0, -- tied to X"0" from definition
        RRESP_S4    => RRESP_S4_const_net_0, -- tied to X"0" from definition
        RLAST_S4    => GND_net, -- tied to '0' from definition
        RVALID_S4   => GND_net, -- tied to '0' from definition
        AWREADY_S5  => GND_net, -- tied to '0' from definition
        WREADY_S5   => GND_net, -- tied to '0' from definition
        BID_S5      => BID_S5_const_net_0, -- tied to X"0" from definition
        BRESP_S5    => BRESP_S5_const_net_0, -- tied to X"0" from definition
        BVALID_S5   => GND_net, -- tied to '0' from definition
        ARREADY_S5  => GND_net, -- tied to '0' from definition
        RID_S5      => RID_S5_const_net_0, -- tied to X"0" from definition
        RDATA_S5    => RDATA_S5_const_net_0, -- tied to X"0" from definition
        RRESP_S5    => RRESP_S5_const_net_0, -- tied to X"0" from definition
        RLAST_S5    => GND_net, -- tied to '0' from definition
        RVALID_S5   => GND_net, -- tied to '0' from definition
        AWREADY_S6  => GND_net, -- tied to '0' from definition
        WREADY_S6   => GND_net, -- tied to '0' from definition
        BID_S6      => BID_S6_const_net_0, -- tied to X"0" from definition
        BRESP_S6    => BRESP_S6_const_net_0, -- tied to X"0" from definition
        BVALID_S6   => GND_net, -- tied to '0' from definition
        ARREADY_S6  => GND_net, -- tied to '0' from definition
        RID_S6      => RID_S6_const_net_0, -- tied to X"0" from definition
        RDATA_S6    => RDATA_S6_const_net_0, -- tied to X"0" from definition
        RRESP_S6    => RRESP_S6_const_net_0, -- tied to X"0" from definition
        RLAST_S6    => GND_net, -- tied to '0' from definition
        RVALID_S6   => GND_net, -- tied to '0' from definition
        AWREADY_S7  => GND_net, -- tied to '0' from definition
        WREADY_S7   => GND_net, -- tied to '0' from definition
        BID_S7      => BID_S7_const_net_0, -- tied to X"0" from definition
        BRESP_S7    => BRESP_S7_const_net_0, -- tied to X"0" from definition
        BVALID_S7   => GND_net, -- tied to '0' from definition
        ARREADY_S7  => GND_net, -- tied to '0' from definition
        RID_S7      => RID_S7_const_net_0, -- tied to X"0" from definition
        RDATA_S7    => RDATA_S7_const_net_0, -- tied to X"0" from definition
        RRESP_S7    => RRESP_S7_const_net_0, -- tied to X"0" from definition
        RLAST_S7    => GND_net, -- tied to '0' from definition
        RVALID_S7   => GND_net, -- tied to '0' from definition
        AWREADY_S8  => GND_net, -- tied to '0' from definition
        WREADY_S8   => GND_net, -- tied to '0' from definition
        BID_S8      => BID_S8_const_net_0, -- tied to X"0" from definition
        BRESP_S8    => BRESP_S8_const_net_0, -- tied to X"0" from definition
        BVALID_S8   => GND_net, -- tied to '0' from definition
        ARREADY_S8  => GND_net, -- tied to '0' from definition
        RID_S8      => RID_S8_const_net_0, -- tied to X"0" from definition
        RDATA_S8    => RDATA_S8_const_net_0, -- tied to X"0" from definition
        RRESP_S8    => RRESP_S8_const_net_0, -- tied to X"0" from definition
        RLAST_S8    => GND_net, -- tied to '0' from definition
        RVALID_S8   => GND_net, -- tied to '0' from definition
        AWREADY_S9  => GND_net, -- tied to '0' from definition
        WREADY_S9   => GND_net, -- tied to '0' from definition
        BID_S9      => BID_S9_const_net_0, -- tied to X"0" from definition
        BRESP_S9    => BRESP_S9_const_net_0, -- tied to X"0" from definition
        BVALID_S9   => GND_net, -- tied to '0' from definition
        ARREADY_S9  => GND_net, -- tied to '0' from definition
        RID_S9      => RID_S9_const_net_0, -- tied to X"0" from definition
        RDATA_S9    => RDATA_S9_const_net_0, -- tied to X"0" from definition
        RRESP_S9    => RRESP_S9_const_net_0, -- tied to X"0" from definition
        RLAST_S9    => GND_net, -- tied to '0' from definition
        RVALID_S9   => GND_net, -- tied to '0' from definition
        AWREADY_S10 => GND_net, -- tied to '0' from definition
        WREADY_S10  => GND_net, -- tied to '0' from definition
        BID_S10     => BID_S10_const_net_0, -- tied to X"0" from definition
        BRESP_S10   => BRESP_S10_const_net_0, -- tied to X"0" from definition
        BVALID_S10  => GND_net, -- tied to '0' from definition
        ARREADY_S10 => GND_net, -- tied to '0' from definition
        RID_S10     => RID_S10_const_net_0, -- tied to X"0" from definition
        RDATA_S10   => RDATA_S10_const_net_0, -- tied to X"0" from definition
        RRESP_S10   => RRESP_S10_const_net_0, -- tied to X"0" from definition
        RLAST_S10   => GND_net, -- tied to '0' from definition
        RVALID_S10  => GND_net, -- tied to '0' from definition
        AWREADY_S11 => GND_net, -- tied to '0' from definition
        WREADY_S11  => GND_net, -- tied to '0' from definition
        BID_S11     => BID_S11_const_net_0, -- tied to X"0" from definition
        BRESP_S11   => BRESP_S11_const_net_0, -- tied to X"0" from definition
        BVALID_S11  => GND_net, -- tied to '0' from definition
        ARREADY_S11 => GND_net, -- tied to '0' from definition
        RID_S11     => RID_S11_const_net_0, -- tied to X"0" from definition
        RDATA_S11   => RDATA_S11_const_net_0, -- tied to X"0" from definition
        RRESP_S11   => RRESP_S11_const_net_0, -- tied to X"0" from definition
        RLAST_S11   => GND_net, -- tied to '0' from definition
        RVALID_S11  => GND_net, -- tied to '0' from definition
        AWREADY_S12 => GND_net, -- tied to '0' from definition
        WREADY_S12  => GND_net, -- tied to '0' from definition
        BID_S12     => BID_S12_const_net_0, -- tied to X"0" from definition
        BRESP_S12   => BRESP_S12_const_net_0, -- tied to X"0" from definition
        BVALID_S12  => GND_net, -- tied to '0' from definition
        ARREADY_S12 => GND_net, -- tied to '0' from definition
        RID_S12     => RID_S12_const_net_0, -- tied to X"0" from definition
        RDATA_S12   => RDATA_S12_const_net_0, -- tied to X"0" from definition
        RRESP_S12   => RRESP_S12_const_net_0, -- tied to X"0" from definition
        RLAST_S12   => GND_net, -- tied to '0' from definition
        RVALID_S12  => GND_net, -- tied to '0' from definition
        AWREADY_S13 => GND_net, -- tied to '0' from definition
        WREADY_S13  => GND_net, -- tied to '0' from definition
        BID_S13     => BID_S13_const_net_0, -- tied to X"0" from definition
        BRESP_S13   => BRESP_S13_const_net_0, -- tied to X"0" from definition
        BVALID_S13  => GND_net, -- tied to '0' from definition
        ARREADY_S13 => GND_net, -- tied to '0' from definition
        RID_S13     => RID_S13_const_net_0, -- tied to X"0" from definition
        RDATA_S13   => RDATA_S13_const_net_0, -- tied to X"0" from definition
        RRESP_S13   => RRESP_S13_const_net_0, -- tied to X"0" from definition
        RLAST_S13   => GND_net, -- tied to '0' from definition
        RVALID_S13  => GND_net, -- tied to '0' from definition
        AWREADY_S14 => GND_net, -- tied to '0' from definition
        WREADY_S14  => GND_net, -- tied to '0' from definition
        BID_S14     => BID_S14_const_net_0, -- tied to X"0" from definition
        BRESP_S14   => BRESP_S14_const_net_0, -- tied to X"0" from definition
        BVALID_S14  => GND_net, -- tied to '0' from definition
        ARREADY_S14 => GND_net, -- tied to '0' from definition
        RID_S14     => RID_S14_const_net_0, -- tied to X"0" from definition
        RDATA_S14   => RDATA_S14_const_net_0, -- tied to X"0" from definition
        RRESP_S14   => RRESP_S14_const_net_0, -- tied to X"0" from definition
        RLAST_S14   => GND_net, -- tied to '0' from definition
        RVALID_S14  => GND_net, -- tied to '0' from definition
        AWREADY_S15 => GND_net, -- tied to '0' from definition
        WREADY_S15  => GND_net, -- tied to '0' from definition
        BID_S15     => BID_S15_const_net_0, -- tied to X"0" from definition
        BRESP_S15   => BRESP_S15_const_net_0, -- tied to X"0" from definition
        BVALID_S15  => GND_net, -- tied to '0' from definition
        ARREADY_S15 => GND_net, -- tied to '0' from definition
        RID_S15     => RID_S15_const_net_0, -- tied to X"0" from definition
        RDATA_S15   => RDATA_S15_const_net_0, -- tied to X"0" from definition
        RRESP_S15   => RRESP_S15_const_net_0, -- tied to X"0" from definition
        RLAST_S15   => GND_net, -- tied to '0' from definition
        RVALID_S15  => GND_net, -- tied to '0' from definition
        AWREADY_S16 => GND_net, -- tied to '0' from definition
        WREADY_S16  => GND_net, -- tied to '0' from definition
        BID_S16     => BID_S16_const_net_0, -- tied to X"0" from definition
        BRESP_S16   => BRESP_S16_const_net_0, -- tied to X"0" from definition
        BVALID_S16  => GND_net, -- tied to '0' from definition
        ARREADY_S16 => GND_net, -- tied to '0' from definition
        RID_S16     => RID_S16_const_net_0, -- tied to X"0" from definition
        RDATA_S16   => RDATA_S16_const_net_0, -- tied to X"0" from definition
        RRESP_S16   => RRESP_S16_const_net_0, -- tied to X"0" from definition
        RLAST_S16   => GND_net, -- tied to '0' from definition
        RVALID_S16  => GND_net, -- tied to '0' from definition
        -- Outputs
        AWREADY_M0  => AMBA_MASTER_0_AWREADY,
        WREADY_M0   => AMBA_MASTER_0_WREADY,
        BID_M0      => AMBA_MASTER_0_BID,
        BRESP_M0    => AMBA_MASTER_0_BRESP,
        BVALID_M0   => AMBA_MASTER_0_BVALID,
        ARREADY_M0  => AMBA_MASTER_0_ARREADY,
        RID_M0      => AMBA_MASTER_0_RID,
        RDATA_M0    => AMBA_MASTER_0_RDATA,
        RRESP_M0    => AMBA_MASTER_0_RRESP,
        RLAST_M0    => AMBA_MASTER_0_RLAST,
        RVALID_M0   => AMBA_MASTER_0_RVALID,
        AWREADY_M1  => OPEN,
        WREADY_M1   => OPEN,
        BID_M1      => OPEN,
        BRESP_M1    => OPEN,
        BVALID_M1   => OPEN,
        ARREADY_M1  => OPEN,
        RID_M1      => OPEN,
        RDATA_M1    => OPEN,
        RRESP_M1    => OPEN,
        RLAST_M1    => OPEN,
        RVALID_M1   => OPEN,
        AWREADY_M2  => OPEN,
        WREADY_M2   => OPEN,
        BID_M2      => OPEN,
        BRESP_M2    => OPEN,
        BVALID_M2   => OPEN,
        ARREADY_M2  => OPEN,
        RID_M2      => OPEN,
        RDATA_M2    => OPEN,
        RRESP_M2    => OPEN,
        RLAST_M2    => OPEN,
        RVALID_M2   => OPEN,
        AWREADY_M3  => OPEN,
        WREADY_M3   => OPEN,
        BID_M3      => OPEN,
        BRESP_M3    => OPEN,
        BVALID_M3   => OPEN,
        ARREADY_M3  => OPEN,
        RID_M3      => OPEN,
        RDATA_M3    => OPEN,
        RRESP_M3    => OPEN,
        RLAST_M3    => OPEN,
        RVALID_M3   => OPEN,
        AWID_S0     => COREAXI_0_AXImslave0_AWID,
        AWADDR_S0   => COREAXI_0_AXImslave0_AWADDR,
        AWLEN_S0    => COREAXI_0_AXImslave0_AWLEN,
        AWSIZE_S0   => COREAXI_0_AXImslave0_AWSIZE,
        AWBURST_S0  => COREAXI_0_AXImslave0_AWBURST,
        AWLOCK_S0   => COREAXI_0_AXImslave0_AWLOCK,
        AWCACHE_S0  => COREAXI_0_AXImslave0_AWCACHE,
        AWPROT_S0   => COREAXI_0_AXImslave0_AWPROT,
        AWVALID_S0  => COREAXI_0_AXImslave0_AWVALID,
        WID_S0      => COREAXI_0_AXImslave0_WID,
        WDATA_S0    => COREAXI_0_AXImslave0_WDATA,
        WSTRB_S0    => COREAXI_0_AXImslave0_WSTRB,
        WLAST_S0    => COREAXI_0_AXImslave0_WLAST,
        WVALID_S0   => COREAXI_0_AXImslave0_WVALID,
        BREADY_S0   => COREAXI_0_AXImslave0_BREADY,
        ARID_S0     => COREAXI_0_AXImslave0_ARID,
        ARADDR_S0   => COREAXI_0_AXImslave0_ARADDR,
        ARLEN_S0    => COREAXI_0_AXImslave0_ARLEN,
        ARSIZE_S0   => COREAXI_0_AXImslave0_ARSIZE,
        ARBURST_S0  => COREAXI_0_AXImslave0_ARBURST,
        ARLOCK_S0   => COREAXI_0_AXImslave0_ARLOCK,
        ARCACHE_S0  => COREAXI_0_AXImslave0_ARCACHE,
        ARPROT_S0   => COREAXI_0_AXImslave0_ARPROT,
        ARVALID_S0  => COREAXI_0_AXImslave0_ARVALID,
        RREADY_S0   => COREAXI_0_AXImslave0_RREADY,
        AWID_S1     => OPEN,
        AWADDR_S1   => OPEN,
        AWLEN_S1    => OPEN,
        AWSIZE_S1   => OPEN,
        AWBURST_S1  => OPEN,
        AWLOCK_S1   => OPEN,
        AWCACHE_S1  => OPEN,
        AWPROT_S1   => OPEN,
        AWVALID_S1  => OPEN,
        WID_S1      => OPEN,
        WDATA_S1    => OPEN,
        WSTRB_S1    => OPEN,
        WLAST_S1    => OPEN,
        WVALID_S1   => OPEN,
        BREADY_S1   => OPEN,
        ARID_S1     => OPEN,
        ARADDR_S1   => OPEN,
        ARLEN_S1    => OPEN,
        ARSIZE_S1   => OPEN,
        ARBURST_S1  => OPEN,
        ARLOCK_S1   => OPEN,
        ARCACHE_S1  => OPEN,
        ARPROT_S1   => OPEN,
        ARVALID_S1  => OPEN,
        RREADY_S1   => OPEN,
        AWID_S2     => OPEN,
        AWADDR_S2   => OPEN,
        AWLEN_S2    => OPEN,
        AWSIZE_S2   => OPEN,
        AWBURST_S2  => OPEN,
        AWLOCK_S2   => OPEN,
        AWCACHE_S2  => OPEN,
        AWPROT_S2   => OPEN,
        AWVALID_S2  => OPEN,
        WID_S2      => OPEN,
        WDATA_S2    => OPEN,
        WSTRB_S2    => OPEN,
        WLAST_S2    => OPEN,
        WVALID_S2   => OPEN,
        BREADY_S2   => OPEN,
        ARID_S2     => OPEN,
        ARADDR_S2   => OPEN,
        ARLEN_S2    => OPEN,
        ARSIZE_S2   => OPEN,
        ARBURST_S2  => OPEN,
        ARLOCK_S2   => OPEN,
        ARCACHE_S2  => OPEN,
        ARPROT_S2   => OPEN,
        ARVALID_S2  => OPEN,
        RREADY_S2   => OPEN,
        AWID_S3     => OPEN,
        AWADDR_S3   => OPEN,
        AWLEN_S3    => OPEN,
        AWSIZE_S3   => OPEN,
        AWBURST_S3  => OPEN,
        AWLOCK_S3   => OPEN,
        AWCACHE_S3  => OPEN,
        AWPROT_S3   => OPEN,
        AWVALID_S3  => OPEN,
        WID_S3      => OPEN,
        WDATA_S3    => OPEN,
        WSTRB_S3    => OPEN,
        WLAST_S3    => OPEN,
        WVALID_S3   => OPEN,
        BREADY_S3   => OPEN,
        ARID_S3     => OPEN,
        ARADDR_S3   => OPEN,
        ARLEN_S3    => OPEN,
        ARSIZE_S3   => OPEN,
        ARBURST_S3  => OPEN,
        ARLOCK_S3   => OPEN,
        ARCACHE_S3  => OPEN,
        ARPROT_S3   => OPEN,
        ARVALID_S3  => OPEN,
        RREADY_S3   => OPEN,
        AWID_S4     => OPEN,
        AWADDR_S4   => OPEN,
        AWLEN_S4    => OPEN,
        AWSIZE_S4   => OPEN,
        AWBURST_S4  => OPEN,
        AWLOCK_S4   => OPEN,
        AWCACHE_S4  => OPEN,
        AWPROT_S4   => OPEN,
        AWVALID_S4  => OPEN,
        WID_S4      => OPEN,
        WDATA_S4    => OPEN,
        WSTRB_S4    => OPEN,
        WLAST_S4    => OPEN,
        WVALID_S4   => OPEN,
        BREADY_S4   => OPEN,
        ARID_S4     => OPEN,
        ARADDR_S4   => OPEN,
        ARLEN_S4    => OPEN,
        ARSIZE_S4   => OPEN,
        ARBURST_S4  => OPEN,
        ARLOCK_S4   => OPEN,
        ARCACHE_S4  => OPEN,
        ARPROT_S4   => OPEN,
        ARVALID_S4  => OPEN,
        RREADY_S4   => OPEN,
        AWID_S5     => OPEN,
        AWADDR_S5   => OPEN,
        AWLEN_S5    => OPEN,
        AWSIZE_S5   => OPEN,
        AWBURST_S5  => OPEN,
        AWLOCK_S5   => OPEN,
        AWCACHE_S5  => OPEN,
        AWPROT_S5   => OPEN,
        AWVALID_S5  => OPEN,
        WID_S5      => OPEN,
        WDATA_S5    => OPEN,
        WSTRB_S5    => OPEN,
        WLAST_S5    => OPEN,
        WVALID_S5   => OPEN,
        BREADY_S5   => OPEN,
        ARID_S5     => OPEN,
        ARADDR_S5   => OPEN,
        ARLEN_S5    => OPEN,
        ARSIZE_S5   => OPEN,
        ARBURST_S5  => OPEN,
        ARLOCK_S5   => OPEN,
        ARCACHE_S5  => OPEN,
        ARPROT_S5   => OPEN,
        ARVALID_S5  => OPEN,
        RREADY_S5   => OPEN,
        AWID_S6     => OPEN,
        AWADDR_S6   => OPEN,
        AWLEN_S6    => OPEN,
        AWSIZE_S6   => OPEN,
        AWBURST_S6  => OPEN,
        AWLOCK_S6   => OPEN,
        AWCACHE_S6  => OPEN,
        AWPROT_S6   => OPEN,
        AWVALID_S6  => OPEN,
        WID_S6      => OPEN,
        WDATA_S6    => OPEN,
        WSTRB_S6    => OPEN,
        WLAST_S6    => OPEN,
        WVALID_S6   => OPEN,
        BREADY_S6   => OPEN,
        ARID_S6     => OPEN,
        ARADDR_S6   => OPEN,
        ARLEN_S6    => OPEN,
        ARSIZE_S6   => OPEN,
        ARBURST_S6  => OPEN,
        ARLOCK_S6   => OPEN,
        ARCACHE_S6  => OPEN,
        ARPROT_S6   => OPEN,
        ARVALID_S6  => OPEN,
        RREADY_S6   => OPEN,
        AWID_S7     => OPEN,
        AWADDR_S7   => OPEN,
        AWLEN_S7    => OPEN,
        AWSIZE_S7   => OPEN,
        AWBURST_S7  => OPEN,
        AWLOCK_S7   => OPEN,
        AWCACHE_S7  => OPEN,
        AWPROT_S7   => OPEN,
        AWVALID_S7  => OPEN,
        WID_S7      => OPEN,
        WDATA_S7    => OPEN,
        WSTRB_S7    => OPEN,
        WLAST_S7    => OPEN,
        WVALID_S7   => OPEN,
        BREADY_S7   => OPEN,
        ARID_S7     => OPEN,
        ARADDR_S7   => OPEN,
        ARLEN_S7    => OPEN,
        ARSIZE_S7   => OPEN,
        ARBURST_S7  => OPEN,
        ARLOCK_S7   => OPEN,
        ARCACHE_S7  => OPEN,
        ARPROT_S7   => OPEN,
        ARVALID_S7  => OPEN,
        RREADY_S7   => OPEN,
        AWID_S8     => OPEN,
        AWADDR_S8   => OPEN,
        AWLEN_S8    => OPEN,
        AWSIZE_S8   => OPEN,
        AWBURST_S8  => OPEN,
        AWLOCK_S8   => OPEN,
        AWCACHE_S8  => OPEN,
        AWPROT_S8   => OPEN,
        AWVALID_S8  => OPEN,
        WID_S8      => OPEN,
        WDATA_S8    => OPEN,
        WSTRB_S8    => OPEN,
        WLAST_S8    => OPEN,
        WVALID_S8   => OPEN,
        BREADY_S8   => OPEN,
        ARID_S8     => OPEN,
        ARADDR_S8   => OPEN,
        ARLEN_S8    => OPEN,
        ARSIZE_S8   => OPEN,
        ARBURST_S8  => OPEN,
        ARLOCK_S8   => OPEN,
        ARCACHE_S8  => OPEN,
        ARPROT_S8   => OPEN,
        ARVALID_S8  => OPEN,
        RREADY_S8   => OPEN,
        AWID_S9     => OPEN,
        AWADDR_S9   => OPEN,
        AWLEN_S9    => OPEN,
        AWSIZE_S9   => OPEN,
        AWBURST_S9  => OPEN,
        AWLOCK_S9   => OPEN,
        AWCACHE_S9  => OPEN,
        AWPROT_S9   => OPEN,
        AWVALID_S9  => OPEN,
        WID_S9      => OPEN,
        WDATA_S9    => OPEN,
        WSTRB_S9    => OPEN,
        WLAST_S9    => OPEN,
        WVALID_S9   => OPEN,
        BREADY_S9   => OPEN,
        ARID_S9     => OPEN,
        ARADDR_S9   => OPEN,
        ARLEN_S9    => OPEN,
        ARSIZE_S9   => OPEN,
        ARBURST_S9  => OPEN,
        ARLOCK_S9   => OPEN,
        ARCACHE_S9  => OPEN,
        ARPROT_S9   => OPEN,
        ARVALID_S9  => OPEN,
        RREADY_S9   => OPEN,
        AWID_S10    => OPEN,
        AWADDR_S10  => OPEN,
        AWLEN_S10   => OPEN,
        AWSIZE_S10  => OPEN,
        AWBURST_S10 => OPEN,
        AWLOCK_S10  => OPEN,
        AWCACHE_S10 => OPEN,
        AWPROT_S10  => OPEN,
        AWVALID_S10 => OPEN,
        WID_S10     => OPEN,
        WDATA_S10   => OPEN,
        WSTRB_S10   => OPEN,
        WLAST_S10   => OPEN,
        WVALID_S10  => OPEN,
        BREADY_S10  => OPEN,
        ARID_S10    => OPEN,
        ARADDR_S10  => OPEN,
        ARLEN_S10   => OPEN,
        ARSIZE_S10  => OPEN,
        ARBURST_S10 => OPEN,
        ARLOCK_S10  => OPEN,
        ARCACHE_S10 => OPEN,
        ARPROT_S10  => OPEN,
        ARVALID_S10 => OPEN,
        RREADY_S10  => OPEN,
        AWID_S11    => OPEN,
        AWADDR_S11  => OPEN,
        AWLEN_S11   => OPEN,
        AWSIZE_S11  => OPEN,
        AWBURST_S11 => OPEN,
        AWLOCK_S11  => OPEN,
        AWCACHE_S11 => OPEN,
        AWPROT_S11  => OPEN,
        AWVALID_S11 => OPEN,
        WID_S11     => OPEN,
        WDATA_S11   => OPEN,
        WSTRB_S11   => OPEN,
        WLAST_S11   => OPEN,
        WVALID_S11  => OPEN,
        BREADY_S11  => OPEN,
        ARID_S11    => OPEN,
        ARADDR_S11  => OPEN,
        ARLEN_S11   => OPEN,
        ARSIZE_S11  => OPEN,
        ARBURST_S11 => OPEN,
        ARLOCK_S11  => OPEN,
        ARCACHE_S11 => OPEN,
        ARPROT_S11  => OPEN,
        ARVALID_S11 => OPEN,
        RREADY_S11  => OPEN,
        AWID_S12    => OPEN,
        AWADDR_S12  => OPEN,
        AWLEN_S12   => OPEN,
        AWSIZE_S12  => OPEN,
        AWBURST_S12 => OPEN,
        AWLOCK_S12  => OPEN,
        AWCACHE_S12 => OPEN,
        AWPROT_S12  => OPEN,
        AWVALID_S12 => OPEN,
        WID_S12     => OPEN,
        WDATA_S12   => OPEN,
        WSTRB_S12   => OPEN,
        WLAST_S12   => OPEN,
        WVALID_S12  => OPEN,
        BREADY_S12  => OPEN,
        ARID_S12    => OPEN,
        ARADDR_S12  => OPEN,
        ARLEN_S12   => OPEN,
        ARSIZE_S12  => OPEN,
        ARBURST_S12 => OPEN,
        ARLOCK_S12  => OPEN,
        ARCACHE_S12 => OPEN,
        ARPROT_S12  => OPEN,
        ARVALID_S12 => OPEN,
        RREADY_S12  => OPEN,
        AWID_S13    => OPEN,
        AWADDR_S13  => OPEN,
        AWLEN_S13   => OPEN,
        AWSIZE_S13  => OPEN,
        AWBURST_S13 => OPEN,
        AWLOCK_S13  => OPEN,
        AWCACHE_S13 => OPEN,
        AWPROT_S13  => OPEN,
        AWVALID_S13 => OPEN,
        WID_S13     => OPEN,
        WDATA_S13   => OPEN,
        WSTRB_S13   => OPEN,
        WLAST_S13   => OPEN,
        WVALID_S13  => OPEN,
        BREADY_S13  => OPEN,
        ARID_S13    => OPEN,
        ARADDR_S13  => OPEN,
        ARLEN_S13   => OPEN,
        ARSIZE_S13  => OPEN,
        ARBURST_S13 => OPEN,
        ARLOCK_S13  => OPEN,
        ARCACHE_S13 => OPEN,
        ARPROT_S13  => OPEN,
        ARVALID_S13 => OPEN,
        RREADY_S13  => OPEN,
        AWID_S14    => OPEN,
        AWADDR_S14  => OPEN,
        AWLEN_S14   => OPEN,
        AWSIZE_S14  => OPEN,
        AWBURST_S14 => OPEN,
        AWLOCK_S14  => OPEN,
        AWCACHE_S14 => OPEN,
        AWPROT_S14  => OPEN,
        AWVALID_S14 => OPEN,
        WID_S14     => OPEN,
        WDATA_S14   => OPEN,
        WSTRB_S14   => OPEN,
        WLAST_S14   => OPEN,
        WVALID_S14  => OPEN,
        BREADY_S14  => OPEN,
        ARID_S14    => OPEN,
        ARADDR_S14  => OPEN,
        ARLEN_S14   => OPEN,
        ARSIZE_S14  => OPEN,
        ARBURST_S14 => OPEN,
        ARLOCK_S14  => OPEN,
        ARCACHE_S14 => OPEN,
        ARPROT_S14  => OPEN,
        ARVALID_S14 => OPEN,
        RREADY_S14  => OPEN,
        AWID_S15    => OPEN,
        AWADDR_S15  => OPEN,
        AWLEN_S15   => OPEN,
        AWSIZE_S15  => OPEN,
        AWBURST_S15 => OPEN,
        AWLOCK_S15  => OPEN,
        AWCACHE_S15 => OPEN,
        AWPROT_S15  => OPEN,
        AWVALID_S15 => OPEN,
        WID_S15     => OPEN,
        WDATA_S15   => OPEN,
        WSTRB_S15   => OPEN,
        WLAST_S15   => OPEN,
        WVALID_S15  => OPEN,
        BREADY_S15  => OPEN,
        ARID_S15    => OPEN,
        ARADDR_S15  => OPEN,
        ARLEN_S15   => OPEN,
        ARSIZE_S15  => OPEN,
        ARBURST_S15 => OPEN,
        ARLOCK_S15  => OPEN,
        ARCACHE_S15 => OPEN,
        ARPROT_S15  => OPEN,
        ARVALID_S15 => OPEN,
        RREADY_S15  => OPEN,
        AWID_S16    => OPEN,
        AWADDR_S16  => OPEN,
        AWLEN_S16   => OPEN,
        AWSIZE_S16  => OPEN,
        AWBURST_S16 => OPEN,
        AWLOCK_S16  => OPEN,
        AWCACHE_S16 => OPEN,
        AWPROT_S16  => OPEN,
        AWVALID_S16 => OPEN,
        WID_S16     => OPEN,
        WDATA_S16   => OPEN,
        WSTRB_S16   => OPEN,
        WLAST_S16   => OPEN,
        WVALID_S16  => OPEN,
        BREADY_S16  => OPEN,
        ARID_S16    => OPEN,
        ARADDR_S16  => OPEN,
        ARLEN_S16   => OPEN,
        ARSIZE_S16  => OPEN,
        ARBURST_S16 => OPEN,
        ARLOCK_S16  => OPEN,
        ARCACHE_S16 => OPEN,
        ARPROT_S16  => OPEN,
        ARVALID_S16 => OPEN,
        RREADY_S16  => OPEN 
        );
-- CORECONFIGP_0   -   Actel:DirectCore:CoreConfigP:7.1.100
CORECONFIGP_0 : CoreConfigP
    generic map( 
        DEVICE_090         => ( 0 ),
        ENABLE_SOFT_RESETS => ( 1 ),
        FDDR_IN_USE        => ( 0 ),
        MDDR_IN_USE        => ( 1 ),
        SDIF0_IN_USE       => ( 0 ),
        SDIF0_PCIE         => ( 0 ),
        SDIF1_IN_USE       => ( 0 ),
        SDIF1_PCIE         => ( 0 ),
        SDIF2_IN_USE       => ( 0 ),
        SDIF2_PCIE         => ( 0 ),
        SDIF3_IN_USE       => ( 0 ),
        SDIF3_PCIE         => ( 0 )
        )
    port map( 
        -- Inputs
        FIC_2_APB_M_PRESET_N           => MDDR_Demo_sb_sb_MSS_TMP_0_FIC_2_APB_M_PRESET_N,
        FIC_2_APB_M_PCLK               => MDDR_Demo_sb_sb_MSS_TMP_0_FIC_2_APB_M_PCLK,
        SDIF_RELEASED                  => GND_net, -- tied to '0' from definition
        INIT_DONE                      => INIT_DONE_net_0,
        FIC_2_APB_M_PSEL               => MDDR_Demo_sb_sb_MSS_TMP_0_FIC_2_APB_MASTER_PSELx,
        FIC_2_APB_M_PENABLE            => MDDR_Demo_sb_sb_MSS_TMP_0_FIC_2_APB_MASTER_PENABLE,
        FIC_2_APB_M_PWRITE             => MDDR_Demo_sb_sb_MSS_TMP_0_FIC_2_APB_MASTER_PWRITE,
        FIC_2_APB_M_PADDR              => MDDR_Demo_sb_sb_MSS_TMP_0_FIC_2_APB_MASTER_PADDR_0,
        FIC_2_APB_M_PWDATA             => MDDR_Demo_sb_sb_MSS_TMP_0_FIC_2_APB_MASTER_PWDATA,
        MDDR_PRDATA                    => CORECONFIGP_0_MDDR_APBmslave_PRDATA_0,
        MDDR_PREADY                    => CORECONFIGP_0_MDDR_APBmslave_PREADY,
        MDDR_PSLVERR                   => CORECONFIGP_0_MDDR_APBmslave_PSLVERR,
        FDDR_PRDATA                    => FDDR_PRDATA_const_net_0, -- tied to X"0" from definition
        FDDR_PREADY                    => VCC_net, -- tied to '1' from definition
        FDDR_PSLVERR                   => GND_net, -- tied to '0' from definition
        SDIF0_PRDATA                   => SDIF0_PRDATA_const_net_0, -- tied to X"0" from definition
        SDIF0_PREADY                   => VCC_net, -- tied to '1' from definition
        SDIF0_PSLVERR                  => GND_net, -- tied to '0' from definition
        SDIF1_PRDATA                   => SDIF1_PRDATA_const_net_0, -- tied to X"0" from definition
        SDIF1_PREADY                   => VCC_net, -- tied to '1' from definition
        SDIF1_PSLVERR                  => GND_net, -- tied to '0' from definition
        SDIF2_PRDATA                   => SDIF2_PRDATA_const_net_0, -- tied to X"0" from definition
        SDIF2_PREADY                   => VCC_net, -- tied to '1' from definition
        SDIF2_PSLVERR                  => GND_net, -- tied to '0' from definition
        SDIF3_PRDATA                   => SDIF3_PRDATA_const_net_0, -- tied to X"0" from definition
        SDIF3_PREADY                   => VCC_net, -- tied to '1' from definition
        SDIF3_PSLVERR                  => GND_net, -- tied to '0' from definition
        -- Outputs
        APB_S_PCLK                     => CORECONFIGP_0_APB_S_PCLK,
        APB_S_PRESET_N                 => CORECONFIGP_0_APB_S_PRESET_N,
        CONFIG1_DONE                   => CORECONFIGP_0_CONFIG1_DONE,
        CONFIG2_DONE                   => CORECONFIGP_0_CONFIG2_DONE,
        FIC_2_APB_M_PRDATA             => MDDR_Demo_sb_sb_MSS_TMP_0_FIC_2_APB_MASTER_PRDATA,
        FIC_2_APB_M_PREADY             => MDDR_Demo_sb_sb_MSS_TMP_0_FIC_2_APB_MASTER_PREADY,
        FIC_2_APB_M_PSLVERR            => MDDR_Demo_sb_sb_MSS_TMP_0_FIC_2_APB_MASTER_PSLVERR,
        MDDR_PSEL                      => CORECONFIGP_0_MDDR_APBmslave_PSELx,
        MDDR_PENABLE                   => CORECONFIGP_0_MDDR_APBmslave_PENABLE,
        MDDR_PWRITE                    => CORECONFIGP_0_MDDR_APBmslave_PWRITE,
        MDDR_PADDR                     => CORECONFIGP_0_MDDR_APBmslave_PADDR,
        MDDR_PWDATA                    => CORECONFIGP_0_MDDR_APBmslave_PWDATA,
        FDDR_PSEL                      => OPEN,
        FDDR_PENABLE                   => OPEN,
        FDDR_PWRITE                    => OPEN,
        FDDR_PADDR                     => OPEN,
        FDDR_PWDATA                    => OPEN,
        SDIF0_PSEL                     => OPEN,
        SDIF0_PENABLE                  => OPEN,
        SDIF0_PWRITE                   => OPEN,
        SDIF0_PADDR                    => OPEN,
        SDIF0_PWDATA                   => OPEN,
        SDIF1_PSEL                     => OPEN,
        SDIF1_PENABLE                  => OPEN,
        SDIF1_PWRITE                   => OPEN,
        SDIF1_PADDR                    => OPEN,
        SDIF1_PWDATA                   => OPEN,
        SDIF2_PSEL                     => OPEN,
        SDIF2_PENABLE                  => OPEN,
        SDIF2_PWRITE                   => OPEN,
        SDIF2_PADDR                    => OPEN,
        SDIF2_PWDATA                   => OPEN,
        SDIF3_PSEL                     => OPEN,
        SDIF3_PENABLE                  => OPEN,
        SDIF3_PWRITE                   => OPEN,
        SDIF3_PADDR                    => OPEN,
        SDIF3_PWDATA                   => OPEN,
        SOFT_EXT_RESET_OUT             => CORECONFIGP_0_SOFT_EXT_RESET_OUT,
        SOFT_RESET_F2M                 => CORECONFIGP_0_SOFT_RESET_F2M,
        SOFT_M3_RESET                  => CORECONFIGP_0_SOFT_M3_RESET,
        SOFT_MDDR_DDR_AXI_S_CORE_RESET => CORECONFIGP_0_SOFT_MDDR_DDR_AXI_S_CORE_RESET,
        SOFT_FDDR_CORE_RESET           => OPEN,
        SOFT_SDIF0_PHY_RESET           => OPEN,
        SOFT_SDIF0_CORE_RESET          => OPEN,
        SOFT_SDIF0_0_CORE_RESET        => OPEN,
        SOFT_SDIF0_1_CORE_RESET        => OPEN,
        SOFT_SDIF1_PHY_RESET           => OPEN,
        SOFT_SDIF1_CORE_RESET          => OPEN,
        SOFT_SDIF2_PHY_RESET           => OPEN,
        SOFT_SDIF2_CORE_RESET          => OPEN,
        SOFT_SDIF3_PHY_RESET           => OPEN,
        SOFT_SDIF3_CORE_RESET          => OPEN,
        R_SDIF0_PSEL                   => OPEN,
        R_SDIF0_PWRITE                 => OPEN,
        R_SDIF0_PRDATA                 => OPEN,
        R_SDIF1_PSEL                   => OPEN,
        R_SDIF1_PWRITE                 => OPEN,
        R_SDIF1_PRDATA                 => OPEN,
        R_SDIF2_PSEL                   => OPEN,
        R_SDIF2_PWRITE                 => OPEN,
        R_SDIF2_PRDATA                 => OPEN,
        R_SDIF3_PSEL                   => OPEN,
        R_SDIF3_PWRITE                 => OPEN,
        R_SDIF3_PRDATA                 => OPEN 
        );
-- CORERESETP_0   -   Actel:DirectCore:CoreResetP:7.1.100
CORERESETP_0 : CoreResetP
    generic map( 
        DDR_WAIT            => ( 200 ),
        DEVICE_090          => ( 0 ),
        DEVICE_VOLTAGE      => ( 2 ),
        ENABLE_SOFT_RESETS  => ( 1 ),
        EXT_RESET_CFG       => ( 0 ),
        FDDR_IN_USE         => ( 0 ),
        MDDR_IN_USE         => ( 1 ),
        SDIF0_IN_USE        => ( 0 ),
        SDIF0_PCIE          => ( 0 ),
        SDIF0_PCIE_HOTRESET => ( 1 ),
        SDIF0_PCIE_L2P2     => ( 1 ),
        SDIF1_IN_USE        => ( 0 ),
        SDIF1_PCIE          => ( 0 ),
        SDIF1_PCIE_HOTRESET => ( 1 ),
        SDIF1_PCIE_L2P2     => ( 1 ),
        SDIF2_IN_USE        => ( 0 ),
        SDIF2_PCIE          => ( 0 ),
        SDIF2_PCIE_HOTRESET => ( 1 ),
        SDIF2_PCIE_L2P2     => ( 1 ),
        SDIF3_IN_USE        => ( 0 ),
        SDIF3_PCIE          => ( 0 ),
        SDIF3_PCIE_HOTRESET => ( 1 ),
        SDIF3_PCIE_L2P2     => ( 1 )
        )
    port map( 
        -- Inputs
        RESET_N_M2F                    => MDDR_Demo_sb_sb_MSS_TMP_0_MSS_RESET_N_M2F,
        FIC_2_APB_M_PRESET_N           => MDDR_Demo_sb_sb_MSS_TMP_0_FIC_2_APB_M_PRESET_N,
        POWER_ON_RESET_N               => POWER_ON_RESET_N_net_0,
        FAB_RESET_N                    => FAB_RESET_N,
        RCOSC_25_50MHZ                 => FABOSC_0_RCOSC_25_50MHZ_O2F,
        CLK_BASE                       => FIC_0_CLK_net_0,
        CLK_LTSSM                      => GND_net, -- tied to '0' from definition
        FPLL_LOCK                      => VCC_net, -- tied to '1' from definition
        SDIF0_SPLL_LOCK                => VCC_net, -- tied to '1' from definition
        SDIF1_SPLL_LOCK                => VCC_net, -- tied to '1' from definition
        SDIF2_SPLL_LOCK                => VCC_net, -- tied to '1' from definition
        SDIF3_SPLL_LOCK                => VCC_net, -- tied to '1' from definition
        CONFIG1_DONE                   => CORECONFIGP_0_CONFIG1_DONE,
        CONFIG2_DONE                   => CORECONFIGP_0_CONFIG2_DONE,
        SDIF0_PERST_N                  => VCC_net, -- tied to '1' from definition
        SDIF1_PERST_N                  => VCC_net, -- tied to '1' from definition
        SDIF2_PERST_N                  => VCC_net, -- tied to '1' from definition
        SDIF3_PERST_N                  => VCC_net, -- tied to '1' from definition
        SDIF0_PSEL                     => GND_net, -- tied to '0' from definition
        SDIF0_PWRITE                   => VCC_net, -- tied to '1' from definition
        SDIF0_PRDATA                   => SDIF0_PRDATA_const_net_1, -- tied to X"0" from definition
        SDIF1_PSEL                     => GND_net, -- tied to '0' from definition
        SDIF1_PWRITE                   => VCC_net, -- tied to '1' from definition
        SDIF1_PRDATA                   => SDIF1_PRDATA_const_net_1, -- tied to X"0" from definition
        SDIF2_PSEL                     => GND_net, -- tied to '0' from definition
        SDIF2_PWRITE                   => VCC_net, -- tied to '1' from definition
        SDIF2_PRDATA                   => SDIF2_PRDATA_const_net_1, -- tied to X"0" from definition
        SDIF3_PSEL                     => GND_net, -- tied to '0' from definition
        SDIF3_PWRITE                   => VCC_net, -- tied to '1' from definition
        SDIF3_PRDATA                   => SDIF3_PRDATA_const_net_1, -- tied to X"0" from definition
        SOFT_EXT_RESET_OUT             => CORECONFIGP_0_SOFT_EXT_RESET_OUT,
        SOFT_RESET_F2M                 => CORECONFIGP_0_SOFT_RESET_F2M,
        SOFT_M3_RESET                  => CORECONFIGP_0_SOFT_M3_RESET,
        SOFT_MDDR_DDR_AXI_S_CORE_RESET => CORECONFIGP_0_SOFT_MDDR_DDR_AXI_S_CORE_RESET,
        SOFT_FDDR_CORE_RESET           => GND_net, -- tied to '0' from definition
        SOFT_SDIF0_PHY_RESET           => GND_net, -- tied to '0' from definition
        SOFT_SDIF0_CORE_RESET          => GND_net, -- tied to '0' from definition
        SOFT_SDIF0_0_CORE_RESET        => GND_net, -- tied to '0' from definition
        SOFT_SDIF0_1_CORE_RESET        => GND_net, -- tied to '0' from definition
        SOFT_SDIF1_PHY_RESET           => GND_net, -- tied to '0' from definition
        SOFT_SDIF1_CORE_RESET          => GND_net, -- tied to '0' from definition
        SOFT_SDIF2_PHY_RESET           => GND_net, -- tied to '0' from definition
        SOFT_SDIF2_CORE_RESET          => GND_net, -- tied to '0' from definition
        SOFT_SDIF3_PHY_RESET           => GND_net, -- tied to '0' from definition
        SOFT_SDIF3_CORE_RESET          => GND_net, -- tied to '0' from definition
        -- Outputs
        MSS_HPMS_READY                 => MSS_READY_net_0,
        DDR_READY                      => DDR_READY_net_0,
        SDIF_READY                     => OPEN,
        RESET_N_F2M                    => CORERESETP_0_RESET_N_F2M,
        M3_RESET_N                     => CORERESETP_0_M3_RESET_N,
        EXT_RESET_OUT                  => OPEN,
        MDDR_DDR_AXI_S_CORE_RESET_N    => CORERESETP_0_MDDR_DDR_AXI_S_CORE_RESET_N,
        FDDR_CORE_RESET_N              => OPEN,
        SDIF0_CORE_RESET_N             => OPEN,
        SDIF0_0_CORE_RESET_N           => OPEN,
        SDIF0_1_CORE_RESET_N           => OPEN,
        SDIF0_PHY_RESET_N              => OPEN,
        SDIF1_CORE_RESET_N             => OPEN,
        SDIF1_PHY_RESET_N              => OPEN,
        SDIF2_CORE_RESET_N             => OPEN,
        SDIF2_PHY_RESET_N              => OPEN,
        SDIF3_CORE_RESET_N             => OPEN,
        SDIF3_PHY_RESET_N              => OPEN,
        SDIF_RELEASED                  => OPEN,
        INIT_DONE                      => INIT_DONE_net_0 
        );
-- FABOSC_0   -   Actel:SgCore:OSC:2.0.101
FABOSC_0 : MDDR_Demo_sb_sb_FABOSC_0_OSC
    port map( 
        -- Inputs
        XTL                => GND_net, -- tied to '0' from definition
        -- Outputs
        RCOSC_25_50MHZ_CCC => FABOSC_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC,
        RCOSC_25_50MHZ_O2F => FABOSC_0_RCOSC_25_50MHZ_O2F,
        RCOSC_1MHZ_CCC     => OPEN,
        RCOSC_1MHZ_O2F     => OPEN,
        XTLOSC_CCC         => OPEN,
        XTLOSC_O2F         => OPEN 
        );
-- MDDR_Demo_sb_sb_MSS_0
MDDR_Demo_sb_sb_MSS_0 : MDDR_Demo_sb_sb_MSS
    port map( 
        -- Inputs
        MCCC_CLK_BASE          => FIC_0_CLK_net_0,
        MDDR_DQS_TMATCH_0_IN   => MDDR_DQS_TMATCH_0_IN,
        MCCC_CLK_BASE_PLL_LOCK => MSS_DDR_FIC_SUBSYSTEM_LOCK_net_0,
        MSS_RESET_N_F2M        => CORERESETP_0_RESET_N_F2M,
        MMUART_0_RXD_F2M       => MMUART_0_RXD_F2M,
        GPIO_0_F2M             => GPIO_0_F2M,
        GPIO_1_F2M             => GPIO_1_F2M,
        MDDR_DDR_CORE_RESET_N  => CORERESETP_0_MDDR_DDR_AXI_S_CORE_RESET_N,
        MDDR_DDR_AXI_S_RMW     => MDDR_AXI_S_RMW,
        MDDR_DDR_AXI_S_AWVALID => COREAXI_0_AXImslave0_AWVALID,
        MDDR_DDR_AXI_S_WLAST   => COREAXI_0_AXImslave0_WLAST,
        MDDR_DDR_AXI_S_WVALID  => COREAXI_0_AXImslave0_WVALID,
        MDDR_DDR_AXI_S_BREADY  => COREAXI_0_AXImslave0_BREADY,
        MDDR_DDR_AXI_S_ARVALID => COREAXI_0_AXImslave0_ARVALID,
        MDDR_DDR_AXI_S_RREADY  => COREAXI_0_AXImslave0_RREADY,
        FIC_0_APB_M_PREADY     => MDDR_Demo_sb_sb_MSS_TMP_0_FIC_0_APB_MASTER_PREADY,
        FIC_0_APB_M_PSLVERR    => MDDR_Demo_sb_sb_MSS_TMP_0_FIC_0_APB_MASTER_PSLVERR,
        M3_RESET_N             => CORERESETP_0_M3_RESET_N,
        MDDR_APB_S_PRESET_N    => CORECONFIGP_0_APB_S_PRESET_N,
        MDDR_APB_S_PCLK        => CORECONFIGP_0_APB_S_PCLK,
        FIC_2_APB_M_PREADY     => MDDR_Demo_sb_sb_MSS_TMP_0_FIC_2_APB_MASTER_PREADY,
        FIC_2_APB_M_PSLVERR    => MDDR_Demo_sb_sb_MSS_TMP_0_FIC_2_APB_MASTER_PSLVERR,
        MDDR_APB_S_PWRITE      => CORECONFIGP_0_MDDR_APBmslave_PWRITE,
        MDDR_APB_S_PENABLE     => CORECONFIGP_0_MDDR_APBmslave_PENABLE,
        MDDR_APB_S_PSEL        => CORECONFIGP_0_MDDR_APBmslave_PSELx,
        MDDR_DDR_AXI_S_AWID    => COREAXI_0_AXImslave0_AWID_0,
        MDDR_DDR_AXI_S_AWADDR  => COREAXI_0_AXImslave0_AWADDR,
        MDDR_DDR_AXI_S_AWLEN   => COREAXI_0_AXImslave0_AWLEN,
        MDDR_DDR_AXI_S_AWSIZE  => COREAXI_0_AXImslave0_AWSIZE_0,
        MDDR_DDR_AXI_S_AWBURST => COREAXI_0_AXImslave0_AWBURST,
        MDDR_DDR_AXI_S_AWLOCK  => COREAXI_0_AXImslave0_AWLOCK,
        MDDR_DDR_AXI_S_WID     => COREAXI_0_AXImslave0_WID_0,
        MDDR_DDR_AXI_S_WDATA   => COREAXI_0_AXImslave0_WDATA,
        MDDR_DDR_AXI_S_WSTRB   => COREAXI_0_AXImslave0_WSTRB,
        MDDR_DDR_AXI_S_ARID    => COREAXI_0_AXImslave0_ARID_0,
        MDDR_DDR_AXI_S_ARADDR  => COREAXI_0_AXImslave0_ARADDR,
        MDDR_DDR_AXI_S_ARLEN   => COREAXI_0_AXImslave0_ARLEN,
        MDDR_DDR_AXI_S_ARSIZE  => COREAXI_0_AXImslave0_ARSIZE_0,
        MDDR_DDR_AXI_S_ARBURST => COREAXI_0_AXImslave0_ARBURST,
        MDDR_DDR_AXI_S_ARLOCK  => COREAXI_0_AXImslave0_ARLOCK,
        FIC_0_APB_M_PRDATA     => MDDR_Demo_sb_sb_MSS_TMP_0_FIC_0_APB_MASTER_PRDATA,
        FIC_2_APB_M_PRDATA     => MDDR_Demo_sb_sb_MSS_TMP_0_FIC_2_APB_MASTER_PRDATA,
        MDDR_APB_S_PWDATA      => CORECONFIGP_0_MDDR_APBmslave_PWDATA_0,
        MDDR_APB_S_PADDR       => CORECONFIGP_0_MDDR_APBmslave_PADDR_0,
        -- Outputs
        MDDR_DQS_TMATCH_0_OUT  => MDDR_DQS_TMATCH_0_OUT_net_0,
        MDDR_CAS_N             => MDDR_CAS_N_net_0,
        MDDR_CLK               => MDDR_CLK_net_0,
        MDDR_CLK_N             => MDDR_CLK_N_net_0,
        MDDR_CKE               => MDDR_CKE_net_0,
        MDDR_CS_N              => MDDR_CS_N_net_0,
        MDDR_ODT               => MDDR_ODT_net_0,
        MDDR_RAS_N             => MDDR_RAS_N_net_0,
        MDDR_RESET_N           => MDDR_RESET_N_net_0,
        MDDR_WE_N              => MDDR_WE_N_net_0,
        MSS_RESET_N_M2F        => MDDR_Demo_sb_sb_MSS_TMP_0_MSS_RESET_N_M2F,
        MMUART_0_TXD_M2F       => MMUART_0_TXD_M2F_net_0,
        MDDR_DDR_AXI_S_AWREADY => COREAXI_0_AXImslave0_AWREADY,
        MDDR_DDR_AXI_S_WREADY  => COREAXI_0_AXImslave0_WREADY,
        MDDR_DDR_AXI_S_BVALID  => COREAXI_0_AXImslave0_BVALID,
        MDDR_DDR_AXI_S_ARREADY => COREAXI_0_AXImslave0_ARREADY,
        MDDR_DDR_AXI_S_RLAST   => COREAXI_0_AXImslave0_RLAST,
        MDDR_DDR_AXI_S_RVALID  => COREAXI_0_AXImslave0_RVALID,
        FIC_0_APB_M_PSEL       => MDDR_Demo_sb_sb_MSS_TMP_0_FIC_0_APB_MASTER_PSELx,
        FIC_0_APB_M_PWRITE     => MDDR_Demo_sb_sb_MSS_TMP_0_FIC_0_APB_MASTER_PWRITE,
        FIC_0_APB_M_PENABLE    => MDDR_Demo_sb_sb_MSS_TMP_0_FIC_0_APB_MASTER_PENABLE,
        FIC_2_APB_M_PRESET_N   => MDDR_Demo_sb_sb_MSS_TMP_0_FIC_2_APB_M_PRESET_N,
        FIC_2_APB_M_PCLK       => MDDR_Demo_sb_sb_MSS_TMP_0_FIC_2_APB_M_PCLK,
        FIC_2_APB_M_PWRITE     => MDDR_Demo_sb_sb_MSS_TMP_0_FIC_2_APB_MASTER_PWRITE,
        FIC_2_APB_M_PENABLE    => MDDR_Demo_sb_sb_MSS_TMP_0_FIC_2_APB_MASTER_PENABLE,
        FIC_2_APB_M_PSEL       => MDDR_Demo_sb_sb_MSS_TMP_0_FIC_2_APB_MASTER_PSELx,
        MDDR_APB_S_PREADY      => CORECONFIGP_0_MDDR_APBmslave_PREADY,
        MDDR_APB_S_PSLVERR     => CORECONFIGP_0_MDDR_APBmslave_PSLVERR,
        MDDR_ADDR              => MDDR_ADDR_net_0,
        MDDR_BA                => MDDR_BA_net_0,
        MDDR_DDR_AXI_S_BID     => COREAXI_0_AXImslave0_BID,
        MDDR_DDR_AXI_S_BRESP   => COREAXI_0_AXImslave0_BRESP,
        MDDR_DDR_AXI_S_RID     => COREAXI_0_AXImslave0_RID,
        MDDR_DDR_AXI_S_RRESP   => COREAXI_0_AXImslave0_RRESP,
        MDDR_DDR_AXI_S_RDATA   => COREAXI_0_AXImslave0_RDATA,
        FIC_0_APB_M_PADDR      => MDDR_Demo_sb_sb_MSS_TMP_0_FIC_0_APB_MASTER_PADDR,
        FIC_0_APB_M_PWDATA     => MDDR_Demo_sb_sb_MSS_TMP_0_FIC_0_APB_MASTER_PWDATA,
        FIC_2_APB_M_PADDR      => MDDR_Demo_sb_sb_MSS_TMP_0_FIC_2_APB_MASTER_PADDR,
        FIC_2_APB_M_PWDATA     => MDDR_Demo_sb_sb_MSS_TMP_0_FIC_2_APB_MASTER_PWDATA,
        MDDR_APB_S_PRDATA      => CORECONFIGP_0_MDDR_APBmslave_PRDATA,
        -- Inouts
        MDDR_DM_RDQS           => MDDR_DM_RDQS,
        MDDR_DQ                => MDDR_DQ,
        MDDR_DQS               => MDDR_DQS,
        MDDR_DQS_N             => MDDR_DQS_N 
        );
-- SYSRESET_POR
SYSRESET_POR : SYSRESET
    port map( 
        -- Inputs
        DEVRST_N         => DEVRST_N,
        -- Outputs
        POWER_ON_RESET_N => POWER_ON_RESET_N_net_0 
        );

end RTL;
