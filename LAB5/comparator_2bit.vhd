library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity COMPARATOR_2BIT is
    Port (
        A  : in  STD_LOGIC_VECTOR(1 downto 0);
        B  : in  STD_LOGIC_VECTOR(1 downto 0);
        EQ : out STD_LOGIC;
        GT : out STD_LOGIC;
        LT : out STD_LOGIC
    );
end entity COMPARATOR_2BIT;

architecture Dataflow of COMPARATOR_2BIT is
begin

    -- Equal (XNOR checks equality)
    EQ <= (A(1) xnor B(1)) and
          (A(0) xnor B(0));

    -- Greater Than
    GT <= (A(1) and (not B(1))) or
          ((A(1) xnor B(1)) and A(0) and (not B(0)));

    -- Less Than
    LT <= ((not A(1)) and B(1)) or
          ((A(1) xnor B(1)) and (not A(0)) and B(0));

end architecture Dataflow;
