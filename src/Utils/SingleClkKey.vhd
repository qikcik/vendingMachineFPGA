library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Disp4x7Seg_Types.all;

entity SingleClkKey is
	port (
		in_clk					: in std_logic;
		
		in_key 					: in std_logic;
		out_key 					: out std_logic
	);
end SingleClkKey;

architecture behaviour of SingleClkKey is
	signal mem : std_logic := '0';
begin 
	process(in_clk)
	begin
		if rising_edge(in_clk) then
			if in_key = '1' then
				if mem = '1' then
					out_key <= '0';
				else
					out_key <= '1';
					mem <= '1';
				end if;		
			else
				out_key <= '0';
				mem <= '0';
			end if;
		end if;
	end process;
	
end behaviour;

