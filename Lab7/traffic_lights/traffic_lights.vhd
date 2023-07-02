library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
-- entity controlador de sem´aforo
entity traffic_lights is
	port(CLOCK, RESET, SENSOR1, SENSOR2: in std_logic;
		VP_TAMAR, VS_TAMAR, TVERM_SEG: in std_logic_vector (2 downto 0);
		VP_TVERDE, VS_TVERDE: in std_logic_vector (7 downto 0);
		VP_VERM, VP_AMAR, VP_VERDE, VS_AMAR, VS_VERM,
		VS_VERDE: out std_logic);
end traffic_lights;
-- architecture
architecture a_traffic_lights of traffic_lights is
	-- controlador principal
	component main_controller is
		port(CLOCK, RESET, SENSOR1, SENSOR2, TIMER_ALARM: in std_logic;
			START_VP_AMAR, START_VP_VERDE, START_VS_AMAR, START_VS_VERDE,
			START_VERM_SEG, VP_VERM, VP_AMAR, VP_VERDE, VS_AMAR, VS_VERM,
			VS_VERDE: out std_logic);
	end component;
	-- temporizador
	component timer is
		port (CLOCK, RESET, START_VP_AMAR, START_VP_VERDE, START_VS_AMAR,
			START_VS_VERDE, START_VERM_SEG: in std_logic;
			VP_TAMAR, VS_TAMAR,
			TVERM_SEG :in std_logic_vector (2 downto 0);
			VP_TVERDE, VS_TVERDE: in std_logic_vector (7 downto 0);
			TIMER_ALARM: out std_logic );
	end component;
	-- intermediate singal declaration
	signal START_VP_AMAR, START_VP_VERDE, START_VS_AMAR, START_VS_VERDE,
	START_VERM_SEG, TIMER_ALARM: std_logic;
	begin
		controlador_principal : main_controller
		port map(CLOCK => CLOCK,
			RESET => RESET,
			SENSOR1 => SENSOR1,
			SENSOR2 => SENSOR2,
			TIMER_ALARM => TIMER_ALARM,
			START_VP_AMAR => START_VP_AMAR,
			START_VP_VERDE => START_VP_VERDE,
			START_VS_AMAR => START_VS_AMAR,
			START_VS_VERDE => START_VS_VERDE,
			START_VERM_SEG => START_VERM_SEG,
			VP_VERM => VP_VERM,
			VP_AMAR => VP_AMAR,
			VP_VERDE => VP_VERDE,
			VS_AMAR => VS_AMAR,
			VS_VERM => VS_VERM,
			VS_VERDE => VS_VERDE);
	temporizador: timer
		port map(CLOCK => CLOCK,
			RESET => RESET,
			START_VP_AMAR => START_VP_AMAR,
			START_VP_VERDE => START_VP_VERDE,
			START_VS_AMAR => START_VS_AMAR,
			START_VS_VERDE => START_VS_VERDE,
			START_VERM_SEG => START_VERM_SEG,
			VP_TAMAR => VP_TAMAR,
			VS_TAMAR => VS_TAMAR,
			TVERM_SEG => TVERM_SEG,
			VP_TVERDE => VP_TVERDE,
			VS_TVERDE => VS_TVERDE,
			TIMER_ALARM => TIMER_ALARM);
end a_traffic_lights;
