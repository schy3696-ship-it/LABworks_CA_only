library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_FF is
    Port (
        CLK : in STD_LOGIC;
        D   : in STD_LOGIC;
        Q   : out STD_LOGIC;
        QB  : out STD_LOGIC
    );
end entity D_FF;

architecture Behavioral of D_FF is
    signal Q_int : STD_LOGIC := '0';
begin

    process(CLK)
    begin
        if rising_edge(CLK) then
            Q_int <= D;
        end if;
    end process;

    Q  <= Q_int;
    QB <= not Q_int;

end architecture Behavioral;
