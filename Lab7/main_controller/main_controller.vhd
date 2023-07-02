-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;
-- entity controlador principal
entity main_controller is
	port(CLOCK, RESET, SENSOR1, SENSOR2, TIMER_ALARM: in std_logic;
	START_VP_AMAR, START_VP_VERDE, START_VS_AMAR, START_VS_VERDE,
	START_VERM_SEG, VP_VERM, VP_AMAR, VP_VERDE, VS_AMAR, VS_VERM,
	VS_VERDE: out std_logic);
end main_controller;
architecture a_main_controller of main_controller is
	type state_type is (A, B, C, D, E, F, G);
	signal PS, NS: state_type;
begin
	sync_proc: process (CLOCK, NS, RESET)
	begin
		if (RESET = '1') then
			PS <= A;
		elsif (rising_edge(CLOCK)) then
			PS <= NS;
		end if;
	end process sync_proc;


	comb_proc: process(PS, SENSOR1, SENSOR2, TIMER_ALARM)
	begin
		-- pre-assign outputs
		VP_VERM <= '0';
		VP_AMAR <= '0';
		VP_VERDE <= '1';
		VS_AMAR <= '0';
		VS_VERM <= '1';
		VS_VERDE <= '0';
		START_VP_AMAR <= '0';
		START_VP_VERDE <= '0';
		START_VS_AMAR <= '0';
		START_VS_VERDE <= '0';
		START_VERM_SEG <= '0';
		case PS is
			when A =>
				START_VP_AMAR <= '0';
				START_VP_VERDE <= '0';
				START_VS_AMAR <= '0';
				START_VS_VERDE <= '0';
				START_VERM_SEG <= '0';
				VP_VERM <= '0';
				VP_AMAR <= '0';
				VP_VERDE <= '1';
				VS_AMAR <= '0';
				VS_VERM <= '1';
				VS_VERDE <= '0';
				if (SENSOR1 = '1' or SENSOR2 = '1') then
					START_VP_AMAR <= '1';
					START_VP_VERDE <= '0';
					START_VS_AMAR <= '0';
					START_VS_VERDE <= '0';
					START_VERM_SEG <= '0';
					NS <= B;
				else NS <= A;
				end if;
			when B =>
				START_VP_AMAR <= '0';
				START_VP_VERDE <= '0';
				START_VS_AMAR <= '0';
				START_VS_VERDE <= '0';
				START_VERM_SEG <= '0';
				VP_VERM <= '0';
				VP_AMAR <= '1';
				VP_VERDE <= '0';
				VS_AMAR <= '0';
				VS_VERM <= '1';
				VS_VERDE <= '0';
				if(TIMER_ALARM = '1') then
					START_VP_AMAR <= '0';
					START_VP_VERDE <= '0';
					START_VS_AMAR <= '0';
					START_VS_VERDE <= '0';
					START_VERM_SEG <= '1';
					NS <= C;
				else NS <= B;
				end if;
			when C =>
				START_VP_AMAR <= '0';
				START_VP_VERDE <= '0';
				START_VS_AMAR <= '0';
				START_VS_VERDE <= '0';
				START_VERM_SEG <= '0';
				VP_VERM <= '1';
				VP_AMAR <= '0';
				VP_VERDE <= '0';
				VS_AMAR <= '1';
				VS_VERM <= '0';
				VS_VERDE <= '0';
				if(TIMER_ALARM = '1') then
					START_VP_AMAR <= '0';
					START_VP_VERDE <= '0';
					START_VS_AMAR <= '0';
					START_VS_VERDE <= '1';
					START_VERM_SEG <= '0';
					NS <= D;
				else NS <= C;
				end if;
			when D =>
				START_VP_AMAR <= '0';
				START_VP_VERDE <= '0';
				START_VS_AMAR <= '0';
				START_VS_VERDE <= '0';
				START_VERM_SEG <= '0';
				VP_VERM <= '1';
				VP_AMAR <= '0';
				VP_VERDE <= '0';
				VS_AMAR <= '0';
				VS_VERM <= '1';
				VS_VERDE <= '0';
				if(TIMER_ALARM = '1') then
					START_VP_AMAR <= '0';
					START_VP_VERDE <= '0';
					START_VS_AMAR <= '1';
					START_VS_VERDE <= '0';
					START_VERM_SEG <= '0';
					NS <= E;
				else NS <= D;
				end if;
			when E =>
				START_VP_AMAR <= '0';
				START_VP_VERDE <= '0';
				START_VS_AMAR <= '0';
				START_VS_VERDE <= '0';
				START_VERM_SEG <= '0';
				VP_VERM <= '1';
				VP_AMAR <= '0';
				VP_VERDE <= '0';
				VS_AMAR <= '1';
				VS_VERM <= '0';
				VS_VERDE <= '0';
				if(TIMER_ALARM = '1') then
					START_VP_AMAR <= '0';
					START_VP_VERDE <= '0';
					START_VS_AMAR <= '0';
					START_VS_VERDE <= '0';
					START_VERM_SEG <= '1';
					NS <= F;
				else NS <= E;
				end if;
			when F =>
				START_VP_AMAR <= '0';
				START_VP_VERDE <= '0';
				START_VS_AMAR <= '0';
				START_VS_VERDE <= '0';
				START_VERM_SEG <= '0';
				VP_VERM <= '1';
				VP_AMAR <= '0';
				VP_VERDE <= '0';
				VS_AMAR <= '0';
				VS_VERM <= '1';
				VS_VERDE <= '0';
				if(TIMER_ALARM = '1') then
					START_VP_AMAR <= '0';
					START_VP_VERDE <= '1';
					START_VS_AMAR <= '0';
					START_VS_VERDE <= '0';
					START_VERM_SEG <= '0';
					NS <= G;
				else NS <= F;
				end if;
			when G =>
				START_VP_AMAR <= '0';
				START_VP_VERDE <= '0';
				START_VS_AMAR <= '0';
				START_VS_VERDE <= '0';
				START_VERM_SEG <= '0';
				VP_VERM <= '0';
				VP_AMAR <= '1';
				VP_VERDE <= '1';
				VS_AMAR <= '0';
				VS_VERM <= '1';
				VS_VERDE <= '0';
				if(TIMER_ALARM = '1') then
					START_VP_AMAR <= '0';
					START_VP_VERDE <= '0';
					START_VS_AMAR <= '0';
					START_VS_VERDE <= '0';
					START_VERM_SEG <= '0';
					NS <= A;
				else NS <= G;
				end if;
			when others =>
				START_VP_AMAR <= '0';
				START_VP_VERDE <= '0';
				START_VS_AMAR <= '0';
				START_VS_VERDE <= '0';
				START_VERM_SEG <= '0';
				VP_VERM <= '0';
				VP_AMAR <= '0';
				VP_VERDE <= '1';
				VS_AMAR <= '0';
				VS_VERM <= '1';
				VS_VERDE <= '0';
				NS <= A;
		end case;
	end process comb_proc;
end a_main_controller;