library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_PROCESS is
    Port (A : in  STD_LOGIC_VECTOR (7 downto 0);
          B : in  STD_LOGIC_VECTOR (7 downto 0);
          C : in  STD_LOGIC_VECTOR (7 downto 0);
          D : in  STD_LOGIC_VECTOR (7 downto 0);
          S : in  STD_LOGIC_VECTOR (1 downto 0);
          O : out  STD_LOGIC_VECTOR (7 downto 0));
end MUX_PROCESS;

architecture Behavioral of MUX_PROCESS is

begin
	process (A, B, C, D, S)
	begin
		case S is
			when "00" => O <= A;
			when "01" => O <= B;
			when "10" => O <= C;
			when "11" => O <= D;
			when others=> O <= "00000000";
		end case;
	end process;
end Behavioral;

