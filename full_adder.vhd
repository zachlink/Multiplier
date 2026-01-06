library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity full_adder is
    Port (
        X_FA    : in  STD_LOGIC;
        Y_FA    : in  STD_LOGIC;
        Cin_FA  : in  STD_LOGIC;
        Cout_FA : out STD_LOGIC;
        S_FA    : out STD_LOGIC
    );
end full_adder;

architecture Behavioral of full_adder is

    signal S_low   : STD_LOGIC;
    signal C_low   : STD_LOGIC;
    signal C_high  : STD_LOGIC;

    component half_adder
        Port (
            X_HA : in  STD_LOGIC;
            Y_HA : in  STD_LOGIC;
            S_HA : out STD_LOGIC;
            C_HA : out STD_LOGIC
        );
    end component;

begin

    HA_low  : half_adder port map (X_FA, Y_FA, S_low, C_low);
    HA_high : half_adder port map (Cin_FA, S_low, S_FA, C_high);

    Cout_FA <= C_low OR C_high;

end Behavioral;