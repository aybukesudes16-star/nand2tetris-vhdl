----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.10.2026 23:51:08
-- Design Name: 
-- Module Name: mux_gate - Behavioral
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

entity mux_gate is
Port(
  a : in STD_LOGIC;
  b : in STD_LOGIC;
  sel : in STD_LOGIC;
  out_mux : out STD_LOGIC ); 
end mux_gate; 

architecture Behavioral of mux_gate is

component not_gate
    Port ( a : in STD_LOGIC; out_n : out STD_LOGIC );
end component;

component and_gate
    Port ( a, b : in STD_LOGIC; out_and : out STD_LOGIC );
end component;

component or_gate
    Port ( a, b : in STD_LOGIC; out_or : out STD_LOGIC ); 
end component;


signal not_sel : STD_LOGIC;
signal out_and1 : STD_LOGIC;
signal out_and2 : STD_LOGIC;

begin

U1: not_gate port map (
    a => sel,
    out_n => not_sel
);

U2: and_gate port map (  
    a => a,
    b => not_sel,
    out_and => out_and1
);

U3: and_gate port map (  
    a => b,
    b => sel,
    out_and => out_and2
);

U4: or_gate port map ( 
    a => out_and1,
    b => out_and2,
    out_or => out_mux
);

end Behavioral;
