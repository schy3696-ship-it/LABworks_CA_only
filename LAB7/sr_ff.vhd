library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SR_FF is
    Port (
        CLK : in STD_LOGIC;
        S   : in STD_LOGIC;
        R   : in STD_LOGIC;
        Q   : out STD_LOGIC;
        QB  : out STD_LOGIC
    );
end entity SR_FF;

architecture Behavioral of SR_FF is
    signal Q_int : STD_LOGIC := '0';
begin

    process(CLK)
    begin
        if rising_edge(CLK) then
            if (S = '0' and R = '0') then
                null;                 -- Hold
            elsif (S = '0' and R = '1') then
                Q_int <= '0';         -- Reset
            elsif (S = '1' and R = '0') then
                Q_int <= '1';         -- Set
            end if;                   -- S=1,R=1 Forbidden
        end if;
    end process;

    Q  <= Q_int;
    QB <= not Q_int;

end architecture Behavioral;
