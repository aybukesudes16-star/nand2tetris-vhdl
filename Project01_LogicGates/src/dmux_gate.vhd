----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.10.2026 00:15:17
-- Design Name: 
-- Module Name: dmux_gate - Behavioral
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

entity dmux_gate is
Port(
  in_signal : in STD_LOGIC;
  sel : in STD_LOGIC;
  a : out STD_LOGIC;
  b : out STD_LOGIC
); 
end dmux_gate; 

architecture Behavioral of dmux_gate is 

component not_gate
    Port ( a : in STD_LOGIC; out_n : out STD_LOGIC );
end component;

component and_gate
    Port ( a, b : in STD_LOGIC; out_and : out STD_LOGIC );
end component;

signal not_sel : STD_LOGIC;

begin

U1: not_gate port map (
    a => sel,
    out_n => not_sel
);

U2: and_gate port map (  
    a => in_signal,
    b => not_sel,
    out_and => a 
);

U3: and_gate port map (  
    a => in_signal,
    b => sel,
    out_and => b 
);

end Behavioral;
