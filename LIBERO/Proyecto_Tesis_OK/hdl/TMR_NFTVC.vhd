--------------------------------------------------------------------------------
-- Company: Universidad de las Fuerzas Armadas ESPE
--
-- File: TMR_NFTVC.vhd
-- File history:
--      Rev1: <Date>: First attempt to TMR_NFTVC
--      Rev2: 2/1/2024: Create hardware to show if the 3 data are different  
--      <Revision number>: <Date>: <Comments>
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

library smartfusion2;
use smartfusion2.all;

entity TMR_NFTVC is
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
    --error   : OUT std_logic:='0';
    V       : OUT std_logic_vector(width_data-1 downto 0):=(others=>'0')  
);
end TMR_NFTVC;
architecture architecture_TMR_NFTVC of TMR_NFTVC is
    --==================================================================== 
--              Component declarations
--==================================================================== 
component MUX2TO1 is
    Port ( 
        Input_0     : in STD_LOGIC;
        Input_1     : in STD_LOGIC;
        Sel         : in STD_LOGIC;
        Output      : out STD_LOGIC
    );
end component;

--=============================================================
--  SIGNALS
--=============================================================
signal S1   :std_logic_vector(width_data-1 downto 0):=(others=>'0');
signal S2   :std_logic_vector(width_data-1 downto 0):=(others=>'0');
signal O_pe :std_logic_vector(width_data-1 downto 0):=(others=>'0');

begin
--============================================================
--CORRECCION DE ERRORES
--============================================================
    S1<= (A_in xor B_in);
    S2<= (B_in xor C_in);
    O_pe<= S1 and (not S2);
    
    MX:for I in  0 to width_data-1 generate
        XV: MUX2TO1 port map (A_in(I),C_in(I),O_pe(I),V(I));
    end generate;
end architecture_TMR_NFTVC;
--============================================================
--AVISO DE ERRORES
--============================================================
--error   <=  '1' when  ((unsigned(A_in) /= unsigned(B_in))and(unsigned(B_in)/= unsigned(C_in))and(unsigned(A_in) /= unsigned(C_in)))else 
                --'0';
--process(REN,CLK,A_in,B_in,C_in)
--begin 
    --if(REN='1' and rising_edge(CLK))then            
        --X<=to_integer(unsigned(A_in));
        --Y<=to_integer(unsigned(B_in));
        --Z<=to_integer(unsigned(C_in));
        --if (X/=Y and Y/=Z and X/=Z)then 
            --error   <=  '1';
        --else
            --error   <=  '0';
        --end if;
    --end if;
--end process;

    --error   <=  '1' when  (to_integer(unsigned(A_in)) /= to_integer(unsigned(B_in))and                           to_integer(unsigned(B_in)) /= to_integer(unsigned(C_in))and                           to_integer(unsigned(A_in)) /= to_integer(unsigned(C_in)))else 
                --'0';
                ----de 10 errores inyectados 8 error  
                
--
    --S3<= (A_in xor C_in);
    --OS10:OR4 port map(S1(0),S1(1),S1(2),S1(3),OR_S1(0));
    --OS11:OR4 port map(S1(4),S1(5),S1(6),S1(7),OR_S1(1));
    --OS1: OR2 port map(OR_S1(0),OR_S1(1),e_S1);
    --
    --OS20:OR4 port map(S2(0),S2(1),S2(2),S2(3),OR_S2(0));
    --OS21:OR4 port map(S2(4),S2(5),S2(6),S2(7),OR_S2(1));
    --OS2: OR2 port map(OR_S2(0),OR_S2(1),e_S2);
--
    --OS30:OR4 port map(S3(0),S3(1),S3(2),S3(3),OR_S3(0));
    --OS31:OR4 port map(S3(4),S3(5),S3(6),S3(7),OR_S3(1));
    --OS3: OR2 port map(OR_S3(0),OR_S3(1),e_S3);
    --
    --ER: AND3 port map(e_S1,e_S2,e_S3, error);
    --3 MALOS
    --error<=e_S1 and e_S2 and e_S3;
    --
    --Otra Alternativa
    --process(S1)
    --begin
    --e_S1 <= '1' when (S1(0) or S1(1) or S1(2) or S1(3) or
                            --S1(4) or S1(5) or S1(6) or S1(7)) = '1' else '0';
    --end process;
    --process(S2)
    --begin
    --e_S2<= '1' when (S2(0) or S2(1) or S2(2) or S2(3) or
                            --S2(4) or S2(5) or S2(6) or S2(7)) = '1' else '0';
    --end process;
    --process(S3)
    --begin
    --e_S3<= '1' when (S3(0) or S3(1) or S3(2) or S3(3) or
                            --S3(4) or S3(5) or S3(6) or S3(7)) = '1' else '0';
    --end process;
    --error <= '1' when (A_in /= B_in) and (B_in /= C_in) and (A_in /= C_in) else '0';
    --3 MALOS
    --D,F,G
    --SUMA ARITMETICA DE CADA VECTOR 
    --2 O 3, Solo en caso de los 3 salir.
    --bit de validacion en una memoria.
    --