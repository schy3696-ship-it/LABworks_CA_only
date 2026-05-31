entity xor_gate_test is
end xor_gate_test;

architecture test of xor_gate_test is

    signal A, B, Y : bit;

    component xor_gate
        port (
            A : in bit;
            B : in bit;
            Y : out bit
        );
    end component;

begin

    uut: xor_gate port map (
        A => A,
        B => B,
        Y => Y
    );

    process
    begin
        A <= '0'; B <= '0'; wait for 10 ns;
        A <= '0'; B <= '1'; wait for 10 ns;
        A <= '1'; B <= '0'; wait for 10 ns;
        A <= '1'; B <= '1'; wait for 10 ns;

        wait;
    end process;

end test;