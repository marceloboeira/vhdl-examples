
library ieee;
use ieee.std_logic_1164.all;

entity PARITY_ANALYSER is
	 generic (N : integer := 4);
    port (A : in  std_logic_vector (N-1 downto 0);
          S : out  std_logic);
end PARITY_ANALYSER;

architecture Behavioral of PARITY_ANALYSER is
	signal C : std_logic_vector (N downto 0);
	
begin
	C(0) <= '0';
	loop_for: for i in 0 to N - 1 generate 
		parity : entity work.PARITY_PROCESS
			port map (C(i), A(i), C(i+1));
	end generate;
	S <= C(N);
end Behavioral;

