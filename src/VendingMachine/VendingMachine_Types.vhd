library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package VendingMachine_Types is

	type TVendingMachine_State is (
		TVendingMachine_State_Initial,
	
		TVendingMachine_State_SelectProduct,
		TVendingMachine_State_SelectPaymentMethod,
			TVendingMachine_State_PayByCard,
			TVendingMachine_State_PayByCash,
				VendingMachine_State_PayByCash_Success,
				TVendingMachine_State_PayByCash_Cancel,
				
		TVendingMachine_State_ReleaseProduct,
		TVendingMachine_State_Cancel,
		
		TVendingMachine_State_Error
	);
	
	type TProductPriceArray is array(2 downto 0) of  std_logic_vector(7 downto 0);
	
end package VendingMachine_Types;