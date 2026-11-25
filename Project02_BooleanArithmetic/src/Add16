library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Add16 is
   Port(
     a : in  STD_LOGIC_VECTOR (15 downto 0);
     b : in  STD_LOGIC_VECTOR (15 downto 0);
     out_add : out STD_LOGIC_VECTOR (15 downto 0)
    );
end Add16;

architecture Behavioral of Add16 is
component HalfAdder
  Port(
       a: in STD_LOGIC;
       b: in STD_LOGIC;
       sum : out STD_LOGIC;
       carry: out STD_LOGIC
);
end component;

component FullAdder
  Port(
       a:in STD_LOGIC;
       b:in STD_LOGIC;
       c:in STD_LOGIC;
       sum:out STD_LOGIC;
       C_out:out STD_LOGIC
);
end component;

signal c : STD_LOGIC_VECTOR (15 downto 0);


begin

HA0: HalfAdder port map (
        a     => a(0),
        b     => b(0),
        sum   => out_add(0),
        carry => c(0)
    );
GEN_ADDERS: for i in 1 to 15 generate
        FA_X: FullAdder port map (
            a     => a(i),
            b     => b(i),
            c     => c(i-1),
            sum   => out_add(i),
            C_out => c(i)
        );
    end generate GEN_ADDERS;

end Behavioral;
