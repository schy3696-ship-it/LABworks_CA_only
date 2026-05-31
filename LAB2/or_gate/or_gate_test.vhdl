entity or_gate_test is
end or_gate_test;

architecture test of or_gate_test is

    signal A, B, Y : bit;

    component or_gate
        port (
            A : in bit;
            B : in bit;
            Y : out bit
        );
    end component;

begin

    uut: or_gate port map (
        A => A,
        B => B,
        Y => Y
    );

    process
    begin
        -- All input combinations

        A <= '0'; B <= '0'; wait for 10 ns;
        A <= '0'; B <= '1'; wait for 10 ns;
        A <= '1'; B <= '0'; wait for 10 ns;
        A <= '1'; B <= '1'; wait for 10 ns;

        wait; -- stop simulation
    end process;

end test;