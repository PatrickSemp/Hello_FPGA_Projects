--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: MUX2TO1.vhd
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

use IEEE.std_logic_1164.all;

entity MUX2TO1 is
    Port ( 
        Input_0     : in STD_LOGIC;
        Input_1     : in STD_LOGIC;
        Sel         : in STD_LOGIC;
        Output      : out STD_LOGIC
    );
end MUX2TO1;
architecture architecture_MUX2TO1 of MUX2TO1 is

begin
    process (Sel, Input_0, Input_1)
    begin
        if Sel = '0' then
            Output <= Input_0;
        else
            Output <= Input_1;
        end if;
    end process;
end architecture_MUX2TO1;
