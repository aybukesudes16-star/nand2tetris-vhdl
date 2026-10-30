----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.10.2026 19:09:48
-- Design Name: 
-- Module Name: or16_gate - Behavioral
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

entity or16_gate is
    Port(
        a: in STD_LOGIC_VECTOR(15 downto 0);
        b: in STD_LOGIC_VECTOR(15 downto 0);
        out_or16: out STD_LOGIC_VECTOR(15 downto 0)
    );
end or16_gate;

architecture Behavioral of or16_gate is

component or_gate
    Port(a: in STD_LOGIC; b: in STD_LOGIC; out_or: out STD_LOGIC);
end component;

begin
gen_or: for i in 0 to 15 generate 
    U: or_gate port map(
        a => a(i),
        b => b(i),
        out_or => out_or16(i)
    );
end generate;

end Behavioral;