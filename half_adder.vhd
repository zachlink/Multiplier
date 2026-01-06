library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity half_adder is
    Port (
        X_HA : in  STD_LOGIC;
        Y_HA : in  STD_LOGIC;
        S_HA : out STD_LOGIC;
        C_HA : out STD_LOGIC
    );
end half_adder;

architecture Behavioral of half_adder is
begin
    S_HA <= X_HA XOR Y_HA;
    C_HA <= X_HA AND Y_HA;
end Behavioral;