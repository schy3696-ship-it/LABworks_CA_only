library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity JK_FF is
    Port (
        CLK : in STD_LOGIC;
        J   : in STD_LOGIC;
        K   : in STD_LOGIC;
        Q   : out STD_LOGIC;
        QB  : out STD_LOGIC
    );
end entity JK_FF;

architecture Behavioral of JK_FF is
    signal Q_int : STD_LOGIC := '0';
begin

    process(CLK)
    begin
        if rising_edge(CLK) then

            if (J = '0' and K = '0') then
                null;                 -- Hold

            elsif (J = '0' and K = '1') then
                Q_int <= '0';         -- Reset

            elsif (J = '1' and K = '0') then
                Q_int <= '1';         -- Set

            else
                Q_int <= not Q_int;   -- Toggle
            end if;

        end if;
    end process;

    Q  <= Q_int;
    QB <= not Q_int;

end architecture Behavioral;
