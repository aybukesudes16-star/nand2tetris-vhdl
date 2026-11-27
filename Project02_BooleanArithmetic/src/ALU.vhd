
----------------------------------------------------------------------------------
-- Engineer: Aybüke
-- Create Date: 26.11.2026 22:56:03
-- Module Name: ALU - Behavioral
-- Description: Arithmetic logic unit
--Definition of ALU 
--if (zx == 1) set x = 0
--if (nx == 1) set x = !x
--if (f == 1) set out = x + y else set out = x & y
--if (no == 1) set out = !out
--if (out == 0) set zr = 1 ve if (out < 0) set ng = 1
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ALU is
    Port ( 
       x: in STD_LOGIC_VECTOR (15 downto 0);
       y: in STD_LOGIC_VECTOR (15 downto 0);
       zx: in STD_LOGIC;
       nx: in STD_LOGIC;
       zy: in STD_LOGIC;
       ny: in STD_LOGIC;
       f: in STD_LOGIC;
       no: in STD_LOGIC;
       out_ALU:out STD_LOGIC_VECTOR (15 downto 0);
       zr : out STD_LOGIC;
       ng : out STD_LOGIC
);
end ALU;

architecture Behavioral of ALU is

component mux16_gate
Port(
  a: in STD_LOGIC_VECTOR(15 downto 0);
  b: in STD_LOGIC_VECTOR(15 downto 0);
  sel: in STD_LOGIC;
  out_mux16: out STD_LOGIC_VECTOR(15 downto 0)
);
end component;

component not16_gate
 Port(
     a: in STD_LOGIC_VECTOR(15 downto 0);
     out_not16: out STD_LOGIC_VECTOR(15 downto 0)
);
end component;

component and16_gate
Port(
     a: in STD_LOGIC_VECTOR(15 downto 0);
     b : in STD_LOGIC_VECTOR(15 downto 0);
     out_and16: out STD_LOGIC_VECTOR(15 downto 0)
);
end component;

component Add16
   Port(
     a : in  STD_LOGIC_VECTOR (15 downto 0);
     b : in  STD_LOGIC_VECTOR (15 downto 0);
     out_add : out STD_LOGIC_VECTOR (15 downto 0)
    );
end component;

component or8way_gate
   Port(
   in_bus: in STD_LOGIC_VECTOR(7 downto 0);
   out_or8way: out STD_LOGIC
);
end component;

component or_gate
   Port(
       a: in STD_LOGIC;
       b: in STD_LOGIC;
       out_or: out STD_LOGIC 
   );
end component;

component not_gate
    Port (
        a : in STD_LOGIC;
        out_n : out STD_LOGIC
    );
end component;

    signal x1, not_x1, x2                  : STD_LOGIC_VECTOR (15 downto 0);
    signal y1, not_y1, y2                  : STD_LOGIC_VECTOR (15 downto 0);
    signal out_x_And_y, outAdd_x_y         : STD_LOGIC_VECTOR (15 downto 0);
    signal out_f, out_not_f, out_no        : STD_LOGIC_VECTOR (15 downto 0);
    signal outfirst8, outlast8, out_or, out_not_or : STD_LOGIC;

begin

U1:mux16_gate port map(
   a=>x,
   b=>x"0000",
   sel=>zx,
   out_mux16=>x1
);

U2:not16_gate port map(
   a=>x1,
   out_not16=>not_x1);

U3:mux16_gate port map(
   a=>x1,
   b=>not_x1,
   sel=>nx,
   out_mux16=>x2
);
U4:mux16_gate port map(
   a=>y,
   b=>x"0000",
   sel=>zy,
   out_mux16=>y1
);

U5:not16_gate port map(
   a=>y1,
   out_not16=>not_y1);

U6:mux16_gate port map(
   a=>y1,
   b=>not_y1,
   sel=>ny,
   out_mux16=>y2
);

U7:and16_gate port map(
  a=>x2,
  b=>y2,
  out_and16=>out_x_And_y
);

U8:Add16 port map(
  a=>x2,
  b=>y2,
  out_add=>outAdd_x_y
);

U9:mux16_gate port map(
  a=>out_x_And_y,
  b=>outAdd_x_y,
  sel=>f,
  out_mux16=>out_f
);

U10:not16_gate port map(
  a=>out_f,
  out_not16=>out_not_f
);
U11: mux16_gate port map(
  a=>out_f,
  b=>out_not_f,
  sel=>no,
  out_mux16=>out_no
);
U12: or8way_gate port map(
  in_bus=>out_no(7 downto 0),
  out_or8way=>outfirst8
);
U13: or8way_gate port map(
  in_bus=>out_no(15downto 8),
  out_or8way=>outlast8
);
U14: or_gate port map(
  a=>outfirst8,
  b=>outlast8,
  out_or=>out_or
);
U15: not_gate port map(
  a=>out_or,
  out_n=>out_not_or
);

out_ALU <= out_no;

zr <= out_not_or;

ng <= out_no(15);

end Behavioral;
