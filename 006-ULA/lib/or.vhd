
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OR_PROCESS is
    Port (A : in  STD_LOGIC_VECTOR (7 downto 0);
          B : in  STD_LOGIC_VECTOR (7 downto 0);
          O : out  STD_LOGIC_VECTOR (7 downto 0));
end OR_PROCESS;

architecture Behavioral of OR_PROCESS is

begin
	O <= A or B;
end Behavioral;

