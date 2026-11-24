----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.10.2026 22:40:38
-- Design Name: 
-- Module Name: xor_gate - Behavioral
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


entity xor_gate is
Port(
     a: in STD_LOGIC;
     b: in STD_LOGIC;
     out_xor: out STD_LOGIC);
end xor_gate;

architecture Behavioral of xor_gate is
component not_gate
    Port ( a : in STD_LOGIC; out_n : out STD_LOGIC );
end component;

component and_gate
    Port ( a, b : in STD_LOGIC; out_and : out STD_LOGIC );
end component;
component or_gate
Port ( a, b : in STD_LOGIC; out_or : out STD_LOGIC ); 
end component;

signal not_a : STD_LOGIC;
signal not_b : STD_LOGIC;
signal out_and1 : STD_LOGIC;
signal out_and2 : STD_LOGIC;

begin
U1: not_gate port map (
    a => a,
    out_n => not_a
);

U2: not_gate port map (
    a => b,
    out_n => not_b
);

U3: and_gate port map (  
    a => a,
    b => not_b,
    out_and => out_and1
);
U4: and_gate port map (
    a => b,
    b => not_a,
    out_and => out_and2
);
U5: or_gate port map ( 
    a => out_and1,
    b => out_and2,
    out_or=> out_xor
);
end Behavioral;
