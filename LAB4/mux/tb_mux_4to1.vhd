library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_MUX_4TO1 is
end entity TB_MUX_4TO1;

architecture Simulation of TB_MUX_4TO1 is

    signal I0, I1, I2, I3 : STD_LOGIC := '0';
    signal S0, S1         : STD_LOGIC := '0';
    signal Y              : STD_LOGIC;

begin

    DUT : entity work.MUX_4TO1
        port map (
            I0 => I0,
            I1 => I1,
            I2 => I2,
            I3 => I3,
            S0 => S0,
            S1 => S1,
            Y  => Y
        );

    STIMULUS : process
    begin
        -- Test 1
        I0 <= '1'; I1 <= '0'; I2 <= '0'; I3 <= '0';
        S1 <= '0'; S0 <= '0';
        wait for 10 ns;

        -- Test 2
        I0 <= '0'; I1 <= '1'; I2 <= '0'; I3 <= '0';
        S1 <= '0'; S0 <= '1';
        wait for 10 ns;

        -- Test 3
        I0 <= '0'; I1 <= '0'; I2 <= '1'; I3 <= '0';
        S1 <= '1'; S0 <= '0';
        wait for 10 ns;

        -- Test 4
        I0 <= '0'; I1 <= '0'; I2 <= '0'; I3 <= '1';
        S1 <= '1'; S0 <= '1';
        wait for 10 ns;

        wait;
    end process STIMULUS;

end architecture Simulation;
