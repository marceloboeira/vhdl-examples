library ieee;
use ieee.std_logic_1164.all;
 
entity ULA_tb is
end ULA_tb;
 
architecture behavior of ULA_tb is 
   component ULA
   port(A : in  std_logic_vector(7 downto 0);
        B : in  std_logic_vector(7 downto 0);
        Sel : in std_logic_vector(1 downto 0);
        O : out  std_logic_vector(7 downto 0));
   end component;
    
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');
   signal Sel : std_logic_vector(1 downto 0) := (others => '0');
 	signal O : std_logic_vector(7 downto 0);
   
begin
 
   uut: ULA port map(A => A,
							B => B,
							Sel => Sel,
							O => O );

	control : process
	begin
		A <= 10;
		B <= 20;
		Sel <= 0;
		wait for 15 ns;
		
		A <= 170;
		B <= 170;
		Sel <= 0;
		wait for 15 ns;

		wait;
		
	end process;

END;
