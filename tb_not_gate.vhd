----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Aybüke Sude ATAY
-- 
-- Create Date: 07.03.2026 22:04:55
-- Design Name: 
-- Module Name: tb_not_gate - Behavioral
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

entity tb_not_gate is
end tb_not_gate;

architecture behavior of tb_not_gate is

signal a : STD_LOGIC;
signal out_n : STD_LOGIC;

component not_gate
    Port(
        a : in STD_LOGIC;
        out_n : out STD_LOGIC
    );
end component;

begin

uut: not_gate
    port map(
        a => a,
        out_n => out_n
    );

process
begin

a <= '0';
wait for 10 ns;

a <= '1';
wait for 10 ns;

wait;

end process;

end behavior;
