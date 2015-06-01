LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
entity hex2bcd is
port ( CLK : in std_logic;
 
--PUSH BUTTONS PIN ASSIGNMENT
--SWITCH PIN ASSIGNMENT 
sw0 :in std_logic_vector(3 downto 0);
sw1 :in std_logic_vector(3 downto 0);
sw2 :in std_logic_vector(3 downto 0);
sw3 :in std_logic_vector(3 downto 0);
--YOU COULD HAVE ALSO WRITTEN 
-- sw: in std_logic_vector(17 downto 0);
--   that would have worked too. But I did another project, SO I just kept it like that. Quartus is a pain in the butt when assigning pin. Its so time consuming and stupid :P
 
 
bcd0:out std_logic_vector(3 downto 0);
bcd1:out std_logic_vector(3 downto 0);
bcd2:out std_logic_vector(3 downto 0);
bcd3:out std_logic_vector(3 downto 0));
 
end hex2bcd;
 
architecture behavior of hex2bcd is
begin
 
--You cannot have variables here
my_proc: process (CLK)
--Variable assignment
variable random: std_logic_vector(15 downto 0) := "0000000000000000"; --16 BITS 
 
variable one: std_logic_vector(3 downto 0) := "0000";
variable ten: std_logic_vector(3 downto 0) := "0000";
variable hund: std_logic_vector(3 downto 0) := "0000";
variable thou: std_logic_vector(3 downto 0) := "0000";
variable tthou: std_logic_vector(3 downto 0) := "0000";
variable hthou: std_logic_vector(3 downto 0) := "0000";
 
begin
--ON RISING EDGE OF CLOCK, DO THIS FUNCTION
if (rising_edge(CLK)) then
 
			random := sw3 & sw2 & sw1 & sw0;
 
			for i in 0 to 15 loop
			--CHECKING IF THE NUMBER IS GREATER OR EQUAL TO 5
			-- IF YES, THEN ADD 3
			-- NOTE: THIS IS NOT THE MOST EFFICIENT WAY TO DO IT. But who cares :P!
			if (hthou >= "0101") then 
			hthou := std_logic_vector (unsigned(hthou) +3);
			end if;
 
			if (tthou >= "0101") then 
			tthou := std_logic_vector (unsigned(tthou) +3);
			end if;
 
			if (thou >= "0101") then 
			thou := std_logic_vector (unsigned(thou) +3);
			end if;
 
			if (hund >= "0101") then 
			hund := std_logic_vector (unsigned(hund) +3);
			end if;
 
			if (ten >= "0101") then 
			ten := std_logic_vector (unsigned(ten) +3);
			end if;
 
 			if (one >= "0101") then 
			one := std_logic_vector (unsigned(one) +3);
			end if;		
 
		-- HERE I AM DOING THE SHIFTING WORK
			hthou := hthou(2 downto 0) & tthou(3);
			tthou := tthou(2 downto 0) & thou(3);
			thou := thou(2 downto 0)& hund(3);
			hund := hund(2 downto 0)& ten(3);
			ten := ten(2 downto 0)& one(3);
			one := one(2 downto 0)& random(15);
			random := std_logic_vector(unsigned(random) sll 1);
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
