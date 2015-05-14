
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
 
entity parity_analyser_tb is
end parity_analyser_tb;
 
architecture behavior of parity_analyser_tb is
 
    component PARITY_ANALYSER
    port(A : in  std_logic_vector(3 downto 0);
         S : out  std_logic);
    end component;
    
	signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal S : std_logic;
   
begin
   uut: PARITY_ANALYSER port map (A, S);
 
   stim_proc: process
   begin		
		
		test:
		for i in 0 to 3 loop
			A <= conv_std_logic_vector(i, 4);
			wait for 10 ns;
		end loop test;
		
      wait;
   end process;

END;
