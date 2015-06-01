library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SevenSegmentDisplayDriver is
    Port (entrada: in STD_LOGIC_VECTOR (3 downto 0);
          clock: in STD_LOGIC;
          reset: in STD_LOGIC;
          output8: out STD_LOGIC_VECTOR (7 downto 0));
end SevenSegmentDisplayDriver;

architecture Behavioral of SevenSegmentDisplayDriver is
  type STD_HEX_VECTOR_BASE is array (0 to 15) of STD_LOGIC_VECTOR (0 to 7);
  constant base : STD_HEX_VECTOR_BASE := (("00000011"),
                                          ("10011111"),
                                          ("00100101"),
                                          ("00001101"),
                                          ("10011001"),
                                          ("01001001"),
                                          ("01000001"),
                                          ("00011111"),
                                          ("00000001"),
                                          ("00001001"),
                                          ("11111101"),
                                          ("11000001"),
                                          ("01100011"),
                                          ("10000101"),
                                          ("01100001"),
                                          ("01110001"));
begin
  process (clock, reset)
  begin
    if reset = '1' then
      output8 <= "11111111"; -- apaga tudo
    elsif clock'event and clock = '1' then
      case entrada is
        when "0000" => output8 <= base(0);
        when "0001" => output8 <= base(1);
        when "0010" => output8 <= base(2);
        when "0011" => output8 <= base(3);
        when "0100" => output8 <= base(4);
        when "0101" => output8 <= base(5);
        when "0110" => output8 <= base(6);
        when "0111" => output8 <= base(7);
        when "1000" => output8 <= base(8);
        when "1001" => output8 <= base(9);
        when "1010" => output8 <= base(10);
        when "1011" => output8 <= base(11);
        when "1100" => output8 <= base(12);
        when "1101" => output8 <= base(13);
        when "1110" => output8 <= base(14);
        when "1111" => output8 <= base(15);
        when others => output8 <= "11111110"; -- dot only
      end case;
    end if;
  end process;
end Behavioral;

  