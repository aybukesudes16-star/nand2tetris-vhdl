----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Aybüke sude atay
-- 
-- Create Date: 07.03.2026 22:02:43
-- Design Name: 
-- Module Name: not_gate - Behavioral
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

entity not_gate is
    Port (
        a : in STD_LOGIC;
        out_n : out STD_LOGIC
    );
end not_gate;

architecture Behavioral of not_gate is

component nand_gate
    Port(
        a : in STD_LOGIC;
        b : in STD_LOGIC;
        out_n : out STD_LOGIC
    );
end component;

begin

nand1 : nand_gate
    port map(
        a => a,
        b => a,
        out_n => out_n
    );

end Behavioral;
