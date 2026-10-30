----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.10.2026 19:27:56
-- Design Name: 
-- Module Name: mux16_gate - Behavioral
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

entity mux16_gate is
Port(
  a: in STD_LOGIC_VECTOR(15 downto 0);
  b: in STD_LOGIC_VECTOR(15 downto 0);
  sel: in STD_LOGIC;
  out_mux16: out STD_LOGIC_VECTOR(15 downto 0)
);
end mux16_gate;

architecture Behavioral of mux16_gate is
component mux_gate
    Port(a:in STD_LOGIC; b: in STD_LOGIC; sel: in STD_LOGIC; out_mux: out STD_LOGIC);
  end component;

begin
gen_mux:for i in 0 to 15 generate
U: mux_gate port map(
a=> a(i),
b=> b(i),
sel=>sel,
out_mux=> out_mux16(i)
);
 end generate;

end Behavioral;
