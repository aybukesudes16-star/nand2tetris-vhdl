----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.10.2026 00:17:10
-- Design Name: 
-- Module Name: Dmux8way_gate - Behavioral
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

entity Dmux8way_gate is
  Port(
  in_signal : in STD_LOGIC;
  sel : in STD_LOGIC_VECTOR (2 downto 0);
  a : out STD_LOGIC;
  b : out STD_LOGIC;
  c : out STD_LOGIC;
  d : out STD_LOGIC;
  e : out STD_LOGIC;
  f : out STD_LOGIC;
  g : out STD_LOGIC;
  h : out STD_LOGIC
); 
end Dmux8way_gate;

architecture Behavioral of Dmux8way_gate is
component dmux_gate 
    Port(
        in_signal : in STD_LOGIC;
        sel     : in STD_LOGIC;
        a       : out STD_LOGIC;
        b       : out STD_LOGIC
    );
end component;

signal out_abcd:STD_LOGIC;
signal out_efgh:STD_LOGIC;
signal out_ab   : STD_LOGIC;
signal out_cd   : STD_LOGIC;
signal out_ef   : STD_LOGIC;
signal out_gh   : STD_LOGIC;

begin
U0: dmux_gate port map(in_signal=>in_signal,sel=>sel(2),a=>out_abcd,b=>out_efgh);

U1: dmux_gate port map( in_signal => out_abcd, sel => sel(1), a => out_ab, b => out_cd );
U2: dmux_gate port map( in_signal => out_efgh, sel => sel(1), a => out_ef, b => out_gh );

U3: dmux_gate port map( in_signal => out_ab, sel => sel(0), a => a, b => b );
U4: dmux_gate port map( in_signal => out_cd, sel => sel(0), a => c, b => d );
U5: dmux_gate port map( in_signal => out_ef, sel => sel(0), a => e, b => f );
U6: dmux_gate port map( in_signal => out_gh, sel => sel(0), a => g, b => h );

end Behavioral;
