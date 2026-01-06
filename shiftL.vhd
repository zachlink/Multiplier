library ieee;
use ieee.std_logic_1164.all;

entity shiftL is 
    port (
        X_upper, X_lower : in  std_logic_vector(3 downto 0);
        F                : out std_logic_vector(7 downto 0)
    );
end shiftL;

architecture arch of shiftL is 
begin
    -- Logical shift left by 1
    F(7) <= X_upper(2);
    F(6) <= X_upper(1);
    F(5) <= X_upper(0);
    F(4) <= X_lower(3);
    F(3) <= X_lower(2);
    F(2) <= X_lower(1);
    F(1) <= X_lower(0);
    F(0) <= '0';  -- LSB filled with 0
end arch;
