--------------------------------------------------------------------------------
-- Company: Universidad de las Fuerzas Armadas ESPE
--
-- File: COMPARADOR.vhd
-- File history:
--      Rev1: 2/1/2024: Create hardware to show if the 3 data are different  

--
-- Description: 
--
-- <Description here>
--
-- Targeted device: <Family::SmartFusion2> <Die::M2S010> <Package::256 VF>
-- Author: PEDRO SANCHEZ
--
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity COMPARADOR is
generic (
    width_data: natural:=32
);
port (
    --Inputs
    CLK     : IN std_logic;
    REN     : IN std_logic;
	A_in    : IN  std_logic_vector(width_data-1 downto 0);
    B_in    : IN  std_logic_vector(width_data-1 downto 0);
    C_in    : IN  std_logic_vector(width_data-1 downto 0); 
    --Outputs
    --reg_pipeline: OUT std_logic;
    error   : OUT std_logic:='0'
    
);
end COMPARADOR;
architecture architecture_COMPARADOR of COMPARADOR is
signal X,Y,Z: integer range 0 to 2**(width_data-1);
signal er_sg: std_logic:='0';
--type fsm_type is (ReadySt,DiffSt,SameSt,SndSt);
--signal fsm:fsm_type:=ReadySt;
begin
--============================================================
--AVISO DE ERRORES
--============================================================
X<=to_integer(unsigned(A_in));
Y<=to_integer(unsigned(B_in));
Z<=to_integer(unsigned(C_in));
--error<=er_sg;

process(CLK,X,Y,Z)
begin 
    if(rising_edge(CLK))then 
        if (X/=Y and Y/=Z and X/=Z)then 
            error   <=  '1';
        else
            error   <=  '0';
        end if;
    end if;
end process;

end architecture_COMPARADOR;

--process(CLK, REN )
--begin 
    --if(REN='1' AND rising_edge(CLK))then 
            --X<=to_integer(unsigned(A_in));
            --Y<=to_integer(unsigned(B_in));
            --Z<=to_integer(unsigned(C_in));
            --if (X/=Y and Y/=Z and X/=Z)then 
                --er_sg   <=  '1';
            --else
                --er_sg   <=  '0';
            --end if;
--
    --end if;
--end process;
--error<=er_sg;
/*
*/