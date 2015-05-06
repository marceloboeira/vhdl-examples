library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

entity SUBTRACTER_PROCESS is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           O : out  STD_LOGIC_VECTOR (7 downto 0));
end SUBTRACTER_PROCESS;

architecture Behavioral of SUBTRACTER_PROCESS is

begin
  O <= A - B;
end Behavioral;

