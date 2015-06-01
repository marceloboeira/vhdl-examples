library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity HexToBCD is
  port (CLK: in STD_LOGIC;
        sw0: in STD_LOGIC_VECTOR(3 downto 0);
        sw1: in STD_LOGIC_VECTOR(3 downto 0);
        sw2: in STD_LOGIC_VECTOR(3 downto 0);
        sw3: in STD_LOGIC_VECTOR(3 downto 0);
        bcd0: out STD_LOGIC_VECTOR(3 downto 0);
        bcd1: out STD_LOGIC_VECTOR(3 downto 0);
        bcd2: out STD_LOGIC_VECTOR(3 downto 0);
        bcd3: out STD_LOGIC_VECTOR(3 downto 0));
end HexToBCD;
 
architecture behavior of HexToBCD is
begin
 
my_proc: process (CLK)
variable random: STD_LOGIC_VECTOR(15 downto 0) := "0000000000000000"; 
variable one: STD_LOGIC_VECTOR(3 downto 0) := "0000";
variable ten: STD_LOGIC_VECTOR(3 downto 0) := "0000";
variable hund: STD_LOGIC_VECTOR(3 downto 0) := "0000";
variable thou: STD_LOGIC_VECTOR(3 downto 0) := "0000";
variable tthou: STD_LOGIC_VECTOR(3 downto 0) := "0000";
variable hthou: STD_LOGIC_VECTOR(3 downto 0) := "0000";
 
begin
if (rising_edge(CLK)) then
      random := sw3 & sw2 & sw1 & sw0;
      for i in 0 to 15 loop
        if (hthou >= "0101") then 
        hthou := STD_LOGIC_VECTOR (unsigned(hthou) +3);
        end if;

        if (tthou >= "0101") then 
        tthou := STD_LOGIC_VECTOR (unsigned(tthou) +3);
        end if;

        if (thou >= "0101") then 
        thou := STD_LOGIC_VECTOR (unsigned(thou) +3);
        end if;

        if (hund >= "0101") then 
        hund := STD_LOGIC_VECTOR (unsigned(hund) +3);
        end if;

        if (ten >= "0101") then 
        ten := STD_LOGIC_VECTOR (unsigned(ten) +3);
        end if;

        if (one >= "0101") then 
        one := STD_LOGIC_VECTOR (unsigned(one) +3);
        end if;

        hthou := hthou(2 downto 0) & tthou(3);
        tthou := tthou(2 downto 0) & thou(3);
        thou := thou(2 downto 0)& hund(3);
        hund := hund(2 downto 0)& ten(3);
        ten := ten(2 downto 0)& one(3);
        one := one(2 downto 0)& random(15);
        random := STD_LOGIC_VECTOR(unsigned(random) sll 1);
      end loop;

      bcd0 <= one;
      bcd1 <= ten;
      bcd2 <= hund;
      bcd3 <= thou;

      one := "0000";
      ten:= "0000";
      hund := "0000";
      thou := "0000";
      tthou:= "0000";
      hthou:= "0000";       
  end if;
end process ;

end behavior;
