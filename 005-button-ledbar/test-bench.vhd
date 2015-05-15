LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_exe2a4 IS
END TB_exe2a4;
 
ARCHITECTURE behavior OF TB_btn_led IS 

    COMPONENT btn_led
    PORT(
         btn : IN  std_logic;
         reset : IN  std_logic;
         ledA : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal btn : std_logic := '0';
   signal reset : std_logic := '1';

  --Outputs
   signal ledA : std_logic_vector(7 downto 0);
   constant btn_period : time := 1 ms;
 
BEGIN
  uut: TB_btn_led PORT MAP (
          btn => btn,
          reset => reset,
          ledA => ledA
       );

   btn_process :process
   begin
    btn <= '0';
    wait for btn_period/2;
    btn <= '1';
    wait for btn_period/2;
   end process;
 
   stim_proc: process
   begin    
      wait for 100 ns;  
      reset <= '0';
      -- insert stimulus here 
      wait;
   end process;

END;
