-- DFF_Debouncing_Button.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity DFF_Debouncing_Button is
port(
 clk: in std_logic;
 clock_enable: in std_logic;
 D: in std_logic;
 Q: out std_logic:='0'
);
end DFF_Debouncing_Button;
architecture Behavioral of DFF_Debouncing_Button is
begin
process(clk)
begin
 if(rising_edge(clk)) then
  if(clock_enable='1') then
   Q <= D;
  end if;
 end if;
end process;
end Behavioral;