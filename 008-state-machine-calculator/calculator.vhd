
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity Calculator is
    port (clock : in STD_LOGIC;
          btn_reset : in STD_LOGIC;
          btn_inc : in STD_LOGIC;
          btn_dec : in STD_LOGIC;        
          switch_input : in STD_LOGIC;
          switch_operation : in STD_LOGIC;
          switch_done : in STD_LOGIC;
          display_out : out STD_LOGIC_VECTOR (15 downto 0));
        
end Calculator;

architecture Behavioral of Calculator is
  type STATE is (BOOT, 
                 POLLING, 
                 INPUT_DATA, 
                 RELEASE_BTN_INC,
                 RELEASE_BTN_DEC,
                 CALCULATE, 
                 SHOW_RESULTS);
  signal current_state : STATE;
  signal input_a, input_b : INTEGER range 0 to 255;
  signal result : STD_LOGIC_VECTOR (7 downto 0); 
  signal operation : INTEGER range 0 to 9;

begin

core : process (clock, btn_reset, btn_inc, btn_dec)
begin
  if clock'event and clock = '1' then
    if btn_reset = '1' then
      current_state <= BOOT;
    end if;

    case current_state is
      when BOOT =>
        input_a <= 0;
        input_b <= 0;
        operation <= 0;
        current_state <= POLLING;  
        
      when POLLING => 
        if switch_done = '1' then
          current_state <= CALCULATE;
        elsif btn_inc = '1' then
          current_state <= RELEASE_BTN_INC;
        elsif btn_dec = '1' then
          current_state <= RELEASE_BTN_DEC;
        else
          current_state <= POLLING;
        end if;

      when RELEASE_BTN_INC =>
        if btn_inc = '0' then
          if switch_operation = '0' then
            if switch_input = '0' then
              input_a <= input_a + 1;
            else
              input_b <= input_b + 1;
            end if;
          else
            operation <= operation + 1;
          end if;
          current_state <= POLLING;
        end if;

      when RELEASE_BTN_DEC =>
        if btn_dec = '0' then
          if switch_operation = '0' then
            if switch_input = '0' then
              input_a <= input_a - 1;
            else
              input_b <= input_b - 1;
            end if;
          else
            operation <= operation - 1;
          end if;
          current_state <= POLLING;
        end if;        

      when CALCULATE =>
        case operation is
          when 1 =>
            result <= conv_std_logic_vector((input_a + input_b), 8);
          when 2 =>
            result <= conv_std_logic_vector((input_a - input_b), 8);
          when 3 =>
            result <= conv_std_logic_vector((input_a - input_b), 8);
          when 4 =>
            result <= conv_std_logic_vector((input_a * input_b), 8);
          when 5 =>
            result <= conv_std_logic_vector(input_a, 8) and conv_std_logic_vector(input_b, 8);
          when 6 =>
            result <= conv_std_logic_vector(input_a, 8) or conv_std_logic_vector(input_b, 8);
          when 7 =>
            result <= conv_std_logic_vector(input_a, 8) xor conv_std_logic_vector(input_b, 8);
          when 8 =>
            result <= not conv_std_logic_vector(input_a, 8);
          when 9 =>
            result <= conv_std_logic_vector(0, 8);
          when others =>
            result <= conv_std_logic_vector(0, 8);
        end case;  
        current_state <= BOOT;

      when others =>
        current_state <= BOOT;

    end case;
  end if;
end process;

end Behavioral ;
