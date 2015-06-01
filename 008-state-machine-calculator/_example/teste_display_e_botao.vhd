----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:01:32 06/10/2013 
-- Design Name: 
-- Module Name:    teste_display_e_botao - Behavioral 
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
use ieee.std_logic_arith.all;


entity teste_display_e_botao is
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  botao : in  STD_LOGIC;
			  saida_8segmentos 	: out  STD_LOGIC_VECTOR (7 downto 0);
			  disp_sel_o 	: out  STD_LOGIC_VECTOR (3 downto 0);
           led   : out  STD_LOGIC);
end teste_display_e_botao;

architecture Behavioral of teste_display_e_botao is
	signal entrada_disp, display_s  	:   STD_LOGIC_VECTOR (15 downto 0);
	signal clk1s, botao_DB : std_logic :='0';
	signal cnt : integer range 0 to 9999;
begin

meu_proj : entity work.meu_projeto 
    Port map ( clock => clock,
           reset => reset,
			  botao => botao_DB,
			  saida => entrada_disp,
           led   => led) ;

debouce_n1 :entity work.debounce
	port map (  clock => clock,
					entrada => botao,
					saida_DB => botao_DB
				);

display : entity work.modulo_display
    Port  map( clock => clock, 
           reset => reset,
			  entrada_s  => entrada_disp,
			  saida_8segmentos 	=> saida_8segmentos,
			  disp_sel_o 	=> disp_sel_o
			);

end Behavioral;

