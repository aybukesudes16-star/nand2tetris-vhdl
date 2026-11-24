----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Aybüke
-- 
-- Create Date: 24.11.2026 22:26:22
-- Design Name: 
-- Module Name: HalfAdder - Behavioral
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


entity HalfAdder is
   Port(
       a: in STD_LOGIC;
       b: in STD_LOGIC;
       sum : out STD_LOGIC;
       carry : out STD_LOGIC
);
end HalfAdder;

architecture Behavioral of HalfAdder is
component xor_gate
  Port(
   a,b:in STD_LOGIC; out_xor:out STD_LOGIC);
end component;

component and_gate
  Port(
   a,b:in STD_LOGIC; out_and:out STD_LOGIC);
end component;

begin

U1:xor_gate port map(
   a=>a,
   b=>b,
   out_xor=>sum);

U2:and_gate port map(
   a=>a,
   b=>b,
   out_and=>carry);


end Behavioral;
