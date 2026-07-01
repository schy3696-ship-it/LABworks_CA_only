library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_DEMUX_1TO4 is
end entity TB_DEMUX_1TO4;

architecture Simulation of TB_DEMUX_1TO4 is

    signal D  : STD_LOGIC := '0';
    signal S0 : STD_LOGIC := '0';
    signal S1 : STD_LOGIC := '0';
    signal Y0 : STD_LOGIC;
    signal Y1 : STD_LOGIC;
    signal Y2 : STD_LOGIC;
    signal Y3 : STD_LOGIC;

begin

    DUT : entity work.DEMUX_1TO4
        port map (
            D  => D,
            S0 => S0,
            S1 => S1,
            Y0 => Y0,
            Y1 => Y1,
            Y2 => Y2,
            Y3 => Y3
        );

    STIMULUS : process
    begin
        -- Test with input D = '1'
        D <= '1';
        
        -- Route to Y0 (S1 S0 = "00")
        S1 <= '0'; S0 <= '0'; wait for 10 ns;

        -- Route to Y1 (S1 S0 = "01")
        S1 <= '0'; S0 <= '1'; wait for 10 ns;

        -- Route to Y2 (S1 S0 = "10")
        S1 <= '1'; S0 <= '0'; wait for 10 ns;

        -- Route to Y3 (S1 S0 = "11")
        S1 <= '1'; S0 <= '1'; wait for 10 ns;

        -- Test with input D = '0'
        D <= '0';
        S1 <= '0'; S0 <= '0'; wait for 10 ns;
        S1 <= '1'; S0 <= '1'; wait for 10 ns;

        wait;
    end process STIMULUS;

end architecture Simulation;
