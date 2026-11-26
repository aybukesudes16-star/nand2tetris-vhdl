----------------------------------------------------------------------------------
-- Engineer: Aybüke
-- 
-- Create Date: 26.11.2026 22:17:21
-- Module Name: Inc16 - Behavioral

----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Inc16 is
    Port (
          a: in STD_LOGIC_VECTOR (15 downto 0);
          out_Inc16: out STD_LOGIC_VECTOR (15 downto 0)
 );
end Inc16;

architecture Behavioral of Inc16 is
component Add16
    Port(
         a:in  STD_LOGIC_VECTOR (15 downto 0);
         b : in  STD_LOGIC_VECTOR (15 downto 0);
         out_add : out STD_LOGIC_VECTOR (15 downto 0)
    );
end component;

begin

U1: Add16 port map(
       a=>a,
       b=>"0000000000000001",
       out_add=>out_Inc16); 


end Behavioral;
