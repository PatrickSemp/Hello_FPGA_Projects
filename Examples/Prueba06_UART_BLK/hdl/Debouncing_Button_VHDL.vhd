--------------------------------------------------------------------------------
-- Company: <Universidad de las Fuerzas Armadas ESPE>
--
-- File: Debouncing_Button_VHDL.vhd
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
-- Author: <Pedro Sanchez>
--
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Debouncing_Button_VHDL is
port(
 button: in std_logic;
 clk: in std_logic;
 debounced_button: out std_logic
);
end Debouncing_Button_VHDL;
architecture Behavioral of Debouncing_Button_VHDL is
signal slow_clk_enable: std_logic;
signal Q1,Q2,Q2_bar,Q0: std_logic;
begin

clock_enable_generator: entity work.clock_enable_debouncing_button PORT MAP 
      ( clk => clk,
        slow_clk_enable => slow_clk_enable
      );
Debouncing_FF0: entity work.DFF_Debouncing_Button PORT MAP 
      ( clk => clk,
        clock_enable => slow_clk_enable,
        D => button,
        Q => Q0
      ); 

Debouncing_FF1: entity work.DFF_Debouncing_Button PORT MAP 
      ( clk => clk,
        clock_enable => slow_clk_enable,
        D => Q0,
        Q => Q1
      );      
 debounced_button <= Q1 and Q0;
end Behavioral;
