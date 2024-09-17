--
-- Synopsys
-- Vhdl wrapper for top level design, written on Mon May 13 12:44:12 2024
--
library ieee;
use ieee.std_logic_1164.all;

entity wrapper_for_Top_SEND is
   port (
      BTN_MSS_IN : in std_logic;
      BTN_RST_IN : in std_logic;
      PAD : out std_logic;
      PAD_0 : out std_logic;
      TX : out std_logic
   );
end wrapper_for_Top_SEND;

architecture rtl of wrapper_for_Top_SEND is

component Top_SEND
 port (
   BTN_MSS_IN : in std_logic;
   BTN_RST_IN : in std_logic;
   PAD : out std_logic;
   PAD_0 : out std_logic;
   TX : out std_logic
 );
end component;

signal tmp_BTN_MSS_IN : std_logic;
signal tmp_BTN_RST_IN : std_logic;
signal tmp_PAD : std_logic;
signal tmp_PAD_0 : std_logic;
signal tmp_TX : std_logic;

begin

tmp_BTN_MSS_IN <= BTN_MSS_IN;

tmp_BTN_RST_IN <= BTN_RST_IN;

PAD <= tmp_PAD;

PAD_0 <= tmp_PAD_0;

TX <= tmp_TX;



u1:   Top_SEND port map (
		BTN_MSS_IN => tmp_BTN_MSS_IN,
		BTN_RST_IN => tmp_BTN_RST_IN,
		PAD => tmp_PAD,
		PAD_0 => tmp_PAD_0,
		TX => tmp_TX
       );
end rtl;
