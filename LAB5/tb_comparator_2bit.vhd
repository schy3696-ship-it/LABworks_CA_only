library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

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

        -- A = B
        A <= "00"; B <= "00"; wait for 10 ns;

        -- A > B
        A <= "01"; B <= "00"; wait for 10 ns;

        -- A < B
        A <= "00"; B <= "01"; wait for 10 ns;

        -- A < B
        A <= "10"; B <= "11"; wait for 10 ns;

        -- A > B
        A <= "11"; B <= "10"; wait for 10 ns;

        -- A = B
        A <= "11"; B <= "11"; wait for 10 ns;

        wait;

    end process;

end architecture Simulation;
