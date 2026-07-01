library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_COMPARATOR_2BIT is
end entity TB_COMPARATOR_2BIT;

architecture Simulation of TB_COMPARATOR_2BIT is

    signal A  : STD_LOGIC_VECTOR(1 downto 0) := "00";
    signal B  : STD_LOGIC_VECTOR(1 downto 0) := "00";
    signal EQ : STD_LOGIC;
    signal GT : STD_LOGIC;
    signal LT : STD_LOGIC;

begin

    DUT : entity work.COMPARATOR_2BIT
        port map (
            A  => A,
            B  => B,
            EQ => EQ,
            GT => GT,
            LT => LT
        );

    STIMULUS : process
    begin
        -- Loop through all possible combinations of A and B (16 cases)
        for i in 0 to 3 loop
            for j in 0 to 3 loop
                A <= std_logic_vector(to_unsigned(i, 2));
                B <= std_logic_vector(to_unsigned(j, 2));
                wait for 10 ns;
            end loop;
        end loop;

        wait;
    end process STIMULUS;

end architecture Simulation;
