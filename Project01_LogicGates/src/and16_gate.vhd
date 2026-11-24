----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.10.2026 19:04:46
-- Design Name: 
-- Module Name: and16_gate - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity and16_gate is
 Port(
     a: in STD_LOGIC_VECTOR(15 downto 0);
     b : in STD_LOGIC_VECTOR(15 downto 0);
     out_and16: out STD_LOGIC_VECTOR(15 downto 0)
);

end and16_gate;


architecture Behavioral of and16_gate is
component and_gate
    Port(a: in STD_LOGIC;b: in STD_LOGIC; out_and: out STD_LOGIC);
  end component;

begin

gen_and:for i in 0 to 15 generate
U:and_gate port map(
a=> a(i),
b=>b(i),
out_and=>out_and16(i)
);
end generate;
end Behavioral;
