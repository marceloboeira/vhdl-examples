library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ULA is
    Port (A : in  STD_LOGIC_VECTOR (7 downto 0);
          B : in  STD_LOGIC_VECTOR (7 downto 0);
          S : in  STD_LOGIC_VECTOR (1 downto 0);
          O : out  STD_LOGIC_VECTOR (7 downto 0));
end ULA;

architecture Behavioral of ULA is

	signal and_link : STD_LOGIC_VECTOR (7 downto 0);
	signal or_link : STD_LOGIC_VECTOR (7 downto 0);
	signal sum_link : STD_LOGIC_VECTOR (7 downto 0);
	signal sub_link : STD_LOGIC_VECTOR (7 downto 0);

begin

	AND_P : entity work.AND_PROCESS
		port map (A, B, and_link);

	OR_P : entity work.OR_PROCESS
		port map (A, B, or_link);

	ADDER_P : entity work.ADDER_PROCESS
		port map (A, B, sum_link);

	SUBTRACTER_P : entity work.SUBTRACTER_PROCESS
		port map (A, B, sub_link);
						
	MUX_P : entity work.MUX_PROCESS
		port map (and_link, or_link, add_link, sub_link, S, O);

end Behavioral;

