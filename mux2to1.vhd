library ieee;
use ieee.std_logic_1164.all;
 
entity mux2to1 is
	port(A, B: in std_logic_vector(7 downto 0);
			S: in std_logic;
			F: out std_logic_vector(7 downto 0));
end mux2to1;
 
architecture arch of mux2to1 is
begin
	process (A, B, S)
	begin
		if S = '0' then
			F <= A;
		else
			F <= B;
		end if;
	end process;
end;