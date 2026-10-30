----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.10.2026 23:49:19
-- Design Name: 
-- Module Name: mux8way16 - Behavioral
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

entity mux8way16 is
Port(
 a:in STD_LOGIC_VECTOR(15 downto 0);
 b:in STD_LOGIC_VECTOR(15 downto 0);
 c:in STD_LOGIC_VECTOR(15 downto 0);
 d:in STD_LOGIC_VECTOR(15 downto 0);
 e:in STD_LOGIC_VECTOR(15 downto 0);
 f:in STD_LOGIC_VECTOR(15 downto 0);
 g:in STD_LOGIC_VECTOR(15 downto 0);
 h:in STD_LOGIC_VECTOR(15 downto 0);
 sel:in STD_LOGIC_VECTOR(2 downto 0);
 out_mux8way16: out STD_LOGIC_VECTOR(15 downto 0)
);
end mux8way16;

architecture Behavioral of mux8way16 is
component  mux16_gate
Port (
        a : in STD_LOGIC_VECTOR(15 downto 0);
        b : in STD_LOGIC_VECTOR(15 downto 0);
        sel : in STD_LOGIC;
        out_mux16 : out STD_LOGIC_VECTOR(15 downto 0)
    );
end component;

signal out_ab : STD_LOGIC_VECTOR(15 downto 0);
signal out_cd : STD_LOGIC_VECTOR(15 downto 0);
signal out_ef : STD_LOGIC_VECTOR(15 downto 0);
signal out_gh : STD_LOGIC_VECTOR(15 downto 0);
signal out_abcd : STD_LOGIC_VECTOR(15 downto 0);
signal out_efgh : STD_LOGIC_VECTOR(15 downto 0);

begin
U1: mux16_gate port map(a=>a,b=>b,sel=>sel(0),out_mux16=>out_ab);
U2: mux16_gate port map(a=>c,b=>d,sel=>sel(0),out_mux16=>out_cd);
U3: mux16_gate port map(a=>e,b=>f,sel=>sel(0),out_mux16=>out_ef);
U4: mux16_gate port map(a=>g,b=>h,sel=>sel(0),out_mux16=>out_gh);

U5:mux16_gate port map(a=>out_ab,b=>out_cd,sel=>sel(1),out_mux16=>out_abcd);
U6:mux16_gate port map(a=>out_ef,b=>out_gh,sel=>sel(1),out_mux16=>out_efgh);

U7:mux16_gate port map(a=>out_abcd,b=>out_efgh,sel=>sel(2),out_mux16=>out_mux8way16);


end Behavioral;
