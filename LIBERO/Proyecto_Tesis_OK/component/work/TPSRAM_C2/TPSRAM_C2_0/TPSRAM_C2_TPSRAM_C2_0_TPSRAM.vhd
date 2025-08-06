-- Version: 2023.2 2023.2.0.8

library ieee;
use ieee.std_logic_1164.all;
library smartfusion2;
use smartfusion2.all;

entity TPSRAM_C2_TPSRAM_C2_0_TPSRAM is

    port( WD    : in    std_logic_vector(63 downto 0);
          RD    : out   std_logic_vector(7 downto 0);
          WADDR : in    std_logic_vector(7 downto 0);
          RADDR : in    std_logic_vector(10 downto 0);
          WEN   : in    std_logic;
          REN   : in    std_logic;
          WCLK  : in    std_logic;
          RCLK  : in    std_logic
        );

end TPSRAM_C2_TPSRAM_C2_0_TPSRAM;

architecture DEF_ARCH of TPSRAM_C2_TPSRAM_C2_0_TPSRAM is 

  component RAM1K18
    generic (MEMORYFILE:string := ""; RAMINDEX:string := "");

    port( A_DOUT        : out   std_logic_vector(17 downto 0);
          B_DOUT        : out   std_logic_vector(17 downto 0);
          BUSY          : out   std_logic;
          A_CLK         : in    std_logic := 'U';
          A_DOUT_CLK    : in    std_logic := 'U';
          A_ARST_N      : in    std_logic := 'U';
          A_DOUT_EN     : in    std_logic := 'U';
          A_BLK         : in    std_logic_vector(2 downto 0) := (others => 'U');
          A_DOUT_ARST_N : in    std_logic := 'U';
          A_DOUT_SRST_N : in    std_logic := 'U';
          A_DIN         : in    std_logic_vector(17 downto 0) := (others => 'U');
          A_ADDR        : in    std_logic_vector(13 downto 0) := (others => 'U');
          A_WEN         : in    std_logic_vector(1 downto 0) := (others => 'U');
          B_CLK         : in    std_logic := 'U';
          B_DOUT_CLK    : in    std_logic := 'U';
          B_ARST_N      : in    std_logic := 'U';
          B_DOUT_EN     : in    std_logic := 'U';
          B_BLK         : in    std_logic_vector(2 downto 0) := (others => 'U');
          B_DOUT_ARST_N : in    std_logic := 'U';
          B_DOUT_SRST_N : in    std_logic := 'U';
          B_DIN         : in    std_logic_vector(17 downto 0) := (others => 'U');
          B_ADDR        : in    std_logic_vector(13 downto 0) := (others => 'U');
          B_WEN         : in    std_logic_vector(1 downto 0) := (others => 'U');
          A_EN          : in    std_logic := 'U';
          A_DOUT_LAT    : in    std_logic := 'U';
          A_WIDTH       : in    std_logic_vector(2 downto 0) := (others => 'U');
          A_WMODE       : in    std_logic := 'U';
          B_EN          : in    std_logic := 'U';
          B_DOUT_LAT    : in    std_logic := 'U';
          B_WIDTH       : in    std_logic_vector(2 downto 0) := (others => 'U');
          B_WMODE       : in    std_logic := 'U';
          SII_LOCK      : in    std_logic := 'U'
        );
  end component;

  component GND
    port(Y : out std_logic); 
  end component;

  component VCC
    port(Y : out std_logic); 
  end component;

    signal \VCC\, \GND\, ADLIB_VCC : std_logic;
    signal GND_power_net1 : std_logic;
    signal VCC_power_net1 : std_logic;
    signal nc123, nc121, nc47, nc113, nc111, nc34, nc98, nc89, 
        nc70, nc60, nc129, nc105, nc74, nc120, nc119, nc64, nc110, 
        nc9, nc92, nc91, nc13, nc23, nc55, nc80, nc33, nc84, nc16, 
        nc26, nc45, nc73, nc58, nc63, nc27, nc17, nc127, nc99, 
        nc135, nc126, nc117, nc36, nc116, nc48, nc37, nc5, nc103, 
        nc101, nc52, nc76, nc51, nc66, nc77, nc67, nc4, nc124, 
        nc109, nc42, nc114, nc100, nc83, nc41, nc90, nc94, nc122, 
        nc112, nc86, nc59, nc25, nc15, nc87, nc133, nc131, nc35, 
        nc49, nc28, nc18, nc128, nc107, nc118, nc106, nc75, nc130, 
        nc65, nc38, nc93, nc1, nc2, nc50, nc22, nc12, nc21, nc11, 
        nc78, nc54, nc68, nc3, nc32, nc104, nc40, nc31, nc96, 
        nc44, nc7, nc97, nc85, nc72, nc6, nc71, nc62, nc61, nc125, 
        nc115, nc102, nc136, nc19, nc29, nc88, nc53, nc39, nc8, 
        nc82, nc108, nc81, nc134, nc79, nc43, nc69, nc56, nc20, 
        nc10, nc57, nc95, nc24, nc14, nc132, nc46, nc30
         : std_logic;

begin 

    \GND\ <= GND_power_net1;
    \VCC\ <= VCC_power_net1;
    ADLIB_VCC <= VCC_power_net1;

    TPSRAM_C2_TPSRAM_C2_0_TPSRAM_R0C0 : RAM1K18
      port map(A_DOUT(17) => nc123, A_DOUT(16) => nc121, 
        A_DOUT(15) => nc47, A_DOUT(14) => nc113, A_DOUT(13) => 
        nc111, A_DOUT(12) => nc34, A_DOUT(11) => nc98, A_DOUT(10)
         => nc89, A_DOUT(9) => nc70, A_DOUT(8) => nc60, A_DOUT(7)
         => nc129, A_DOUT(6) => nc105, A_DOUT(5) => nc74, 
        A_DOUT(4) => nc120, A_DOUT(3) => nc119, A_DOUT(2) => nc64, 
        A_DOUT(1) => RD(1), A_DOUT(0) => RD(0), B_DOUT(17) => 
        nc110, B_DOUT(16) => nc9, B_DOUT(15) => nc92, B_DOUT(14)
         => nc91, B_DOUT(13) => nc13, B_DOUT(12) => nc23, 
        B_DOUT(11) => nc55, B_DOUT(10) => nc80, B_DOUT(9) => nc33, 
        B_DOUT(8) => nc84, B_DOUT(7) => nc16, B_DOUT(6) => nc26, 
        B_DOUT(5) => nc45, B_DOUT(4) => nc73, B_DOUT(3) => nc58, 
        B_DOUT(2) => nc63, B_DOUT(1) => nc27, B_DOUT(0) => nc17, 
        BUSY => OPEN, A_CLK => RCLK, A_DOUT_CLK => \VCC\, 
        A_ARST_N => \VCC\, A_DOUT_EN => \VCC\, A_BLK(2) => REN, 
        A_BLK(1) => \VCC\, A_BLK(0) => \VCC\, A_DOUT_ARST_N => 
        \VCC\, A_DOUT_SRST_N => \VCC\, A_DIN(17) => \GND\, 
        A_DIN(16) => \GND\, A_DIN(15) => \GND\, A_DIN(14) => 
        \GND\, A_DIN(13) => \GND\, A_DIN(12) => \GND\, A_DIN(11)
         => \GND\, A_DIN(10) => \GND\, A_DIN(9) => \GND\, 
        A_DIN(8) => \GND\, A_DIN(7) => \GND\, A_DIN(6) => \GND\, 
        A_DIN(5) => \GND\, A_DIN(4) => \GND\, A_DIN(3) => \GND\, 
        A_DIN(2) => \GND\, A_DIN(1) => \GND\, A_DIN(0) => \GND\, 
        A_ADDR(13) => \GND\, A_ADDR(12) => \GND\, A_ADDR(11) => 
        RADDR(10), A_ADDR(10) => RADDR(9), A_ADDR(9) => RADDR(8), 
        A_ADDR(8) => RADDR(7), A_ADDR(7) => RADDR(6), A_ADDR(6)
         => RADDR(5), A_ADDR(5) => RADDR(4), A_ADDR(4) => 
        RADDR(3), A_ADDR(3) => RADDR(2), A_ADDR(2) => RADDR(1), 
        A_ADDR(1) => RADDR(0), A_ADDR(0) => \GND\, A_WEN(1) => 
        \GND\, A_WEN(0) => \GND\, B_CLK => WCLK, B_DOUT_CLK => 
        \VCC\, B_ARST_N => \VCC\, B_DOUT_EN => \VCC\, B_BLK(2)
         => WEN, B_BLK(1) => \VCC\, B_BLK(0) => \VCC\, 
        B_DOUT_ARST_N => \GND\, B_DOUT_SRST_N => \VCC\, B_DIN(17)
         => \GND\, B_DIN(16) => WD(57), B_DIN(15) => WD(56), 
        B_DIN(14) => WD(49), B_DIN(13) => WD(48), B_DIN(12) => 
        WD(41), B_DIN(11) => WD(40), B_DIN(10) => WD(33), 
        B_DIN(9) => WD(32), B_DIN(8) => \GND\, B_DIN(7) => WD(25), 
        B_DIN(6) => WD(24), B_DIN(5) => WD(17), B_DIN(4) => 
        WD(16), B_DIN(3) => WD(9), B_DIN(2) => WD(8), B_DIN(1)
         => WD(1), B_DIN(0) => WD(0), B_ADDR(13) => \GND\, 
        B_ADDR(12) => \GND\, B_ADDR(11) => WADDR(7), B_ADDR(10)
         => WADDR(6), B_ADDR(9) => WADDR(5), B_ADDR(8) => 
        WADDR(4), B_ADDR(7) => WADDR(3), B_ADDR(6) => WADDR(2), 
        B_ADDR(5) => WADDR(1), B_ADDR(4) => WADDR(0), B_ADDR(3)
         => \GND\, B_ADDR(2) => \GND\, B_ADDR(1) => \GND\, 
        B_ADDR(0) => \GND\, B_WEN(1) => \VCC\, B_WEN(0) => \VCC\, 
        A_EN => \VCC\, A_DOUT_LAT => \VCC\, A_WIDTH(2) => \GND\, 
        A_WIDTH(1) => \GND\, A_WIDTH(0) => \VCC\, A_WMODE => 
        \GND\, B_EN => \VCC\, B_DOUT_LAT => \VCC\, B_WIDTH(2) => 
        \VCC\, B_WIDTH(1) => \GND\, B_WIDTH(0) => \GND\, B_WMODE
         => \GND\, SII_LOCK => \GND\);
    
    TPSRAM_C2_TPSRAM_C2_0_TPSRAM_R0C2 : RAM1K18
      port map(A_DOUT(17) => nc127, A_DOUT(16) => nc99, 
        A_DOUT(15) => nc135, A_DOUT(14) => nc126, A_DOUT(13) => 
        nc117, A_DOUT(12) => nc36, A_DOUT(11) => nc116, 
        A_DOUT(10) => nc48, A_DOUT(9) => nc37, A_DOUT(8) => nc5, 
        A_DOUT(7) => nc103, A_DOUT(6) => nc101, A_DOUT(5) => nc52, 
        A_DOUT(4) => nc76, A_DOUT(3) => nc51, A_DOUT(2) => nc66, 
        A_DOUT(1) => RD(5), A_DOUT(0) => RD(4), B_DOUT(17) => 
        nc77, B_DOUT(16) => nc67, B_DOUT(15) => nc4, B_DOUT(14)
         => nc124, B_DOUT(13) => nc109, B_DOUT(12) => nc42, 
        B_DOUT(11) => nc114, B_DOUT(10) => nc100, B_DOUT(9) => 
        nc83, B_DOUT(8) => nc41, B_DOUT(7) => nc90, B_DOUT(6) => 
        nc94, B_DOUT(5) => nc122, B_DOUT(4) => nc112, B_DOUT(3)
         => nc86, B_DOUT(2) => nc59, B_DOUT(1) => nc25, B_DOUT(0)
         => nc15, BUSY => OPEN, A_CLK => RCLK, A_DOUT_CLK => 
        \VCC\, A_ARST_N => \VCC\, A_DOUT_EN => \VCC\, A_BLK(2)
         => REN, A_BLK(1) => \VCC\, A_BLK(0) => \VCC\, 
        A_DOUT_ARST_N => \VCC\, A_DOUT_SRST_N => \VCC\, A_DIN(17)
         => \GND\, A_DIN(16) => \GND\, A_DIN(15) => \GND\, 
        A_DIN(14) => \GND\, A_DIN(13) => \GND\, A_DIN(12) => 
        \GND\, A_DIN(11) => \GND\, A_DIN(10) => \GND\, A_DIN(9)
         => \GND\, A_DIN(8) => \GND\, A_DIN(7) => \GND\, A_DIN(6)
         => \GND\, A_DIN(5) => \GND\, A_DIN(4) => \GND\, A_DIN(3)
         => \GND\, A_DIN(2) => \GND\, A_DIN(1) => \GND\, A_DIN(0)
         => \GND\, A_ADDR(13) => \GND\, A_ADDR(12) => \GND\, 
        A_ADDR(11) => RADDR(10), A_ADDR(10) => RADDR(9), 
        A_ADDR(9) => RADDR(8), A_ADDR(8) => RADDR(7), A_ADDR(7)
         => RADDR(6), A_ADDR(6) => RADDR(5), A_ADDR(5) => 
        RADDR(4), A_ADDR(4) => RADDR(3), A_ADDR(3) => RADDR(2), 
        A_ADDR(2) => RADDR(1), A_ADDR(1) => RADDR(0), A_ADDR(0)
         => \GND\, A_WEN(1) => \GND\, A_WEN(0) => \GND\, B_CLK
         => WCLK, B_DOUT_CLK => \VCC\, B_ARST_N => \VCC\, 
        B_DOUT_EN => \VCC\, B_BLK(2) => WEN, B_BLK(1) => \VCC\, 
        B_BLK(0) => \VCC\, B_DOUT_ARST_N => \GND\, B_DOUT_SRST_N
         => \VCC\, B_DIN(17) => \GND\, B_DIN(16) => WD(61), 
        B_DIN(15) => WD(60), B_DIN(14) => WD(53), B_DIN(13) => 
        WD(52), B_DIN(12) => WD(45), B_DIN(11) => WD(44), 
        B_DIN(10) => WD(37), B_DIN(9) => WD(36), B_DIN(8) => 
        \GND\, B_DIN(7) => WD(29), B_DIN(6) => WD(28), B_DIN(5)
         => WD(21), B_DIN(4) => WD(20), B_DIN(3) => WD(13), 
        B_DIN(2) => WD(12), B_DIN(1) => WD(5), B_DIN(0) => WD(4), 
        B_ADDR(13) => \GND\, B_ADDR(12) => \GND\, B_ADDR(11) => 
        WADDR(7), B_ADDR(10) => WADDR(6), B_ADDR(9) => WADDR(5), 
        B_ADDR(8) => WADDR(4), B_ADDR(7) => WADDR(3), B_ADDR(6)
         => WADDR(2), B_ADDR(5) => WADDR(1), B_ADDR(4) => 
        WADDR(0), B_ADDR(3) => \GND\, B_ADDR(2) => \GND\, 
        B_ADDR(1) => \GND\, B_ADDR(0) => \GND\, B_WEN(1) => \VCC\, 
        B_WEN(0) => \VCC\, A_EN => \VCC\, A_DOUT_LAT => \VCC\, 
        A_WIDTH(2) => \GND\, A_WIDTH(1) => \GND\, A_WIDTH(0) => 
        \VCC\, A_WMODE => \GND\, B_EN => \VCC\, B_DOUT_LAT => 
        \VCC\, B_WIDTH(2) => \VCC\, B_WIDTH(1) => \GND\, 
        B_WIDTH(0) => \GND\, B_WMODE => \GND\, SII_LOCK => \GND\);
    
    TPSRAM_C2_TPSRAM_C2_0_TPSRAM_R0C3 : RAM1K18
      port map(A_DOUT(17) => nc87, A_DOUT(16) => nc133, 
        A_DOUT(15) => nc131, A_DOUT(14) => nc35, A_DOUT(13) => 
        nc49, A_DOUT(12) => nc28, A_DOUT(11) => nc18, A_DOUT(10)
         => nc128, A_DOUT(9) => nc107, A_DOUT(8) => nc118, 
        A_DOUT(7) => nc106, A_DOUT(6) => nc75, A_DOUT(5) => nc130, 
        A_DOUT(4) => nc65, A_DOUT(3) => nc38, A_DOUT(2) => nc93, 
        A_DOUT(1) => RD(7), A_DOUT(0) => RD(6), B_DOUT(17) => nc1, 
        B_DOUT(16) => nc2, B_DOUT(15) => nc50, B_DOUT(14) => nc22, 
        B_DOUT(13) => nc12, B_DOUT(12) => nc21, B_DOUT(11) => 
        nc11, B_DOUT(10) => nc78, B_DOUT(9) => nc54, B_DOUT(8)
         => nc68, B_DOUT(7) => nc3, B_DOUT(6) => nc32, B_DOUT(5)
         => nc104, B_DOUT(4) => nc40, B_DOUT(3) => nc31, 
        B_DOUT(2) => nc96, B_DOUT(1) => nc44, B_DOUT(0) => nc7, 
        BUSY => OPEN, A_CLK => RCLK, A_DOUT_CLK => \VCC\, 
        A_ARST_N => \VCC\, A_DOUT_EN => \VCC\, A_BLK(2) => REN, 
        A_BLK(1) => \VCC\, A_BLK(0) => \VCC\, A_DOUT_ARST_N => 
        \VCC\, A_DOUT_SRST_N => \VCC\, A_DIN(17) => \GND\, 
        A_DIN(16) => \GND\, A_DIN(15) => \GND\, A_DIN(14) => 
        \GND\, A_DIN(13) => \GND\, A_DIN(12) => \GND\, A_DIN(11)
         => \GND\, A_DIN(10) => \GND\, A_DIN(9) => \GND\, 
        A_DIN(8) => \GND\, A_DIN(7) => \GND\, A_DIN(6) => \GND\, 
        A_DIN(5) => \GND\, A_DIN(4) => \GND\, A_DIN(3) => \GND\, 
        A_DIN(2) => \GND\, A_DIN(1) => \GND\, A_DIN(0) => \GND\, 
        A_ADDR(13) => \GND\, A_ADDR(12) => \GND\, A_ADDR(11) => 
        RADDR(10), A_ADDR(10) => RADDR(9), A_ADDR(9) => RADDR(8), 
        A_ADDR(8) => RADDR(7), A_ADDR(7) => RADDR(6), A_ADDR(6)
         => RADDR(5), A_ADDR(5) => RADDR(4), A_ADDR(4) => 
        RADDR(3), A_ADDR(3) => RADDR(2), A_ADDR(2) => RADDR(1), 
        A_ADDR(1) => RADDR(0), A_ADDR(0) => \GND\, A_WEN(1) => 
        \GND\, A_WEN(0) => \GND\, B_CLK => WCLK, B_DOUT_CLK => 
        \VCC\, B_ARST_N => \VCC\, B_DOUT_EN => \VCC\, B_BLK(2)
         => WEN, B_BLK(1) => \VCC\, B_BLK(0) => \VCC\, 
        B_DOUT_ARST_N => \GND\, B_DOUT_SRST_N => \VCC\, B_DIN(17)
         => \GND\, B_DIN(16) => WD(63), B_DIN(15) => WD(62), 
        B_DIN(14) => WD(55), B_DIN(13) => WD(54), B_DIN(12) => 
        WD(47), B_DIN(11) => WD(46), B_DIN(10) => WD(39), 
        B_DIN(9) => WD(38), B_DIN(8) => \GND\, B_DIN(7) => WD(31), 
        B_DIN(6) => WD(30), B_DIN(5) => WD(23), B_DIN(4) => 
        WD(22), B_DIN(3) => WD(15), B_DIN(2) => WD(14), B_DIN(1)
         => WD(7), B_DIN(0) => WD(6), B_ADDR(13) => \GND\, 
        B_ADDR(12) => \GND\, B_ADDR(11) => WADDR(7), B_ADDR(10)
         => WADDR(6), B_ADDR(9) => WADDR(5), B_ADDR(8) => 
        WADDR(4), B_ADDR(7) => WADDR(3), B_ADDR(6) => WADDR(2), 
        B_ADDR(5) => WADDR(1), B_ADDR(4) => WADDR(0), B_ADDR(3)
         => \GND\, B_ADDR(2) => \GND\, B_ADDR(1) => \GND\, 
        B_ADDR(0) => \GND\, B_WEN(1) => \VCC\, B_WEN(0) => \VCC\, 
        A_EN => \VCC\, A_DOUT_LAT => \VCC\, A_WIDTH(2) => \GND\, 
        A_WIDTH(1) => \GND\, A_WIDTH(0) => \VCC\, A_WMODE => 
        \GND\, B_EN => \VCC\, B_DOUT_LAT => \VCC\, B_WIDTH(2) => 
        \VCC\, B_WIDTH(1) => \GND\, B_WIDTH(0) => \GND\, B_WMODE
         => \GND\, SII_LOCK => \GND\);
    
    TPSRAM_C2_TPSRAM_C2_0_TPSRAM_R0C1 : RAM1K18
      port map(A_DOUT(17) => nc97, A_DOUT(16) => nc85, A_DOUT(15)
         => nc72, A_DOUT(14) => nc6, A_DOUT(13) => nc71, 
        A_DOUT(12) => nc62, A_DOUT(11) => nc61, A_DOUT(10) => 
        nc125, A_DOUT(9) => nc115, A_DOUT(8) => nc102, A_DOUT(7)
         => nc136, A_DOUT(6) => nc19, A_DOUT(5) => nc29, 
        A_DOUT(4) => nc88, A_DOUT(3) => nc53, A_DOUT(2) => nc39, 
        A_DOUT(1) => RD(3), A_DOUT(0) => RD(2), B_DOUT(17) => nc8, 
        B_DOUT(16) => nc82, B_DOUT(15) => nc108, B_DOUT(14) => 
        nc81, B_DOUT(13) => nc134, B_DOUT(12) => nc79, B_DOUT(11)
         => nc43, B_DOUT(10) => nc69, B_DOUT(9) => nc56, 
        B_DOUT(8) => nc20, B_DOUT(7) => nc10, B_DOUT(6) => nc57, 
        B_DOUT(5) => nc95, B_DOUT(4) => nc24, B_DOUT(3) => nc14, 
        B_DOUT(2) => nc132, B_DOUT(1) => nc46, B_DOUT(0) => nc30, 
        BUSY => OPEN, A_CLK => RCLK, A_DOUT_CLK => \VCC\, 
        A_ARST_N => \VCC\, A_DOUT_EN => \VCC\, A_BLK(2) => REN, 
        A_BLK(1) => \VCC\, A_BLK(0) => \VCC\, A_DOUT_ARST_N => 
        \VCC\, A_DOUT_SRST_N => \VCC\, A_DIN(17) => \GND\, 
        A_DIN(16) => \GND\, A_DIN(15) => \GND\, A_DIN(14) => 
        \GND\, A_DIN(13) => \GND\, A_DIN(12) => \GND\, A_DIN(11)
         => \GND\, A_DIN(10) => \GND\, A_DIN(9) => \GND\, 
        A_DIN(8) => \GND\, A_DIN(7) => \GND\, A_DIN(6) => \GND\, 
        A_DIN(5) => \GND\, A_DIN(4) => \GND\, A_DIN(3) => \GND\, 
        A_DIN(2) => \GND\, A_DIN(1) => \GND\, A_DIN(0) => \GND\, 
        A_ADDR(13) => \GND\, A_ADDR(12) => \GND\, A_ADDR(11) => 
        RADDR(10), A_ADDR(10) => RADDR(9), A_ADDR(9) => RADDR(8), 
        A_ADDR(8) => RADDR(7), A_ADDR(7) => RADDR(6), A_ADDR(6)
         => RADDR(5), A_ADDR(5) => RADDR(4), A_ADDR(4) => 
        RADDR(3), A_ADDR(3) => RADDR(2), A_ADDR(2) => RADDR(1), 
        A_ADDR(1) => RADDR(0), A_ADDR(0) => \GND\, A_WEN(1) => 
        \GND\, A_WEN(0) => \GND\, B_CLK => WCLK, B_DOUT_CLK => 
        \VCC\, B_ARST_N => \VCC\, B_DOUT_EN => \VCC\, B_BLK(2)
         => WEN, B_BLK(1) => \VCC\, B_BLK(0) => \VCC\, 
        B_DOUT_ARST_N => \GND\, B_DOUT_SRST_N => \VCC\, B_DIN(17)
         => \GND\, B_DIN(16) => WD(59), B_DIN(15) => WD(58), 
        B_DIN(14) => WD(51), B_DIN(13) => WD(50), B_DIN(12) => 
        WD(43), B_DIN(11) => WD(42), B_DIN(10) => WD(35), 
        B_DIN(9) => WD(34), B_DIN(8) => \GND\, B_DIN(7) => WD(27), 
        B_DIN(6) => WD(26), B_DIN(5) => WD(19), B_DIN(4) => 
        WD(18), B_DIN(3) => WD(11), B_DIN(2) => WD(10), B_DIN(1)
         => WD(3), B_DIN(0) => WD(2), B_ADDR(13) => \GND\, 
        B_ADDR(12) => \GND\, B_ADDR(11) => WADDR(7), B_ADDR(10)
         => WADDR(6), B_ADDR(9) => WADDR(5), B_ADDR(8) => 
        WADDR(4), B_ADDR(7) => WADDR(3), B_ADDR(6) => WADDR(2), 
        B_ADDR(5) => WADDR(1), B_ADDR(4) => WADDR(0), B_ADDR(3)
         => \GND\, B_ADDR(2) => \GND\, B_ADDR(1) => \GND\, 
        B_ADDR(0) => \GND\, B_WEN(1) => \VCC\, B_WEN(0) => \VCC\, 
        A_EN => \VCC\, A_DOUT_LAT => \VCC\, A_WIDTH(2) => \GND\, 
        A_WIDTH(1) => \GND\, A_WIDTH(0) => \VCC\, A_WMODE => 
        \GND\, B_EN => \VCC\, B_DOUT_LAT => \VCC\, B_WIDTH(2) => 
        \VCC\, B_WIDTH(1) => \GND\, B_WIDTH(0) => \GND\, B_WMODE
         => \GND\, SII_LOCK => \GND\);
    
    GND_power_inst1 : GND
      port map( Y => GND_power_net1);

    VCC_power_inst1 : VCC
      port map( Y => VCC_power_net1);


end DEF_ARCH; 
