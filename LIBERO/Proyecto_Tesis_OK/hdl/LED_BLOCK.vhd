
library IEEE;

use IEEE.std_logic_1164.all;

entity LED_BLOCK is
port (
    CLK         : in std_logic;
    start_auto  : in std_logic;
    AUTO_ON     : out std_logic
);
end LED_BLOCK;
architecture architecture_LED_BLOCK of LED_BLOCK is
--FOR BLINK LED
constant max_count      : integer := 160000000;
signal count            : integer range 0 to max_count:=0; 
signal LED_state        : std_logic:='0';
begin

   --================================================
-- BLINK LED WHEN START AUTO BLOCK
--================================================
process(CLK,start_auto)
begin
    if(start_auto='0')then
        LED_state<='0';
        count<=0;
    elsif(rising_edge(CLK))then
        if count < max_count then 
				count <= count+1;
			else
				LED_state   <= not LED_state;
				count       <= 0;
			end if;
    end if;
end process;
AUTO_ON<=not(LED_state);
end architecture_LED_BLOCK;
