----------------------------------------------------------------------------------
-- Company: Marmara University
-- Engineer: Aybüke Sude ATAY
-- 
-- Create Date: 07.03.2026 22:00:06
-- Design Name: 
-- Module Name: nand_gate - Behavioral
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

entity nand_gate is
    Port (
        a : in STD_LOGIC;
        b : in STD_LOGIC;
        out_n : out STD_LOGIC
    );
end nand_gate;

architecture Behavioral of nand_gate is
begin

    out_n <= a nand b;

end Behavioral;
