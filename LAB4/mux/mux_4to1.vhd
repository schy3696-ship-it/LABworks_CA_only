library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_4TO1 is
    Port (
        I0  : in  STD_LOGIC;
        I1  : in  STD_LOGIC;
        I2  : in  STD_LOGIC;
        I3  : in  STD_LOGIC;
        S0  : in  STD_LOGIC;
        S1  : in  STD_LOGIC;
        Y   : out STD_LOGIC
    );
end entity MUX_4TO1;

architecture Behavioral of MUX_4TO1 is
begin
    process(I0, I1, I2, I3, S0, S1)
        variable sel : STD_LOGIC_VECTOR(1 downto 0);
    begin
        sel := S1 & S0;
        case sel is
            when "00" =>
                Y <= I0;
            when "01" =>
                Y <= I1;
            when "10" =>
                Y <= I2;
            when "11" =>
                Y <= I3;
            when others =>
                Y <= '0';
        end case;
    end process;
end architecture Behavioral;
