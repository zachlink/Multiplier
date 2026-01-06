library ieee;
use ieee.std_logic_1164.all;

entity shiftR is 
    port (
        X : in  std_logic_vector(3 downto 0);
        F : out std_logic_vector(3 downto 0)
    );
end shiftR;

architecture arch of shiftR is 
begin
    F(3) <= '0';   -- MSB filled with 0
    F(2) <= X(3);
    F(1) <= X(2);
    F(0) <= X(1);
end arch;
