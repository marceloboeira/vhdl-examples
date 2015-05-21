
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity Calculator is
    Port (clock : in  STD_LOGIC;
			 btn_inc : in STD_LOGIC;
			 btn_dec : in STD_LOGIC);
        
end Calculator;

architecture Behavioral of Calculator is
  type STATE is (BOOT, INPUT_DATA, INPUT_OPERATION, CALCULATE, SHOW_RESULTS);
  signal current_state : STATE;
  signal current_input_display : STD_LOGIC;
  signal input_a, input_b, result : STD_LOGIC_VECTOR (15 downto 0);
  signal a, b: integer range 0 to 99;
  --signal result : integer range 0 to 999;
  signal operation : integer range 0 to 2;
begin

core : process (clock)
begin
  if clock'event and clock = '1' then
    case current_state is
      when BOOT =>
		  a <= 0;
		  b <= 0;
		  --result <= 0;
		  
		  current_input_display <= '0';
		  current_state <= INPUT_DATA;	
      when INPUT_DATA => 
			if btn_inc'event and btn_inc = '1' then
				if (current_input_display = '0') then
					a <= a + 1;
				else 
					b <= b + 1;
				end if;
			end if;
			
			if btn_dec'event and btn_dec = '1' then
				if (current_input_display = '0') then
					a <= a - 1;
				else 
					b <= b - 1;
				end if;
			end if;
			
			-- if btn_finish_input_data = '1'
			-- 	current_state <= INPUT_OPERATION;
			-- end
		when INPUT_OPERATION =>
		
			-- if btn_finish_input_operation = '1'
			-- 	current_state <= CALCULATE;
			-- end
		when CALCULATE =>
		
			-- CALCULATE
			
			current_state <= SHOW_RESULTS;
		when SHOW_RESULTS =>
			
			-- if btn_clear = '1'
			-- 	current_state <= BOOT
			-- end
      when others =>
			current_state <= BOOT;
			
    end case;
  end if;
end process;

	--input_a <= conv_std_logic_vector(a, 15);
   --input_b <= conv_std_logic_vector(b, 15);
	--results <= conv_std_logic_vector(r, 15);
end Behavioral;
