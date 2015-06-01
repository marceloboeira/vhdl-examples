----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:20:16 11/04/2014 
-- Design Name: 
-- Module Name:    meu_projeto - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity meu_projeto is
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  botao : in  STD_LOGIC;
			  saida : out STD_LOGIC_VECTOR (15 downto 0);
           led   : out  STD_LOGIC);
end meu_projeto;

architecture Behavioral of meu_projeto is
	signal clk1s : std_logic;
	signal cnt : integer range 0 to 9999;	
begin

conta_botao : process (reset, botao)
begin
	if reset = '1' then
		cnt <= 0;
	elsif botao'event and botao='1' then
		cnt <= cnt +1;
	else
		cnt <= cnt;
	end if;
end process;

saida <= conv_std_logic_vector(cnt,16);

pisca_led : process (reset, clock)
	variable cnt : integer range 0 to 25000001;
begin
	if reset = '1' then
		clk1s <= '0';
		cnt := 0;
	elsif clock'event and clock ='1' then
		if(cnt >= 25000000) then
			clk1s <= not clk1s;
			cnt := 0;
		else
			cnt := cnt +1;
		end if;
	else
		cnt := cnt;
	end if;
end process;

led <= clk1s;


end Behavioral;

