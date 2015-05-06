library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

entity ADDER_PROCESS is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           O : out  STD_LOGIC_VECTOR (7 downto 0));
end ADDER_PROCESS;

architecture Behavioral of ADDER_PROCESS is

begin
  O <= A + B;
end Behavioral;

