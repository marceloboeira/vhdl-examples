library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pAND is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           O : out  STD_LOGIC_VECTOR (7 downto 0));
end pAND;

architecture Behavioral of pAND is
begin
  O <= A and B;
end Behavioral;

