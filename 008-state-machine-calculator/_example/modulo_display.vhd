----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:03:07 11/04/2014 
-- Design Name: 
-- Module Name:    modulo_display - Behavioral 
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

entity modulo_display is
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  entrada_s  : in  STD_LOGIC_VECTOR (15 downto 0);
			  saida_8segmentos 	: out  STD_LOGIC_VECTOR (7 downto 0);
			  disp_sel_o 	: out  STD_LOGIC_VECTOR (3 downto 0));
end modulo_display;

architecture Behavioral of modulo_display is
	signal display_s : STD_LOGIC_VECTOR (15 downto 0);
begin


bcd2hex_p : entity work.hex2bcd
port map (  clk 	=> clock,
				sw0	=> entrada_s(3 downto 0),
				sw1	=> entrada_s(7 downto 4),
				sw2	=> entrada_s(11 downto 8),
				sw3	=> entrada_s(15 downto 12),
				bcd0	=> display_s(3 downto 0),
				bcd1	=> display_s(7 downto 4),
				bcd2	=> display_s(11 downto 8),
				bcd3	=> display_s(15 downto 12));

display1 : entity work.disp7segx4
port map (  entrada 	=> display_s,
				clock 	=> clock,
				reset 	=> reset,
				saida_8segmentos => saida_8segmentos,
				disp_sel_o  => disp_sel_o );


end Behavioral;

