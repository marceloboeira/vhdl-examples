library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity clock_divider_top is
    Port ( CLK_PB4 : in  STD_LOGIC;
           LED1    : out STD_LOGIC;
           LED2    : out STD_LOGIC);
end clock_divider_top;

architecture Behavioral of clock_divider_top is
signal CLK_DIV : std_logic_vector (4 downto 0); -- 5 bits
begin
    -- clock divider
    process (CLK_PB4)
    begin
        if (CLK_PB4'Event and CLK_PB4 = '1') then
            CLK_DIV <= CLK_DIV + '1';
        end if;
    end process;
    
    LED1 <= CLK_PB4;    -- connect LED 1 to clock source
    LED2 <= CLK_DIV(4); -- connect LED 2 to divided clock
end Behavioral;
