library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Sandbox is
	port (
		in_clk_50mhz			: in std_logic;
		
		in_keys 					: in std_logic_vector(3 downto 0);

		out_buzzer 				: out std_logic							:= '0';		
		out_leds 				: out std_logic_vector(3 downto 0) 	:= (others => '0');
		
		out_7seg 				: out std_logic_vector(7 downto 0) 	:= (others => '0');
		out_7segDigitSelect 	: out std_logic_vector(3 downto 0) 	:= (others => '0')
	);
end Sandbox;

architecture behaviour of Sandbox is
	signal clk_counter : std_logic_vector(24 downto 0) := (others => '0'); -- 50mhz/25 ~= 1.5hz
	
	signal helper :  std_logic := '0';
begin 
	
	process(in_clk_50mhz) 
	begin
		if rising_edge(in_clk_50mhz) then
			clk_counter <= std_logic_vector(unsigned(clk_counter) + 1);
		end if;
	end process;
	
	process(clk_counter(24)) 
	begin
		if rising_edge(clk_counter(24)) then
			out_leds(0) <= '1';
			out_leds(0) <= '0';
			
			out_leds(1) <= '1';
			out_leds(1) <= '0';
			
			out_leds(2) <= '1';
			out_leds(2) <= '0';
			
			
			out_leds(3) <= '1';
			out_leds(3) <= '1';
			--helper <= not helper;
		end if;
	end process;
	
	--out_leds(0)  <= helper;
	
	
	
	
end behaviour;

