library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 
use std.env.finish;

use work.Disp4x7Seg_Types.all;
use work.VendingMachine_Types.all;

entity VendingMachine_TB is
end VendingMachine_TB;

architecture behaviour of VendingMachine_TB is

	component VendingMachine is
	generic (
		switchState_delay 		: integer := 8;
		productPrices			: TProductPriceArray := (X"25",X"09",X"32")
	);
	port (
		in_clk					: in std_logic;
		
		in_keys 				: in std_logic_vector(3 downto 0);

		out_state 				: out TVendingMachine_State	:= TVendingMachine_State_Initial;		
		out_display 	 		: out Array4x7Seg := (CONST7SEG_EMPTY,CONST7SEG_EMPTY,CONST7SEG_EMPTY,CONST7SEG_EMPTY)
	);
	end component;
	
	
	signal clk		: std_logic := '1';
		
	signal keys 	: std_logic_vector(3 downto 0) := "0000";

	signal state 	: TVendingMachine_State;		
	signal display 	: Array4x7Seg;

begin
	c_sut: VendingMachine 
		generic map
		(
			switchState_delay => 1
		)
		port map
		(
			in_clk		=> clk,
			
			in_keys 	=> keys,
	
			out_state 	=> state,		
			out_display => display
		);
	
	clk <= not clk after 10ns;
		
	simulation: process
	begin
		--120ns change state
		
		-- TC:1 canel on select payment
			wait for 1000 ns;
			assert state = TVendingMachine_State_SelectProduct report "TC:1, state should be TVendingMachine_State_SelectProduct" severity failure;
				
			keys <= "1000"; --select 1 produkt
			wait for 20 ns;
			keys <= "0001"; --accept
			wait for 20 ns;
			keys <= "0000";
			
			wait for 100 ns; --coldown
			assert state = TVendingMachine_State_SelectPaymentMethod report "TC:1, state should be TVendingMachine_State_SelectPaymentMethod" severity failure;
			
			keys <= "0010"; --cancel payment
			wait for 20 ns;
			keys <= "0000";
			
			wait for 100 ns; --coldown
			assert state = TVendingMachine_State_Cancel report "TC:1, state should be TVendingMachine_State_Cancel" severity failure;
		
		-- TC:2 canel on pay by card
			wait for 1000 ns;
			assert state = TVendingMachine_State_SelectProduct report "TC:2, state should be TVendingMachine_State_SelectProduct" severity failure;
				
			keys <= "1000"; --select 1 produkt
			wait for 20 ns;
			keys <= "0001"; --accept
			wait for 20 ns;
			keys <= "0000";
			
			wait for 100 ns; --coldown
			assert state = TVendingMachine_State_SelectPaymentMethod report "TC:2, state should be TVendingMachine_State_SelectPaymentMethod" severity failure;
			
			keys <= "0100"; --pay by card
			wait for 20 ns;
			keys <= "0000";
			
			wait for 100 ns; --coldown
			
			keys <= "0001"; --accept
			wait for 20 ns;
			keys <= "0000";
			
			wait for 100 ns; --coldown
			assert state = TVendingMachine_State_PayByCard report "TC:2, state should be TVendingMachine_State_PayByCard" severity failure;
			
			keys <= "0010"; --cancel
			wait for 20 ns;
			keys <= "0000";
			
			wait for 100 ns; --coldown
			assert state = TVendingMachine_State_Cancel report "TC:2, state should be TVendingMachine_State_Cancel" severity failure;
			
			
		-- TC:3 buy pying by card
			wait for 1000 ns;
			assert state = TVendingMachine_State_SelectProduct report "TC:3, state should be TVendingMachine_State_SelectProduct" severity failure;
				
			keys <= "1000"; --select 1 produkt
			wait for 20 ns;
			keys <= "0001"; --accept
			wait for 20 ns;
			keys <= "0000";
			
			wait for 100 ns; --coldown
			assert state = TVendingMachine_State_SelectPaymentMethod report "TC:3, state should be TVendingMachine_State_SelectPaymentMethod" severity failure;
			
			keys <= "0100"; --pay by card
			wait for 20 ns;
			keys <= "0000";
			
			wait for 100 ns; --coldown
			
			keys <= "0001"; --accept
			wait for 20 ns;
			keys <= "0000";
			
			wait for 100 ns; --coldown
			assert state = TVendingMachine_State_PayByCard report "TC:3, state should be TVendingMachine_State_PayByCard" severity failure;
			
			keys <= "0001"; --accept
			wait for 20 ns;
			keys <= "0000";
			
			wait for 100 ns; --coldown
			assert state = TVendingMachine_State_ReleaseProduct report "TC:3, state should be TVendingMachine_State_ReleaseProduct" severity failure;
			
			
			
		--TC:4 cancel during paying by cash
			wait for 1000 ns;
			assert state = TVendingMachine_State_SelectProduct report "TC:4, state should be TVendingMachine_State_SelectProduct" severity failure;
				
			keys <= "1000"; --select 1 produkt
			wait for 20 ns;
			keys <= "0001"; --accept
			wait for 20 ns;
			keys <= "0000";
			
			wait for 100 ns; --coldown
			assert state = TVendingMachine_State_SelectPaymentMethod report "TC:4, state should be TVendingMachine_State_SelectPaymentMethod" severity failure;
			
			keys <= "1000"; --pay by cash
			wait for 20 ns;
			keys <= "0000";
			
			wait for 100 ns; --coldown
			
			keys <= "0001"; --accept
			wait for 20 ns;
			keys <= "0000";
			
			wait for 100 ns; --coldown
			assert state = TVendingMachine_State_PayByCash report "TC:4, state should be TVendingMachine_State_PayByCash" severity failure;
			
			keys <= "0001"; --cancel
			wait for 20 ns;
			keys <= "0000";
			
			wait for 100 ns; --coldown
			assert state = TVendingMachine_State_PayByCash_Cancel report "TC:4, state should be TVendingMachine_State_PayByCash_Cancel" severity failure;
			
			wait for 50 ns; --coldown
			assert state = TVendingMachine_State_Cancel report "TC:4, state should be TVendingMachine_State_Cancel" severity failure;
			
			
		--TC:5 buy by cash
			wait for 1000 ns;
			assert state = TVendingMachine_State_SelectProduct report "TC:5, state should be TVendingMachine_State_SelectProduct" severity failure;
				
			keys <= "1000"; --select 1 produkt
			wait for 20 ns;
			keys <= "0001"; --accept
			wait for 20 ns;
			keys <= "0000";
			
			wait for 100 ns; --coldown
			assert state = TVendingMachine_State_SelectPaymentMethod report "TC:5, state should be TVendingMachine_State_SelectPaymentMethod" severity failure;
			
			keys <= "1000"; --pay by cash
			wait for 20 ns;
			keys <= "0000";
			
			wait for 100 ns; --coldown
			
			keys <= "0001"; --accept
			wait for 20 ns;
			keys <= "0000";
			
			wait for 100 ns; --coldown
			assert state = TVendingMachine_State_PayByCash report "TC:5, state should be TVendingMachine_State_PayByCash" severity failure;
				
			keys <= "1000"; --insert coin 10
			wait for 20 ns;
			keys <= "0000";
			wait for 100 ns;
			keys <= "1000"; --insert coin 10
			wait for 20 ns;
			keys <= "0000";
			wait for 100 ns;
			keys <= "1000"; --insert coin 10
			wait for 20 ns;
			keys <= "0000";	
			wait for 100 ns;
			keys <= "1000"; --insert coin 10
			wait for 20 ns;
			keys <= "0000";	
			
			wait for 100 ns;
			--wait for 100 ns; --coldown
			assert state = VendingMachine_State_PayByCash_Success report "TC:5, state should be VendingMachine_State_PayByCash_Success" severity failure;
			assert display = (CONST7SEG_r xor CONST7SEG_DOT,CONST7SEG_EMPTY,CONST7SEG_0 xor CONST7SEG_DOT,CONST7SEG_E) report "TC:5, display should have valid rest" severity failure;	
			
			
			wait for 50 ns; --coldown
			assert state = TVendingMachine_State_ReleaseProduct report "TC:4, state should be TVendingMachine_State_ReleaseProduct" severity failure;
		

		wait for 200 ns;	
		finish;
			
	end process simulation;
	
end behaviour;

