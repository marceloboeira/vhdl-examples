library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

entity PARITY_PROCESS is
Port (A : in STD_LOGIC;
    B : in STD_LOGIC;
    O : out STD_LOGIC);
     
end PARITY_PROCESS;

architecture Behavioral of PARITY_PROCESS is
begin
  O <= A xor B;
end Behavioral;
