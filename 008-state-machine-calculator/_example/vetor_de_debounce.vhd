----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:20:49 09/25/2012 
-- Design Name: 
-- Module Name:    vetor_de_debounce - Behavioral 
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
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_arith.all;


entity debounce is
    Port ( clock : in std_logic;
				entrada : in  STD_LOGIC;
				entrada_tmp1_o : out  STD_LOGIC;
				entrada_tmp2_o : out  STD_LOGIC;
				contagem_o : out std_logic_vector(19 downto 0);
           saida_DB : out  STD_LOGIC);
end debounce;

architecture Behavioral of debounce is
	constant atraso : integer := 500000; -- alterado p/ 500 p/ simular. Valor p/ sintese ingual a 500000
	signal contagem : integer := 0;
	signal entrada_tmp1, entrada_tmp2 : std_logic:='0';
	signal saida_tmp : std_logic;
begin
	
contar:	process (entrada, clock, entrada_tmp1)
	begin
		if entrada /= entrada_tmp1 then
				contagem <= 0;
				entrada_tmp1 <= entrada;
		elsif clock'event and clock = '1' then
			entrada_tmp1 <= entrada;
			entrada_tmp2 <= entrada_tmp1;
			contagem <= contagem +1;
		else
			contagem <= contagem;
		end if;
	end process;
	
avaliar:	process (clock, entrada_tmp1, entrada_tmp2, contagem)
		begin
		if clock'event and clock='1' then
			if contagem >= atraso and entrada_tmp1 = entrada_tmp2 then
				saida_tmp <= entrada;
			else
				saida_tmp <= saida_tmp;
			end if;
		else
			saida_tmp <= saida_tmp;
		end if;
	end process;
	
	saida_DB <= saida_tmp;
	contagem_o <= conv_std_logic_vector(contagem, 20);
	entrada_tmp1_o <= entrada_tmp1;
	entrada_tmp2_o <= entrada_tmp2;
end Behavioral;

