----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.03.2026 23:40:43
-- Design Name: 
-- Module Name: tb_and_gate - Behavioral
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

entity tb_and_gate is
end tb_and_gate;

architecture Behavioral of tb_and_gate is
signal a:STD_LOGIC:= '0';
signal b : STD_LOGIC := '0';
signal out_and : STD_LOGIC;

component and_gate
Port(
            a : in STD_LOGIC;
            b : in STD_LOGIC;
            out_and : out STD_LOGIC
        );
    end component;

begin
uut: and_gate port map (
        a => a,
        b => b,
        out_and => out_and
    );
process
    begin
        -- Durum 1: 0 AND 0 = 0
        a <= '0'; b <= '0';
        wait for 20 ns;

        -- Durum 2: 0 AND 1 = 0
        a <= '0'; b <= '1';
        wait for 20 ns;

        -- Durum 3: 1 AND 0 = 0
        a <= '1'; b <= '0';
        wait for 20 ns;

        -- Durum 4: 1 AND 1 = 1
        a <= '1'; b <= '1';
        wait for 20 ns;

        wait; -- Simülasyonu bitir
    end process;

end Behavioral;
