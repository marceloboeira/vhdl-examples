----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:06:32 05/14/2014 
-- Design Name: 
-- Module Name:    meu_proj_topo - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity meu_proj_topo is
    Port ( clock : in  STD_LOGIC;
           bot0 : in  STD_LOGIC;
           bot1 : in  STD_LOGIC;
           sw7 : in  STD_LOGIC;
           sw6 : in  STD_LOGIC;
           sw5 : in  STD_LOGIC;
           botao_modo : in  STD_LOGIC;
           reset : in  STD_LOGIC;
	--		  led : out std_logic;
			  disp_sel_o : out STD_LOGIC_VECTOR (3 downto 0);
           display : out  STD_LOGIC_VECTOR (7 downto 0));
end meu_proj_topo;

architecture Behavioral of meu_proj_topo is
	signal botao_DB0,botao_DB1 : std_logic;
	signal saida_display : STD_LOGIC_VECTOR (15 downto 0);		
begin


arquivo_topo : entity work.calc_avancada
port map ( clock => clock,
				reset => reset,
				bot0 => botao_DB0,
				bot1 => botao_DB1,
				sw7  => sw7,
				sw6  => sw6, 
				sw5  => sw5,
				saida_display => saida_display);

debouce_n1 :entity work.debounce
	port map (  clock => clock,
					entrada => bot1,
					saida_DB => botao_DB1);

debouce_n0 :entity work.debounce
	port map (  clock => clock,
					entrada => bot0,
					saida_DB => botao_DB0);

display_1 : entity work.display_topo
    Port Map ( clock => clock,
           reset => reset,
           display_mode => botao_modo,
           display_in => saida_display,
			  disp_sel => disp_sel_o,
           display_out => display );

end Behavioral;

