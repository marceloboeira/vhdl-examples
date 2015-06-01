
library ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_arith.all;


entity Debounce is
    port (clock: in STD_LOGIC;
          input_h: in STD_LOGIC;
          output_h: out STD_LOGIC;

          --internal structure
          input_temp1_h: out STD_LOGIC;
          input_temp2_h: out STD_LOGIC;
          count_h: out STD_LOGIC_VECTOR(19 downto 0));
end Debounce;

architecture Behavioral of Debounce is
  constant delay : INTEGER := 500000;
  signal count : INTEGER := 0;
  signal input_temp1, input_temp2 : STD_LOGIC :='0';
  signal output_temp : STD_LOGIC;
begin
  
contar: process (input_h, clock, input_temp1)
  begin
    if input_h /= input_temp1 then
        count <= 0;
        input_temp1 <= input_h;
    elsif clock'event and clock = '1' then
      input_temp1 <= input_h;
      input_temp2 <= input_temp1;
      count <= count +1;
    else
      count <= count;
    end if;
  end process;
  
avaliar:  process (clock, input_temp1, input_temp2, count)
    begin
    if clock'event and clock='1' then
      if count >= delay and input_temp1 = input_temp2 then
        output_temp <= input_h;
      else
        output_temp <= output_temp;
      end if;
    else
      output_temp <= output_temp;
    end if;
  end process;
  
  output_h <= output_temp;
  count_h <= conv_std_logic_vector(count, 20);
  input_temp1_h <= input_temp1;
  input_temp2_h <= input_temp2;
end Behavioral;

