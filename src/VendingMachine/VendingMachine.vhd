library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Disp4x7Seg_Types.all;
use work.VendingMachine_Types.all;

entity VendingMachine is
	generic (
		switchState_delay 	: integer := 8;
		productPrices			: TProductPriceArray := (X"25",X"09",X"32")
	);
	port (
		in_clk					: in std_logic;
		
		in_keys 				: in std_logic_vector(3 downto 0);

		out_state 				: out TVendingMachine_State	:= TVendingMachine_State_Initial;		
		out_display 	 		: out Array4x7Seg := (CONST7SEG_EMPTY,CONST7SEG_EMPTY,CONST7SEG_EMPTY,CONST7SEG_EMPTY)
	);
end VendingMachine;

architecture behaviour of VendingMachine is
	signal currentState		: TVendingMachine_State := TVendingMachine_State_Initial;
	signal nextState			: TVendingMachine_State := TVendingMachine_State_Initial;
	
	signal selectedProduct			: std_logic_vector(1 downto 0) := "00";
	signal selectedProductPrice	: std_logic_vector(7 downto 0) := "00000000";
	
	signal PayByCard					: std_logic := '0';
	
	signal paidMoney					: std_logic_vector(7 downto 0) := "00000000";
	signal rest							: std_logic_vector(7 downto 0) := "00000000";
	
	signal nextState_delay	: std_logic_vector(switchState_delay-1 downto 0) := (others=>'0');
	constant nextState_delay_max : std_logic_vector(switchState_delay-1 downto 0) := (others=>'1');
begin 

	out_state <= currentState;

	selectedProductPrice <= productPrices(2) when selectedProduct = "11" 
							 else productPrices(1) when selectedProduct = "10"
							 else productPrices(0) when selectedProduct = "01" 
							 else "00000000";
							 
	rest <= std_logic_vector( unsigned(paidMoney) - unsigned(selectedProductPrice) );
	
	logic: process(all) 
	begin
		if rising_edge(in_clk) then
		if currentState = nextState then
			--FSM
			case currentState is
			
				when TVendingMachine_State_Initial =>
					-- logic
					nextState <= TVendingMachine_State_SelectProduct;
					selectedProduct 	<= (others=>'0');
					PayByCard			<= '0';
					PaidMoney			<= (others=>'0');
					nextState_delay		<= (others=>'0');
					-- display
					out_display <= (CONST7SEG_1,CONST7SEG_n,CONST7SEG_1,CONST7SEG_t);
					
				when TVendingMachine_State_SelectProduct =>
					-- input
					case in_keys is
						when "0001" =>
							if selectedProduct /= "00" then
								nextState <= TVendingMachine_State_SelectPaymentMethod;
							end if;
						when "0010" => selectedProduct <= "11";
						when "0100" => selectedProduct <= "10";
						when "1000" => selectedProduct <= "01";
						when others => null;
					end case;
					-- display
					if selectedProduct = "00" then
						out_display <= (CONST7SEG_S,CONST7SEG_l,CONST7SEG_c,CONST7SEG_t);
					else
						out_display(3) <= BinTo7SegHex( B"00"&selectedProduct(1 downto 0) ) xor CONST7SEG_DOT;
						out_display(2) <= CONST7SEG_EMPTY;
						out_display(1) <= BinTo7SegHex( selectedProductPrice(7 downto 4) ) xor CONST7SEG_DOT;
						out_display(0) <= BinTo7SegHex( selectedProductPrice(3 downto 0) );
					end if;
			

					
				when TVendingMachine_State_SelectPaymentMethod =>
					--input
					case in_keys is
						when "0001" => 
							if PayByCard then
								nextState <= TVendingMachine_State_PayByCard;
							else
								nextState <= TVendingMachine_State_PayByCash;
							end if;
						when "0010" => nextState <= TVendingMachine_State_Cancel;
						when "0100" => PayByCard <= '1';
						when "1000" => PayByCard <= '0';
						when others => null;
					end case;
					--display
					if PayByCard  then
						out_display <= (CONST7SEG_C,CONST7SEG_A,CONST7SEG_r,CONST7SEG_d);
					else
						out_display <= (CONST7SEG_C,CONST7SEG_A,CONST7SEG_S,CONST7SEG_H);
					end if;
			
					
					
				when TVendingMachine_State_PayByCard =>
					--input
					case in_keys is
						when "0001" => nextState <= TVendingMachine_State_ReleaseProduct;
						when "0000" => null;
						when others => nextState <= TVendingMachine_State_Cancel;
					end case;
					--display
					out_display <= (CONST7SEG_R,CONST7SEG_E,CONST7SEG_D,CONST7SEG_Y);

					
				when TVendingMachine_State_PayByCash =>
					--input
					case in_keys is
						when "0001" => nextState <= TVendingMachine_State_PayByCash_Cancel;
						when "1000" => paidMoney <= std_logic_vector(unsigned(paidMoney) + X"10");
						when "0100" => paidMoney <= std_logic_vector(unsigned(paidMoney) + X"08");
						when "0010" => paidMoney <= std_logic_vector(unsigned(paidMoney) + X"01");
						when others => null;
					end case;
					--logic
					if unsigned(paidMoney) >= unsigned(selectedProductPrice) then
						nextState <= VendingMachine_State_PayByCash_Success;
					end if;
					--display
					out_display(3) <= CONST7SEG_P xor CONST7SEG_DOT;
					out_display(2) <= CONST7SEG_EMPTY;
					out_display(1) <= BinTo7SegHex( paidMoney(7 downto 4) ) xor CONST7SEG_DOT;
					out_display(0) <= BinTo7SegHex( paidMoney(3 downto 0) );
					
					
				when VendingMachine_State_PayByCash_Success =>
					--logic
					nextState <= TVendingMachine_State_ReleaseProduct;
					--display
					out_display(3) <= CONST7SEG_r xor CONST7SEG_DOT;
					out_display(2) <= CONST7SEG_EMPTY;
					out_display(1) <= BinTo7SegHex( rest(7 downto 4) ) xor CONST7SEG_DOT;
					out_display(0) <= BinTo7SegHex( rest(3 downto 0) );
					
				when TVendingMachine_State_PayByCash_Cancel =>
					--logic
					nextState <= TVendingMachine_State_Cancel;
					--display
					out_display(3) <= CONST7SEG_r xor CONST7SEG_DOT;
					out_display(2) <= CONST7SEG_EMPTY;
					out_display(1) <= BinTo7SegHex( paidMoney(7 downto 4) ) xor CONST7SEG_DOT;
					out_display(0) <= BinTo7SegHex( paidMoney(3 downto 0) );
					
				
				when TVendingMachine_State_ReleaseProduct =>
					--logic
					nextState <= TVendingMachine_State_Initial;
					--display
					out_display <= (CONST7SEG_d,CONST7SEG_r,CONST7SEG_0,CONST7SEG_P);
				
				when TVendingMachine_State_Cancel =>
					--logic
					nextState <= TVendingMachine_State_Initial;
					--display
					out_display <= (CONST7SEG_C,CONST7SEG_n,CONST7SEG_c,CONST7SEG_l);
				
				when TVendingMachine_State_Error =>
					--logic
					nextState <= TVendingMachine_State_Initial;
					--display
					out_display <= (CONST7SEG_E,CONST7SEG_r,CONST7SEG_o,CONST7SEG_r);
				
				when others =>
					nextState <= TVendingMachine_State_Error;
					
			end case;
		else
			-- delay change state, simplest, stupid way to keep display longer
			nextState_delay <= std_logic_vector(unsigned(nextState_delay)+1);
			if nextState_delay = nextState_delay_max then
				nextState_delay <= (others=>'0');
				currentState <= nextState;
			end if;
		end if;
		end if;
	end process;
end behaviour;

