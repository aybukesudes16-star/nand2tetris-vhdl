library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity not16_gate is
 Port(
     a: in STD_LOGIC_VECTOR(15 downto 0);
     out_not16: out STD_LOGIC_VECTOR(15 downto 0)
);

end not16_gate;

architecture Behavioral of not16_gate is
component not_gate
    Port(a: in STD_LOGIC;out_n: out STD_LOGIC);
end component;

begin
gen_not: for i in 0 to 15 generate
 U:not_gate port map (
    a=>a(i),
    out_n=>out_not16(i)
);
end generate;

end Behavioral;
