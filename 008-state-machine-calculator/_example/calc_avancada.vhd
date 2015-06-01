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


entity calc_avancada is
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  bot0 : in  STD_LOGIC;
			  bot1 : in  STD_LOGIC;
			  sw7 : in  STD_LOGIC;
			  sw6 : in  STD_LOGIC;
			  sw5 : in  STD_LOGIC;
			  saida_display 	: out  STD_LOGIC_VECTOR (15 downto 0));
end calc_avancada;

architecture Behavioral of calc_avancada is
	type fsm_botao is (inicial, polling, ret_b0, ret_b1, operacao);
	signal estado_atual : fsm_botao;
	signal num0, num1, resulti: integer range 0 to 255;
	signal oper : integer range 0 to 9;
	signal result_raiz, resultb, num_raiz : std_logic_vector (7 downto 0);
	signal p : std_logic;
begin

fsm_p : process (reset, clock)
begin
		if clock'event and clock = '1' then -- Se houve borda de subida do clock então
			if reset = '1' then -- se houve reset
				estado_atual <= inicial;
			else  
				case estado_atual is  
					when inicial =>
						num0 <= 0;
						num1 <= 0;
						oper <= 0;
						estado_atual <= polling;
					when polling =>
						if sw5 = '1' then
							estado_atual <= operacao;
						elsif bot0 = '1' then
							estado_atual <= ret_b0;
						elsif bot1 = '1' then
							estado_atual <= ret_b1;
						else
							estado_atual <= polling;
						end if;
					when ret_b0 =>
						if bot0 = '1' then
							estado_atual <= ret_b0;
						else
							if sw6 = '0' then
								if sw7 = '1' then
									num1 <= num1 + 1;
								else
									num0 <= num0 + 1;
								end if;
							else
								oper <= oper + 1;
							end if;
							estado_atual <= polling;
						end if;
					when ret_b1 =>
						if bot1 = '1' then
							estado_atual <= ret_b1;
						else
							if sw6 = '0' then
								if sw7 = '1' then
									num1 <= num1 - 1;
								else
									num0 <= num0 - 1;
								end if;
							else
								oper <= oper - 1;
							end if;
							estado_atual <= polling;
						end if;
					when operacao =>
						case oper is
							when 1 =>
								resultb <= conv_std_logic_vector((num0 + num1), 8);
							when 2 =>
								resultb <= conv_std_logic_vector((num0 - num1), 8);
							when 3 =>
								resultb <= conv_std_logic_vector((num0 - num1), 8);
							when 4 =>
								resultb <= conv_std_logic_vector((num0 * num1), 8);
							when 5 =>
								resultb <= conv_std_logic_vector(num0, 8) and conv_std_logic_vector(num1, 8);
							when 6 =>
								resultb <= conv_std_logic_vector(num0, 8) or conv_std_logic_vector(num1, 8);
							when 7 =>
								resultb <= conv_std_logic_vector(num0, 8) xor conv_std_logic_vector(num1, 8);
							when 8 =>
								resultb <= not conv_std_logic_vector(num0, 8);
							when 9 =>
								resultb <= result_raiz;
							when others =>
								resultb <= (others => 'Z'); -- coloca a saida em alta impedancia
						end case;
					when others =>
						estado_atual <= inicial;
				end case;
			end if;
		end if;
	end process;

disp_out_p : process (sw5, sw6, sw7, resultb, num0, num1, oper)
begin
	if reset = '1' then
		saida_display <= (others => '0');
	elsif sw5 = '1' then
		saida_display(7 downto 0) <= resultb;
		saida_display(15 downto 8) <= (others => '0');
	elsif sw6 = '1' then
		saida_display(7 downto 0) <= conv_std_logic_vector(oper,8);
		saida_display(15 downto 8) <= (others => '0');
	elsif sw7 = '1' then
		saida_display(7 downto 0) <= conv_std_logic_vector(num1,8);
		saida_display(15 downto 8) <= (others => '0');
	else
		saida_display(7 downto 0) <= conv_std_logic_vector(num0,8);
		saida_display(15 downto 8) <= (others => '0');
	end if;
end process;

num_raiz <= conv_std_logic_vector(num0,8);

raiz_q : entity work.raiz_quad
		port map ( numero => num_raiz,
           clock => clock,
           reset => reset,
           saida => result_raiz,
           pronto => p);

end Behavioral;

