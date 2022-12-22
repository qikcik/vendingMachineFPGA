library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Disp4x7Seg_Types.all;
use work.VendingMachine_Types.all;

entity Entry_VendingMachine is
	port (
		in_clk_50mhz			: in std_logic;
		
		in_keys 					: in std_logic_vector(3 downto 0);

		out_buzzer 				: out std_logic							:= '0';		
		out_leds 				: out std_logic_vector(3 downto 0) 	:= (others => '0');
		
		out_7seg 				: out std_logic_vector(7 downto 0) 	:= (others => '0');
		out_7segDigitSelect 	: out std_logic_vector(3 downto 0) 	:= (others => '0')
	);
end Entry_VendingMachine;

architecture behaviour of Entry_VendingMachine is

	component Disp4x7Seg is
		port (
			in_clk					: in std_logic;
			
			in_7seg 					: in Array4x7Seg;
			
			out_7seg 				: out std_logic_vector(7 downto 0) 	:= (others => '0');
			out_7segDigitSelect 	: out std_logic_vector(3 downto 0) 	:= (others => '0')
		);
	end component;
	
	
	component SingleClkKey is
	port (
		in_clk					: in std_logic;
		
		in_key 					: in std_logic;
		out_key 					: out std_logic
	);
	end component;
	
	component VendingMachine is
	generic (
		switchState_delay 	: integer := 8;
		productPrices			: TProductPriceArray := (X"25",X"09",X"32")
	);
	port (
		in_clk					: in std_logic;
		
		in_keys 					: in std_logic_vector(3 downto 0);

		out_state 				: out TVendingMachine_State	:= TVendingMachine_State_Initial;		
		out_display 	 		: out Array4x7Seg := (CONST7SEG_EMPTY,CONST7SEG_EMPTY,CONST7SEG_EMPTY,CONST7SEG_EMPTY)
	);
	end component;
	
	signal clk_divider 	: std_logic_vector(25 downto 0) := (others => '0'); -- 50mhz/(2^26) ~= 0.75hz
	
	signal state 			: TVendingMachine_State := TVendingMachine_State_Initial;
	signal display 	 	: Array4x7Seg := (CONST7SEG_EMPTY,CONST7SEG_EMPTY,CONST7SEG_EMPTY,CONST7SEG_EMPTY);
	signal keys 			: std_logic_vector(3 downto 0);

begin

	c_clk_divider: process(in_clk_50mhz) 
	begin
		if rising_edge(in_clk_50mhz) then
			clk_divider <= std_logic_vector(unsigned(clk_divider) + 1);
		end if;
	end process;
	
	c_vendingMachine: VendingMachine port map
	(
		in_clk					=> clk_divider(16),
		
		in_keys 					=> keys,

		out_state 				=> state,		
		out_display 	 		=> display
	);
	

	c_k1: SingleClkKey port map
	(
		in_clk					=> clk_divider(16),
		in_key 					=> in_keys(0),
		out_key 					=>	keys(0)
	);
	c_k2: SingleClkKey port map
	(
		in_clk					=> clk_divider(16),
		in_key 					=> in_keys(1),
		out_key 					=>	keys(1)
	);
	c_k3: SingleClkKey port map
	(
		in_clk					=> clk_divider(16),
		in_key 					=> in_keys(2),
		out_key 					=>	keys(2)
	);
	c_k4: SingleClkKey port map
	(
		in_clk					=> clk_divider(16),
		in_key 					=> in_keys(3),
		out_key 					=>	keys(3)
	);

	c_disp4x7seg: Disp4x7Seg port map
	(
		in_clk					=> clk_divider(15),
		
		in_7seg					=> display,
		
		out_7seg 				=> out_7seg,
		out_7segDigitSelect 	=> out_7segDigitSelect
	);
end behaviour;

