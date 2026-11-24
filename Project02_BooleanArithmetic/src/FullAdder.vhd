----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.11.2026 23:13:45
-- Design Name: 
-- Module Name: FullAdder - Behavioral
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

entity FullAdder is
  Port(
       a:in STD_LOGIC;
       b:in STD_LOGIC;
       c:in STD_LOGIC;
       sum:out STD_LOGIC;
       C_out:out STD_LOGIC
);
end FullAdder;

architecture Behavioral of FullAdder is
component HalfAdder
  Port(
       a: in STD_LOGIC;
       b: in STD_LOGIC;
       sum : out STD_LOGIC;
       carry: out STD_LOGIC
);
end component;
component Or_gate
  Port(
       a: in STD_LOGIC;
       b: in STD_LOGIC;
       out_or:out STD_LOGIC
);
end component;
signal s1, c1, c2 : STD_LOGIC;

begin

U1: HalfAdder port map(
    a=>a,
    b=>b,
    sum=>s1,
    carry=>c1); 

U2: HalfAdder port map(
    a=>s1,
    b=>c,
    sum=>sum,
    carry=>c2); 

U3: Or_gate port map(
    a=>c1,
    b=>c2,
    out_or=>C_out
); 

end Behavioral;
