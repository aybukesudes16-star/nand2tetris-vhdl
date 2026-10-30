----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.10.2026 23:01:42
-- Design Name: 
-- Module Name: mux4way16 - Behavioral
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

entity mux4way16 is
Port(
 a:in STD_LOGIC_VECTOR(15 downto 0);
 b:in STD_LOGIC_VECTOR(15 downto 0);
 c:in STD_LOGIC_VECTOR(15 downto 0);
 d:in STD_LOGIC_VECTOR(15 downto 0);
 sel:in STD_LOGIC_VECTOR(1 downto 0);
 out_mux4way16: out STD_LOGIC_VECTOR(15 downto 0)
);

end mux4way16;

architecture Behavioral of mux4way16 is
component mux16_gate
Port (
        a : in STD_LOGIC_VECTOR(15 downto 0);
        b : in STD_LOGIC_VECTOR(15 downto 0);
        sel : in STD_LOGIC;
        out_mux16 : out STD_LOGIC_VECTOR(15 downto 0)
    );
end component;
signal out_ab : STD_LOGIC_VECTOR(15 downto 0);
signal out_cd : STD_LOGIC_VECTOR(15 downto 0);

begin
U1: mux16_gate port map(a=>a,b=>b,sel=>sel(0),out_mux16=>out_ab);
U2: mux16_gate port map(a=>c,b=>d,sel=>sel(0),out_mux16=>out_cd);

U3:mux16_gate port map(a=>out_ab,b=>out_cd,sel=>sel(1),out_mux16=>out_mux4way16);


end Behavioral;
