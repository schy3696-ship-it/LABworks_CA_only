library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DEMUX_1TO4 is
    Port (
        D  : in  STD_LOGIC;
        S0 : in  STD_LOGIC;
        S1 : in  STD_LOGIC;
        Y0 : out STD_LOGIC;
        Y1 : out STD_LOGIC;
        Y2 : out STD_LOGIC;
        Y3 : out STD_LOGIC
    );
end entity DEMUX_1TO4;

architecture Behavioral of DEMUX_1TO4 is
begin
    process(D, S0, S1)
        variable sel : STD_LOGIC_VECTOR(1 downto 0);
    begin
        -- Default outputs
        Y0 <= '0';
        Y1 <= '0';
        Y2 <= '0';
        Y3 <= '0';

        sel := S1 & S0;
        case sel is
            when "00" =>
                Y0 <= D;
            when "01" =>
                Y1 <= D;
            when "10" =>
                Y2 <= D;
            when "11" =>
                Y3 <= D;
            when others =>
                null;
        end case;
    end process;
end architecture Behavioral;
