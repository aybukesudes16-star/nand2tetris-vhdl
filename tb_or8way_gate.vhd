----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.10.2026 20:38:47
-- Design Name: 
-- Module Name: tb_or8way_gate - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

entity tb_or8way_gate is
-- Testbench entity kismi bostur
end tb_or8way_gate;

architecture Behavioral of tb_or8way_gate is

    -- Test edilecek modul
    component or8way_gate
        Port(
            in_bus     : in STD_LOGIC_VECTOR(7 downto 0);
            out_or8way : out STD_LOGIC
        );
    end component;

    signal s_in_bus     : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal s_out_or8way : STD_LOGIC;

begin

    -- Devre baglantisi (UUT)
    uut: or8way_gate port map (
        in_bus     => s_in_bus,
        out_or8way => s_out_or8way
    );

    -- Otomatik Test Sureci
    stim_proc: process
        variable expected_out : STD_LOGIC;
    begin
        -- 0'dan 255'e kadar olan tum 8-bitlik durumlari donguye aliyoruz
        for i in 0 to 255 loop
            s_in_bus <= std_logic_vector(to_unsigned(i, 8));
            wait for 10 ns;

            -- Beklenen dogru mantik: Giris "00000000" ise cikis '0', aksi halde '1' olmali
            if s_in_bus = "00000000" then
                expected_out := '0';
            else
                expected_out := '1';
            end if;

            -- OTOMATIK KONTROL
            assert (s_out_or8way = expected_out)
                report "HATA: Cikis yanlis uretildi!"
                severity ERROR;

        end loop;

        -- Test basarili bitince konsola yazdirilacak mesaj
        report "TEST BASARILI! Tum 256 durum test edildi." severity NOTE;
        
        wait;
    end process;

end Behavioral;
