
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity btn_ledbar is
    Port ( 
      btn : in  STD_LOGIC;
      reset : in STD_LOGIC;
      ledA : out  STD_LOGIC_VECTOR (7 downto 0)
    );
end btn_ledbar;

architecture Behavioral of btn_ledbar is
  -- Signals
  signal amount: integer range 0 to 80;
begin

p1: process (btn, reset)
  -- variable ...
begin
   if reset='1' then   
      amount <= 0;
   elsif (btn'event and btn='1') then 
      amount <= amount + 1;
   end if;
end process;

p2: process (amount)
begin
  
  if amount >=10 then
    ledA(0) <= '1';
    if amount >=20 then
      ledA(1) <= '1';
      if amount >=30 then
        ledA(2) <= '1';
        if amount >=40 then
          ledA(3) <= '1';
          if amount >=50 then
            ledA(4) <= '1';
            if amount >=60 then
              ledA(5) <= '1';
              if amount >=70 then
                ledA(6) <= '1';
                if amount >=80 then
                  ledA(7) <= '1';
                end if;
              end if;
            end if;
          end if;
        end if;
      end if;
    end if;
  else
    LEDS <= "00000000"; 
  end if;
end process;
end Behavioral;

