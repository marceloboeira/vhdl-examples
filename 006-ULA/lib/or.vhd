
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pOR is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           O : out  STD_LOGIC_VECTOR (7 downto 0));
end pOR;

architecture Behavioral of pOR is

begin
	O <= A or B;
end Behavioral;

