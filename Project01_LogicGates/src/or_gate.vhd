library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity or_gate is
   Port(
       a: in STD_LOGIC;
       b: in STD_LOGIC;
       out_or: out STD_LOGIC 
   );
end or_gate;


architecture Behavioral of or_gate is
component not_gate
    Port ( a : in STD_LOGIC; out_n : out STD_LOGIC );
end component;

component nand_gate
    Port ( a, b : in STD_LOGIC; out_n : out STD_LOGIC );
end component;

signal not_a : STD_LOGIC;
signal not_b : STD_LOGIC;

begin
U1: not_gate port map (
    a => a,
    out_n => not_a
);

U2: not_gate port map (
    a => b,       
    out_n => not_b
);
U3: nand_gate port map (  
    a => not_a,
    b => not_b,
    out_n => out_or
);

end Behavioral;
