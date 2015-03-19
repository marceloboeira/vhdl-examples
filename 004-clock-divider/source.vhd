library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clock_div is
    Port ( clock_50m : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           led : out  STD_LOGIC);
end clock_div;

architecture Behavioral of clock_div is
		signal counter : integer range 0 to 25000 := 0;
		signal led_tmp : STD_LOGIC := '0';
begin

process (clock_50m, reset)
begin
	if reset='1' then   
      led <= '0'; -- '0' -> Binary
		counter <= 0; -- 0 -> Decimal
   elsif (clock_50m'event and clock_50m='1') then 
      
		if (counter < 25000) then 
			counter <= counter + 1;
		else 
			counter <= 0;
			led_tmp <= not led_tmp;
		end if;
		
   end if;
end process;

led <= led_tmp;

end Behavioral;

