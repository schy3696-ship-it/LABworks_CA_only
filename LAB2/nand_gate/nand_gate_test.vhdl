entity nand_gate_test is
end nand_gate_test;

architecture test of nand_gate_test is

    signal A, B, Y : bit;

    component nand_gate
        port (
            A : in bit;
            B : in bit;
            Y : out bit
        );
    end component;

begin

    uut: nand_gate port map (
        A => A,
        B => B,
        Y => Y
    );

    process
    begin
        -- Test all input combinations

        A <= '0'; B <= '0'; wait for 10 ns;
        A <= '0'; B <= '1'; wait for 10 ns;
        A <= '1'; B <= '0'; wait for 10 ns;
        A <= '1'; B <= '1'; wait for 10 ns;

        wait;  -- stop simulation here
    end process;

end test;
