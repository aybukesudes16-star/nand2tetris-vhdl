----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.10.2026 00:02:18
-- Design Name: 
-- Module Name: Dmux4way_gate - Behavioral
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

entity Dmux4way_gate is
  Port(
  in_signal : in STD_LOGIC;
  sel : in STD_LOGIC_VECTOR (1 downto 0);
  a : out STD_LOGIC;
  b : out STD_LOGIC;
  c : out STD_LOGIC;
  d : out STD_LOGIC
); 

end Dmux4way_gate;

architecture Behavioral of Dmux4way_gate is
component dmux_gate
    Port(
        in_signal : in STD_LOGIC;
        sel     : in STD_LOGIC;
        a       : out STD_LOGIC;
        b       : out STD_LOGIC
    );
end component;

signal out_ab : STD_LOGIC;
signal out_cd : STD_LOGIC;

begin

U0:dmux_gate port map( in_signal=> in_signal, sel=>sel(1),a=>out_ab,b=>out_cd);

U1:dmux_gate port map( in_signal=> in_signal, sel=>sel(0),a=>a,b=>b);
U2:dmux_gate port map( in_signal=> in_signal, sel=>sel(0),a=>c,b=>d);

end Behavioral;
