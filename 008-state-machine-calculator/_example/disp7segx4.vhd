----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:13:01 06/13/2012 
-- Design Name: 
-- Module Name:    disp7segx4 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_arith.all;
USE ieee.numeric_std.ALL;

entity disp7segx4 is
    Port ( 	entrada 				: in  STD_LOGIC_VECTOR (15 downto 0);
				clock					: in std_logic;
				clk_1k				: out std_logic;
				reset					: in std_logic;
				saida_8segmentos 	: out  STD_LOGIC_VECTOR (7 downto 0);
--				disp_sel_i 			: in  STD_LOGIC_VECTOR (3 downto 0);
				disp_sel_o 			: out  STD_LOGIC_VECTOR (3 downto 0));
end disp7segx4;

architecture Behavioral of disp7segx4 is
	type vetor_de_std_logic_vector is array (3 downto 0) of std_logic_vector (7 downto 0);
	type vetor_de_10_std_logic_vector is array (9 downto 0) of std_logic_vector (7 downto 0);
	signal display : vetor_de_std_logic_vector; 
	signal cont : integer range 0 to 3 := 0;
	signal disp_sel : std_logic_vector (3 downto 0) := "1110";
	signal clk_1k_sgn : std_logic:='0';
	signal clock_1k : integer range 0 to 26000 :=0;
begin

clock_div : process (reset, clock)
begin
	if reset = '1' then
		clock_1k <= 0;
	elsif clock'event and clock ='1' then
		if(clock_1k > 25000) then
			clk_1k_sgn <= not clk_1k_sgn;
			clock_1k <= 0;
		else
			clock_1k <= clock_1k +1;
		end if;
	else
		clock_1k <= clock_1k;
	end if;
end process;

 

	process (clk_1k_sgn, reset)
	begin
		if reset = '1' then
			disp_sel <= "1110";
			cont <= 0; 
		elsif clk_1k_sgn'event and clk_1k_sgn = '1' then
			disp_sel(3 downto 1) <= disp_sel(2 downto 0);
			disp_sel(0) <= disp_sel(3);
			cont <= cont +1;
		else
			disp_sel <= disp_sel;
			cont <= cont;		
		end if;
	end process;

disp_sel_o <= disp_sel;

laco_for : for i in 0 to 3 generate 
display1 : entity work.disp7seg
port map ( entrada => entrada((i+1)*4 -1 downto i*4),
				clock => clock,
				reset => reset,
				saida_8segmentos => display(i));

saida_8segmentos <= display(cont REM 4);
end generate;

clk_1k <= clk_1k_sgn;

end Behavioral;
