library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Disp4x7Seg_Types.all;

entity Disp4x7Seg is
	port (
		in_clk					: in std_logic;
		
		in_7seg 					: in Array4x7Seg;
		
		out_7seg 				: out std_logic_vector(7 downto 0) 	:= (others => '0');
		out_7segDigitSelect 	: out std_logic_vector(3 downto 0) 	:= (others => '0')
	);
end Disp4x7Seg;

architecture behaviour of Disp4x7Seg is
	signal digitSelect : unsigned(1 downto 0) := to_unsigned(0,2);
begin 
	process(in_clk)
	begin
		if rising_edge(in_clk) then
			case digitSelect is
				when "00" => out_7seg <= in_7seg(0);
				when "01" => out_7seg <= in_7seg(1);
				when "10" => out_7seg <= in_7seg(2);
				when "11" => out_7seg <= in_7seg(3);
			end case;
			
			case digitSelect is
				when "00" => out_7segDigitSelect <= "0001";
				when "01" => out_7segDigitSelect <= "0010";
				when "10" => out_7segDigitSelect <= "0100";
				when "11" => out_7segDigitSelect <= "1000";
			end case;
			
			digitSelect <= digitSelect + 1;
		end if;
	end process;
	
end behaviour;

