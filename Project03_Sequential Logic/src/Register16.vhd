----------------------------------------------------------------------------------
-- Engineer: Aybüke
-- Create Date: 28.11.2026 14:39:46
-- Module Name: Register16 - Behavioral
-- Project Name: Nand2Tetris VHDL vers.
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Register16 is
    Port (
       in_reg: in STD_LOGIC_VECTOR(15  downto 0);
       load: in STD_LOGIC;
       clk: in STD_LOGIC;
       out_reg: out STD_LOGIC_VECTOR(15  downto 0)

 );
end Register16;

architecture Behavioral of Register16 is

component bit1
   Port(
        in_bit: in STD_LOGIC;
        load: in STD_LOGIC;
        clk: in STD_LOGIC;
        out_bit: out STD_LOGIC
);
end component;

begin
GEN_REG: for i in 0 to 15 generate
            U_BIT: bit1 port map (
            in_bit  => in_reg(i),
            load    => load,
            clk     => clk,
            out_bit => out_reg(i)
        );
    end generate GEN_REG;

end Behavioral;
