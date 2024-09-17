--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: clock_enable_debouncing_button.vhd
-- File history:
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--
-- Description: 
--
-- <Description here>
--
-- Targeted device: <Family::SmartFusion2> <Die::M2S010> <Package::256 VF>
-- Author: <Name>
--
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
entity clock_enable_debouncing_button is
port(
 clk: in std_logic; -- input clock on FPGA 100Mhz
                           -- Change counter threshold accordingly
 slow_clk_enable: out std_logic
);
end clock_enable_debouncing_button;
architecture Behavioral of clock_enable_debouncing_button is
signal counter: std_logic_vector(27 downto 0):=(others => '0');
begin
process(clk)
begin
if(rising_edge(clk)) then
  counter <= counter + x"0000001"; 
  if(counter>=x"003D08F") then -- reduce this number for simulation
   counter <=  (others => '0');
  end if;
 end if;
end process;
 slow_clk_enable <= '1' when counter=x"003D08F" else '0'; -- reduce this number for simulation
end Behavioral;