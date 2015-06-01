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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;


entity disp7seg is
    Port ( 	entrada 				: in  STD_LOGIC_VECTOR (3 downto 0);
				clock					: in std_logic;
				reset					: in std_logic;
				saida_8segmentos 	: out  STD_LOGIC_VECTOR (7 downto 0));
end disp7seg;

architecture Behavioral of disp7seg is

	type vetor_de_10_std_logic_vector is array (0 to 15) of std_logic_vector (0 to 7);
	constant tabela_disp7seg : vetor_de_10_std_logic_vector := (("00000011"),("10011111"),("00100101"),("00001101"),("10011001"),("01001001"),("01000001"),("00011111"),("00000001"),("00001001"),("00010011"),("11000001"),("01100011"),("10000101"),("01100001"),("01110001"));	
--	      																		  abcdefgx
begin

	process (clock, reset)
	begin
		if reset = '1' then
			saida_8segmentos <= "11111111"; -- apaga tudo
		elsif clock'event and clock = '1' then
			case entrada is
				when "0000" => saida_8segmentos <= tabela_disp7seg(0);
				when "0001" => saida_8segmentos <= tabela_disp7seg(1);
				when "0010" => saida_8segmentos <= tabela_disp7seg(2);
				when "0011" => saida_8segmentos <= tabela_disp7seg(3);
				when "0100" => saida_8segmentos <= tabela_disp7seg(4);
				when "0101" => saida_8segmentos <= tabela_disp7seg(5);
				when "0110" => saida_8segmentos <= tabela_disp7seg(6);
				when "0111" => saida_8segmentos <= tabela_disp7seg(7);
				when "1000" => saida_8segmentos <= tabela_disp7seg(8);
				when "1001" => saida_8segmentos <= tabela_disp7seg(9);
				when "1010" => saida_8segmentos <= tabela_disp7seg(10);
				when "1011" => saida_8segmentos <= tabela_disp7seg(11);
				when "1100" => saida_8segmentos <= tabela_disp7seg(12);
				when "1101" => saida_8segmentos <= tabela_disp7seg(13);
				when "1110" => saida_8segmentos <= tabela_disp7seg(14);
				when "1111" => saida_8segmentos <= tabela_disp7seg(15);
				when others => saida_8segmentos <= "11111110";  -- liga SO O PONTO
			end case;
		end if;
	end process;
end Behavioral;

	