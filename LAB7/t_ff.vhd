library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity T_FF is
    Port (
        CLK : in STD_LOGIC;
        T   : in STD_LOGIC;
        Q   : out STD_LOGIC;
        QB  : out STD_LOGIC
    );
end entity T_FF;

architecture Behavioral of T_FF is
    signal Q_int : STD_LOGIC := '0';
begin

    process(CLK)
    begin
        if rising_edge(CLK) then
            if T = '1' then
                Q_int <= not Q_int;
            end if;
        end if;
    end process;

    Q  <= Q_int;
    QB <= not Q_int;

end architecture Behavioral;
