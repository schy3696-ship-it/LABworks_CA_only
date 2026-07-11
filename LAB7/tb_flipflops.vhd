library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_FLIPFLOPS is
end entity TB_FLIPFLOPS;

architecture Simulation of TB_FLIPFLOPS is

    signal CLK : STD_LOGIC := '0';

    signal S, R : STD_LOGIC := '0';
    signal D    : STD_LOGIC := '0';
    signal J, K : STD_LOGIC := '0';
    signal T    : STD_LOGIC := '0';

    signal Q_SR, QB_SR : STD_LOGIC;
    signal Q_D, QB_D   : STD_LOGIC;
    signal Q_JK, QB_JK : STD_LOGIC;
    signal Q_T, QB_T   : STD_LOGIC;

    constant CLK_PERIOD : time := 20 ns;

begin

    -- Clock Generation
    CLK <= not CLK after CLK_PERIOD/2;

    U1 : entity work.SR_FF
        port map(
            CLK => CLK,
            S   => S,
            R   => R,
            Q   => Q_SR,
            QB  => QB_SR
        );

    U2 : entity work.D_FF
        port map(
            CLK => CLK,
            D   => D,
            Q   => Q_D,
            QB  => QB_D
        );

    U3 : entity work.JK_FF
        port map(
            CLK => CLK,
            J   => J,
            K   => K,
            Q   => Q_JK,
            QB  => QB_JK
        );

    U4 : entity work.T_FF
        port map(
            CLK => CLK,
            T   => T,
            Q   => Q_T,
            QB  => QB_T
        );

    STIMULUS : process
    begin

        -- SR Flip-Flop
        S <= '1'; R <= '0'; wait for 40 ns;
        S <= '0'; R <= '1'; wait for 40 ns;
        S <= '0'; R <= '0'; wait for 40 ns;

        -- D Flip-Flop
        D <= '1'; wait for 40 ns;
        D <= '0'; wait for 40 ns;

        -- JK Flip-Flop
        J <= '1'; K <= '0'; wait for 40 ns;
        J <= '1'; K <= '1'; wait for 40 ns;
        J <= '0'; K <= '1'; wait for 40 ns;

        -- T Flip-Flop
        T <= '1'; wait for 80 ns;
        T <= '0'; wait for 40 ns;
        wait;
    end process;

    monitor : process(CLK)
    begin
        if rising_edge(CLK) then
            report "CLK Rising Edge @ " & time'image(now) &
                   " | SR_FF: S=" & std_logic'image(S) & " R=" & std_logic'image(R) & " -> Q=" & std_logic'image(Q_SR) & " QB=" & std_logic'image(QB_SR) &
                   " | D_FF: D=" & std_logic'image(D) & " -> Q=" & std_logic'image(Q_D) & " QB=" & std_logic'image(QB_D) &
                   " | JK_FF: J=" & std_logic'image(J) & " K=" & std_logic'image(K) & " -> Q=" & std_logic'image(Q_JK) & " QB=" & std_logic'image(QB_JK) &
                   " | T_FF: T=" & std_logic'image(T) & " -> Q=" & std_logic'image(Q_T) & " QB=" & std_logic'image(QB_T);
        end if;
    end process;

end architecture Simulation;


