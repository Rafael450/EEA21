-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
-- entity timer
entity timer is
port (CLOCK, RESET, START_VP_AMAR, START_VP_VERDE, START_VS_AMAR,
	START_VS_VERDE, START_VERM_SEG: in std_logic;
	VP_TAMAR, VS_TAMAR, TVERM_SEG: in std_logic_vector (2 downto 0);
	VP_TVERDE, VS_TVERDE: in std_logic_vector (7 downto 0);
	TIMER_ALARM: out std_logic );
end timer;

architecture a_timer of timer is
	signal t_cnt: unsigned(7 downto 0); -- internal counter sign
begin
	process(CLOCK, RESET)
	begin
		if(RESET = '1') then
			t_cnt <= (others => '0');
			-- Esta ´e uma forma compactar de fazer t_cnt <= "00000000".
		elsif(rising_edge(CLOCK)) then
			if(START_VP_AMAR = '1' and START_VERM_SEG = '0' and
			START_VS_VERDE = '0' and START_VS_AMAR = '0' and
			START_VP_VERDE = '0') then
				t_cnt <= "00000" & unsigned(VP_TAMAR);
			elsif(START_VP_AMAR = '0' and START_VERM_SEG = '1' and
			START_VS_VERDE = '0' and START_VS_AMAR = '0' and
			START_VP_VERDE = '0') then
				t_cnt <= "00000" & unsigned(TVERM_SEG);
			elsif(START_VP_AMAR = '0' and START_VERM_SEG = '0' and
			START_VS_VERDE = '1' and START_VS_AMAR = '0' and
			START_VP_VERDE = '0') then
				t_cnt <= unsigned(VS_TVERDE);
			elsif(START_VP_AMAR = '0' and START_VERM_SEG = '0' and
			START_VS_VERDE = '0' and START_VS_AMAR = '1' and
			START_VP_VERDE = '0') then
				t_cnt <= "00000" & unsigned(VS_TAMAR);
			elsif(START_VP_AMAR = '0' and START_VERM_SEG = '0' and
			START_VS_VERDE = '0' and START_VS_AMAR = '0' and
			START_VP_VERDE = '1') then
				t_cnt <= unsigned(VP_TVERDE);
			else
				t_cnt <= t_cnt - 1;
			end if;
		end if;
		if(t_cnt = 1) then
			TIMER_ALARM <= '1';
		else
			TIMER_ALARM <= '0';
		end if;
	end process;
end a_timer;