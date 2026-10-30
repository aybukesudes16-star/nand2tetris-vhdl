----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.10.2026 20:09:56
-- Design Name: 
-- Module Name: or8way_gate - Behavioral
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

entity or8way_gate is
Port(
  in_bus: in STD_LOGIC_VECTOR(7 downto 0);
  out_or8way: out STD_LOGIC
);
end or8way_gate;

architecture Behavioral of or8way_gate is
component or_gate
   Port(a:in STD_LOGIC; b: in STD_LOGIC; out_or: out STD_LOGIC);
end component;
signal s1: STD_LOGIC_VECTOR(3 downto 0 );
signal s2: STD_LOGIC_VECTOR(1 downto 0 );

begin
U0: or_gate port map(a=> in_bus(0), b=>in_bus(1), out_or=> s1(0));
U1: or_gate port map( a => in_bus(2), b => in_bus(3), out_or => s1(1) );
U2: or_gate port map( a => in_bus(4), b => in_bus(5), out_or => s1(2) );
U3: or_gate port map( a => in_bus(6), b => in_bus(7), out_or => s1(3) );

U4: or_gate port map( a => s1(0), b => s1(1), out_or => s2(0) );
U5: or_gate port map( a => s1(2), b => s1(3), out_or => s2(1) );

U6: or_gate port map( a => s2(0), b => s2(1), out_or => out_or8way );

end Behavioral;
