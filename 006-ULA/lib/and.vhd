library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AND_PROCESS is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           O : out  STD_LOGIC_VECTOR (7 downto 0));
end AND_PROCESS;

architecture Behavioral of AND_PROCESS is

begin
  O <= A and B;
end Behavioral;

