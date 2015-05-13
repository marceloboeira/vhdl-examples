library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity ULA_tb is
end ULA_tb;
 

architecture behavior of ULA_tb is 
   component ULA
   port(A : in std_logic_vector(7 downto 0);
        B : in std_logic_vector(7 downto 0);
		  S : in std_logic_vector(1 downto 0);
        O : out std_logic_vector(7 downto 0));
   end component;
    
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');
   signal S : std_logic_vector(1 downto 0) := (others => '0');
 	signal O : std_logic_vector(7 downto 0);
   
begin
 
   uut: ULA port map(A, B, S, O);

	adding : process
	begin
		S <= "00";
		-- 0 && 0 = 0
		A <= conv_std_logic_vector(0, 8);
		B <= conv_std_logic_vector(0, 8);
		wait for 10 ns;
		
		-- 0 && 1 = 0
		A <= conv_std_logic_vector(0, 8);
		B <= conv_std_logic_vector(1, 8);
		wait for 10 ns;
		
		-- 0 && 1 = 0
		A <= conv_std_logic_vector(0, 8);
		B <= conv_std_logic_vector(1, 8);
		wait for 10 ns;
		
		-- 1 && 1 = 1
		A <= conv_std_logic_vector(1, 8);
		B <= conv_std_logic_vector(1, 8);
		wait for 10 ns;
		
		S <= "01";
		-- 0 || 0 = 0
		A <= conv_std_logic_vector(0, 8);
		B <= conv_std_logic_vector(0, 8);
		wait for 10 ns;
		
		-- 1 || 0 = 1
		A <= conv_std_logic_vector(1, 8);
		B <= conv_std_logic_vector(0, 8);
		wait for 10 ns;
		
		-- 0 || 1 = 1
		A <= conv_std_logic_vector(0, 8);
		B <= conv_std_logic_vector(1, 8);
		wait for 10 ns;
		
		-- 1 || 1 = 1
		A <= conv_std_logic_vector(1, 8);
		B <= conv_std_logic_vector(1, 8);
		wait for 10 ns;
		
		
		S <= "10";
		-- 10 + 20 = 30
		A <= conv_std_logic_vector(10, 8);
		B <= conv_std_logic_vector(20, 8);
		wait for 10 ns;
		
		-- 32 + 13 = 45
		A <= conv_std_logic_vector(32, 8);
		B <= conv_std_logic_vector(13, 8);
		wait for 10 ns;
		
		S <= "11";
		-- 30 - 20 = 10
		A <= conv_std_logic_vector(30, 8);
		B <= conv_std_logic_vector(20, 8);
		wait for 10 ns;
		
		-- 33 - 11 = 22
		A <= conv_std_logic_vector(33, 8);
		B <= conv_std_logic_vector(11, 8);
		wait for 10 ns;
		
		wait;
	end process;
end;
