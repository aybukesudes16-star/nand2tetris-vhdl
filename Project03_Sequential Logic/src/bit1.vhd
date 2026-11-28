library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity bit1 is
   Port ( 
       in_bit: in STD_LOGIC;
       load: in STD_LOGIC;
       clk: in STD_LOGIC;
       out_bit: out STD_LOGIC

);
end bit1;

architecture Behavioral of bit1 is

component mux_gate
  Port(
     a:in STD_LOGIC;
     b:in STD_LOGIC;
     sel:in STD_LOGIC;
     out_mux:out STD_LOGIC
);
end component;

component DFF
   Port(
      d:in STD_LOGIC;
      clk: in STD_LOGIC;
      q: out STD_LOGIC

);
end component;

signal mux_out : STD_LOGIC;
signal dff_out : STD_LOGIC;

begin

U1: mux_gate port map(
    a=>dff_out, --load=0 eski değer
    b=>in_bit,--load=1 yeni değer.
    sel=>load,
    out_mux=>mux_out
);

U2: DFF port map(
    d=>mux_out,
    clk=>clk,
    q=>dff_out
);

out_bit<=dff_out;


end Behavioral;
