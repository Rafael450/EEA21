-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;

-- Celula basica
-- entity
entity celula_basica is
	port ( A_i, B_i, M, C_i_1 : in  std_logic;
			                  S : in  std_logic_vector ( 1 downto 0);
					     F_i, C_i : out std_logic);
end celula_basica;

-- architecture
architecture basic of celula_basica is
	 signal A_out, B_out, C_out, D_out, E_out, F_out : std_logic;
begin 
	A_out <= C_i_1 and M;
	B_out <= B_i and S(1);
	C_out <= A_out xor B_out;
	D_out <= A_i xor S(0);
	E_out <= C_out and D_out;
	F_out <= A_out and B_out;
	  F_i <= C_out xor D_out;
	  C_i <= E_out or F_out;
end basic;

-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;

-- entity

entity Lab5 is
port ( 		 A : in  std_logic_vector (7 downto 0);
				 B : in  std_logic_vector (7 downto 0);
				 S : in  std_logic_vector (1 downto 0);
		 M, C_in : in  std_logic;
			C_out : out std_logic;
			    F : out std_logic_vector (7 downto 0));
end Lab5;
 
architecture behavioral of Lab5 is
    component celula_basica is
        port ( A_i, B_i, M, C_i_1 : in  std_logic;
               S : in  std_logic_vector ( 1 downto 0);
               F_i, C_i : out std_logic);
    end component;
	 signal C : std_logic_vector (7 downto 0);
begin
	 CELULA_1 : celula_basica
        port map (A_i => A(0), B_i => B(0), M => M, C_i_1 => C_in, S => S, F_i => F(0), C_i => C(1));
	 CELULA_2 : celula_basica
        port map (A_i => A(1), B_i => B(1), M => M, C_i_1 => C(1), S => S, F_i => F(1), C_i => C(2));
	 CELULA_3 : celula_basica
        port map (A_i => A(2), B_i => B(2), M => M, C_i_1 => C(2), S => S, F_i => F(2), C_i => C(3));
	 CELULA_4 : celula_basica
        port map (A_i => A(3), B_i => B(3), M => M, C_i_1 => C(3), S => S, F_i => F(3), C_i => C(4));
	 CELULA_5 : celula_basica
        port map (A_i => A(4), B_i => B(4), M => M, C_i_1 => C(4), S => S, F_i => F(4), C_i => C(5));
	 CELULA_6 : celula_basica
        port map (A_i => A(5), B_i => B(5), M => M, C_i_1 => C(5), S => S, F_i => F(5), C_i => C(6));
	 CELULA_7 : celula_basica
        port map (A_i => A(6), B_i => B(6), M => M, C_i_1 => C(6), S => S, F_i => F(6), C_i => C(7));
	 CELULA_8 : celula_basica
        port map (A_i => A(7), B_i => B(7), M => M, C_i_1 => C(7), S => S, F_i => F(7), C_i => C_out);
end behavioral;