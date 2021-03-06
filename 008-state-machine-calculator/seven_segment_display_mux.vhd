
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

entity SevenSegmentDisplayMux is
    Port (entrada: in  STD_LOGIC_VECTOR (15 downto 0);
          clock: in STD_LOGIC;
          reset: in STD_LOGIC;
          output_h: out  STD_LOGIC_VECTOR (7 downto 0);
          current_display: out  STD_LOGIC_VECTOR (3 downto 0);
          clk_1k: out STD_LOGIC);
end SevenSegmentDisplayMux;

architecture Behavioral of SevenSegmentDisplayMux is
  type STD_LOGIC_ARRAY_4 is array (3 downto 0) of STD_LOGIC_VECTOR (7 downto 0);
  signal display : STD_LOGIC_ARRAY_4; 
  signal cont : INTEGER range 0 to 3 := 0;
  signal disp_sel : STD_LOGIC_VECTOR (3 downto 0) := "1110";
  signal clk_1k_sgn : STD_LOGIC := '0';
  signal clock_1k : INTEGER range 0 to 26000 :=0;
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

process(clk_1k_sgn, reset)
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

current_display <= disp_sel;

laco_for : for i in 0 to 3 generate 
  display1 : entity work.SevenSegmentDisplayDriver
  port map (entrada((i+1)*4 -1 downto i*4),
            clock,
            reset,
            display(i));
  
  output_h <= display(cont REM 4);
end generate;

clk_1k <= clk_1k_sgn;

end Behavioral;
