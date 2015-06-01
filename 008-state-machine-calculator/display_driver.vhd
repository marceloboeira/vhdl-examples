library ieee;
use ieee.std_logic_1164.all;


entity DisplayDriver is
    Port (clock: in  STD_LOGIC;
          btn_reset: in  STD_LOGIC;
          display_mode: in  STD_LOGIC;
          display_in: in  STD_LOGIC_VECTOR (15 downto 0);
          display_current: out STD_LOGIC_VECTOR (3 downto 0);
          display_out: out  STD_LOGIC_VECTOR (7 downto 0));
end DisplayDriver;

architecture Behavioral of DisplayDriver is
  signal display_result, display_hex2bcd_out : STD_LOGIC_VECTOR (15 downto 0); 
begin

display_mux: process (display_mode, display_in)
begin
  if display_mode = '1' then
    display_result <= display_hex2bcd_out;
  else
    display_result <= display_in;
  end if;
end process;

bcd2hex_p: entity work.HexToBCD
  Port map (clock,
            display_in(3 downto 0),
            display_in(7 downto 4),
            display_in(11 downto 8),
            display_in(15 downto 12),
            display_hex2bcd_out(3 downto 0),
            display_hex2bcd_out(7 downto 4),
            display_hex2bcd_out(11 downto 8),
            display_hex2bcd_out(15 downto 12));

display1: entity work.SevenSegmentDisplayMux
  Port map (display_result,
            clock,
            btn_reset,
            display_out,
            display_current);

end Behavioral;

