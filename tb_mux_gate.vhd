----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.10.2026 20:18:53
-- Design Name: 
-- Module Name: tb_mux_gate - Behavioral
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


entity tb_mux_gate is
-- Testbench modüllerinin Port kısmı boş bırakılır

end tb_mux_gate;

architecture Behavioral of tb_mux_gate is
component mux_gate
        Port (
            a       : in STD_LOGIC;
            b       : in STD_LOGIC;
            sel     : in STD_LOGIC;
            out_mux : out STD_LOGIC
        );
    end component;

    signal s_a       : STD_LOGIC := '0';
    signal s_b       : STD_LOGIC := '0';
    signal s_sel     : STD_LOGIC := '0';
    signal s_out_mux : STD_LOGIC;
begin

uut: mux_gate port map (
        a       => s_a,
        b       => s_b,
        sel     => s_sel,
        out_mux => s_out_mux
    );
stim_proc: process
    begin
        -- Durum 1: sel = '0' iken çıkış A'yı takip etmeli
        s_sel <= '0'; s_a <= '0'; s_b <= '1'; wait for 10 ns; -- Çıkış '0' olmalı
        s_sel <= '0'; s_a <= '1'; s_b <= '0'; wait for 10 ns; -- Çıkış '1' olmalı

        -- Durum 2: sel = '1' iken çıkış B'yi takip etmeli
        s_sel <= '1'; s_a <= '0'; s_b <= '1'; wait for 10 ns; -- Çıkış '1' olmalı
        s_sel <= '1'; s_a <= '1'; s_b <= '0'; wait for 10 ns; -- Çıkış '0' olmalı

        -- Test bitti
        wait;
    end process;
end Behavioral;
