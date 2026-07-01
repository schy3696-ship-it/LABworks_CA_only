library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity COMPARATOR_2BIT is
    Port (
        A  : in  STD_LOGIC_VECTOR(1 downto 0);
        B  : in  STD_LOGIC_VECTOR(1 downto 0);
        EQ : out STD_LOGIC;  -- A = B
        GT : out STD_LOGIC;  -- A > B
        LT : out STD_LOGIC   -- A < B
    );
end entity COMPARATOR_2BIT;

architecture Behavioral of COMPARATOR_2BIT is
begin
    process(A, B)
    begin
        if unsigned(A) = unsigned(B) then
            EQ <= '1';
            GT <= '0';
            LT <= '0';

        elsif unsigned(A) > unsigned(B) then
            EQ <= '0';
            GT <= '1';
            LT <= '0';

        else
            EQ <= '0';
            GT <= '0';
            LT <= '1';
        end if;
    end process;
end architecture Behavioral;
