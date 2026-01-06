library ieee;
use ieee.std_logic_1164.all;

entity Final_Exam is
    port (
        NumA, NumB : in  std_logic_vector(3 downto 0);
        clk, reset : in  std_logic;
        RegR_out   : out std_logic_vector(7 downto 0)
    );
end Final_Exam;

architecture arch of Final_Exam is

    component mux2to1
        port (
            A, B : in  std_logic_vector(7 downto 0);
            S    : in  std_logic;
            F    : out std_logic_vector(7 downto 0)
        );
    end component;

    component eight_bit_adder
        port (
            X : in  std_logic_vector(7 downto 0);
            Y : in  std_logic_vector(7 downto 0);
            S : out std_logic_vector(7 downto 0);
            C : out std_logic
        );
    end component;

    component shiftR
        port (
            X : in  std_logic_vector(3 downto 0);
            F : out std_logic_vector(3 downto 0)
        );
    end component;

    component shiftL
        port (
            X_upper, X_lower : in  std_logic_vector(3 downto 0);
            F                : out std_logic_vector(7 downto 0)
        );
    end component;

    -- Registers
    signal RegA, RegA_out : std_logic_vector(7 downto 0);
    signal RegB, RegB_out : std_logic_vector(3 downto 0);
    signal RegR, RegR_next : std_logic_vector(7 downto 0);

    -- signals
    signal Add_out  : std_logic_vector(7 downto 0);
    signal Mux_out  : std_logic_vector(7 downto 0);
    signal carry    : std_logic;

begin


---shifts RegA
    SL : shiftL
        port map (
            X_upper => RegA(7 downto 4),
            X_lower => RegA(3 downto 0),
            F       => RegA_out
        );

---shifts RegB---
    SR : shiftR
        port map (
            X => RegB,
            F => RegB_out
        );

---Adder---
    ADDER : eight_bit_adder
        port map (
            X => RegA,
            Y => RegR,
            S => Add_out,
            C => carry
        );

---multiplexer
    MUX : mux2to1
        port map (
            A => RegR,
            B => Add_out,
            S => RegB(0),
            F => Mux_out
        );

    RegR_next <= Mux_out;

--- registers logic ---
    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                -- Load initial values
                RegA <= "0000" & NumA;
                RegB <= NumB;
                RegR <= (others => '0');
            else
                RegA <= RegA_out;
                RegB <= RegB_out;
                RegR <= RegR_next;
            end if;
        end if;
    end process;

    RegR_out <= RegR;

end arch;
