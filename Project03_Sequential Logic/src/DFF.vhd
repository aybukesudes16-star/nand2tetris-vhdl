----------------------------------------------------------------------------------
-- Engineer: Aybüke
-- Create Date: 28.11.2026 13:41:13
--Consider DFF is given.
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity DFF is
   Port ( 
      d:in STD_LOGIC;
      clk: in STD_LOGIC;
      q: out STD_LOGIC

);
end DFF;

architecture Behavioral of DFF is
begin
   process(clk)
   begin
       if rising_edge(clk) then
       q<=d;
       end if;
   end process;


end Behavioral;
