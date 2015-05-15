library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity 1bit_adder_subtractor is
    Port ( mode : in  STD_LOGIC;
           cin : in  STD_LOGIC;
           a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           s : out  STD_LOGIC;
           cout : out  STD_LOGIC);
end 1bit_adder_subtractor;

architecture Behavioral of 1bit_adder_subtractor is

begin
  s <= (a xor b) xor cin;
  cout <= (cin and b) or ((cin or b) and (a xor mode)); 
  
end Behavioral;
