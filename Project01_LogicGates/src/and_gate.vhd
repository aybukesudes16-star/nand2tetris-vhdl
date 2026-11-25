----------------------------------------------------------------------------------
-- Company: AYBİK Company
-- Engineer: 
-- 
-- Create Date: 10.03.2026 22:55:53
-- Design Name: 
-- Module Name: and_gate - Behavioral
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

entity and_gate is
Port(
    a:in STD_LOGIC;
    b:in STD_LOGIC;
    out_and: out STD_LOGIC);
end and_gate;

architecture Behavioral of and_gate is
component nand_gate
Port ( a, b : in STD_LOGIC; out_n : out STD_LOGIC );
    end component;
component not_gate
Port ( a : in STD_LOGIC; out_n : out STD_LOGIC );
    end component;
signal nand_result : STD_LOGIC;
begin
U1: nand_gate port map(
      a=>a,
      b=>b,  
      out_n=>nand_result);

U2: not_gate port map(
     a=>nand_result,
     out_n=>out_and);


end Behavioral;
