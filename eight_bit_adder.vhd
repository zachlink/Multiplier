library ieee;
use ieee.std_logic_1164.all;

entity eight_bit_adder is
    Port (
        X : in  STD_LOGIC_VECTOR(7 downto 0);
        Y : in  STD_LOGIC_VECTOR(7 downto 0);
        S : out STD_LOGIC_VECTOR(7 downto 0);
        C : out STD_LOGIC
    );
end eight_bit_adder;

architecture add of eight_bit_adder is

    component full_adder
        Port (
            X_FA    : in  STD_LOGIC;
            Y_FA    : in  STD_LOGIC;
            Cin_FA  : in  STD_LOGIC;
            Cout_FA : out STD_LOGIC;
            S_FA    : out STD_LOGIC
        );
    end component;

    signal temp1, temp2, temp3, temp4, temp5, temp6, temp7 : STD_LOGIC;

begin

    FA1 : full_adder port map (X(0), Y(0), '0', temp1, S(0));
    FA2 : full_adder port map (X(1), Y(1), temp1, temp2, S(1));
    FA3 : full_adder port map (X(2), Y(2), temp2, temp3, S(2));
    FA4 : full_adder port map (X(3), Y(3), temp3, temp4, S(3));
	 FA5 : full_adder port map (X(4), Y(4), temp4, temp5, S(4));
	 FA6 : full_adder port map (X(5), Y(5), temp5, temp6, S(5));
	 FA7 : full_adder port map (X(6), Y(6), temp6, temp7, S(6));
	 FA8 : full_adder port map (X(7), Y(7), temp7, C, S(7));

end add;
