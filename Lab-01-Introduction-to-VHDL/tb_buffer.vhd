library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Testbench has no ports
entity BUFFER_TB is
end entity BUFFER_TB;

architecture Simulation of BUFFER_TB is
    -- Signals to connect to the Design Under Test (DUT)
    signal tb_A : STD_LOGIC := '0';
    signal tb_Y : STD_LOGIC;
begin
    -- Instantiate the Design Under Test (DUT)
    DUT : entity work.MY_BUFFER
        port map (
            A => tb_A,
            Y => tb_Y
        );

    -- Stimulus process: toggle the input
    STIMULUS : process
    begin
        tb_A <= '0'; wait for 10 ns; -- Y should be '0'
        tb_A <= '1'; wait for 10 ns; -- Y should be '1'
        tb_A <= '0'; wait for 10 ns; -- Y should be '0'

        wait; -- End simulation
    end process STIMULUS;

end architecture Simulation;