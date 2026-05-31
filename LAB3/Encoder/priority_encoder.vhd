library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PRIORITY_ENCODER is
    Port (
        D : in STD_LOGIC_VECTOR(3 downto 0);
        Y : out STD_LOGIC_VECTOR(1 downto 0)
    );
end PRIORITY_ENCODER;

architecture Behavioral of PRIORITY_ENCODER is
begin
    process(D)
    begin
        if D(3) = '1' then
            Y <= "11";
        elsif D(2) = '1' then
            Y <= "10";
        elsif D(1) = '1' then
            Y <= "01";
        elsif D(0) = '1' then
            Y <= "00";
        else
            Y <= "00";
        end if;
    end process;
end Behavioral;