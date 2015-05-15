
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity square is
    Port ( number : in  STD_LOGIC_VECTOR (15 downto 0);
           clock : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (15 downto 0);
           done : out  STD_LOGIC);
        
end square;

architecture Behavioral of square is
  type FSM is (INITIAL, OPERATION, FINAL);
  signal state : FSM;
  signal n, d, r : STD_LOGIC_VECTOR (15 downto 0);
begin

main_process : process (clock)
begin
  if clock'event and clock = '1' then
    case state is
      when INITIAL =>
        n <= number;
        d <= "000000000000001";
        r <= "000000000000000";
        done <= '0';
        state <= OPERATION;
      when OPERATION =>
        if (n > 0) then
          n <= n - d;
          d <= d + 2;
          r <= r + 1;
          done <= '0';
          state <= OPERATION;
        else
          state <= FINAL;
        end if;
        
      when FINAL =>
        output <= r;
        done <= '1';
        state <= INITIAL;
      
      when others =>
        done <= '0';
        state <= INITIAL;
    end case;
  end if;
end process;

end Behavioral;
