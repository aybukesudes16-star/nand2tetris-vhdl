---------------------------------------------------------------------------------- 
-- Engineer: 
-- Create Date: 28.11.2026 15:01:11 
-- Module Name: RAM8 - Behavioral
-- Project Name: Nand2Tetris VHDL vers.
--8*16=128 bit storage
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RAM8 is
  Port (
   inRam:in STD_LOGIC_VECTOR (15 downto 0);
   load:in STD_LOGIC;
   address:in STD_LOGIC_VECTOR (2 downto 0);
   clk:in STD_lOGIC;
   outRam: out STD_LOGIC_VECTOR(15 downto 0)
 );
end RAM8;

architecture Behavioral of RAM8 is

component Dmux8way_gate
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
end component;

component mux8way16_gate
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
end component;

component Register16
        Port (
            in_reg  : in  STD_LOGIC_VECTOR (15 downto 0);
            load    : in  STD_LOGIC;
            clk     : in  STD_LOGIC;
            out_reg : out STD_LOGIC_VECTOR (15 downto 0)
        );
    end component;

signal load0, load1, load2, load3, load4, load5, load6, load7 : STD_LOGIC;
signal out0, out1, out2, out3, out4, out5, out6, out7 : STD_LOGIC_VECTOR (15 downto 0);

begin

U_DMUX: dmux8way_gate port map (
        in_dmux => load,
        sel     => address,
        a => load0, b => load1, c => load2, d => load3,
        e => load4, f => load5, g => load6, h => load7
    );

R0: Register16 port map (in_reg => in_ram, load => load0, clk => clk, out_reg => out0);
    R1: Register16 port map (in_reg => in_ram, load => load1, clk => clk, out_reg => out1);
    R2: Register16 port map (in_reg => in_ram, load => load2, clk => clk, out_reg => out2);
    R3: Register16 port map (in_reg => in_ram, load => load3, clk => clk, out_reg => out3);
    R4: Register16 port map (in_reg => in_ram, load => load4, clk => clk, out_reg => out4);
    R5: Register16 port map (in_reg => in_ram, load => load5, clk => clk, out_reg => out5);
    R6: Register16 port map (in_reg => in_ram, load => load6, clk => clk, out_reg => out6);
    R7: Register16 port map (in_reg => in_ram, load => load7, clk => clk, out_reg => out7);
U_MUX: mux8way16_gate port map (
        a => out0, b => out1, c => out2, d => out3,
        e => out4, f => out5, g => out6, h => out7,
        sel           => address,
        out_mux8way16 => out_ram
    );

end Behavioral;
