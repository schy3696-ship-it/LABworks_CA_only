library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_priority_encoder is
end tb_priority_encoder;

architecture sim of tb_priority_encoder is

    component PRIORITY_ENCODER
        Port (
            D : in STD_LOGIC_VECTOR(3 downto 0);
            Y : out STD_LOGIC_VECTOR(1 downto 0)
        );
    end component;

    signal D_tb : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal Y_tb : STD_LOGIC_VECTOR(1 downto 0);

begin

    uut: PRIORITY_ENCODER
        port map(
            D => D_tb,
            Y => Y_tb
        );

    process
    begin
        D_tb <= "0001"; wait for 20 ns;
        D_tb <= "0010"; wait for 20 ns;
        D_tb <= "0100"; wait for 20 ns;
        D_tb <= "1000"; wait for 20 ns;
        D_tb <= "1010"; wait for 20 ns;
        D_tb <= "1111"; wait for 20 ns;

        wait;
    end process;

end sim;