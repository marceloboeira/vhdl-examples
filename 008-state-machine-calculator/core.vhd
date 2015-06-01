
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity Core is
    Port (clock : in  STD_LOGIC;
          btn_reset : in STD_LOGIC;
          btn_inc : in STD_LOGIC;
          btn_dec : in STD_LOGIC;        
          switch_done : in STD_LOGIC;
          switch_input : in STD_LOGIC;
          switch_operation : in STD_LOGIC;
          btn_display_mode : in  STD_LOGIC;
          current_display : out STD_LOGIC_VECTOR (3 downto 0);
          display_output : out  STD_LOGIC_VECTOR (7 downto 0));


end Core;

architecture Behavioral of Core is
  signal btn_inc_debounce, btn_dec_debounce : STD_LOGIC;
  signal output_display : STD_LOGIC_VECTOR (15 downto 0);    
begin

core : entity work.calculator
  port map (clock,
            btn_reset,
            btn_inc_debounce,
            btn_dec_debounce,
            switch_input,
            switch_operation,
            switch_done,
            output_display);

debouce_btn_inc :entity work.debounce
  port map (clock, btn_inc, btn_inc_debounce);


debouce_btn_dec :entity work.debounce
  port map (clock, btn_dec, btn_dec_debounce);

display_linker : entity work.display_topo
    Port Map (clock,
              btn_reset,
              btn_display_mode,
              output_display,
              current_display,
              display);

end Behavioral;

