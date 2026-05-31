entity not_gate_test is
end not_gate_test;

architecture test of not_gate_test is

    signal A, Y : bit;

    component not_gate
        port (
            A : in bit;
            Y : out bit
        );
    end component;

begin

    uut: not_gate port map (
        A => A,
        Y => Y
    );

    process
    begin
        -- Test input variations

        A <= '0'; wait for 10 ns;
        A <= '1'; wait for 10 ns;

        wait; -- stop simulation
    end process;

end test;