library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_decoder_2to4 is
end tb_decoder_2to4;

architecture sim of tb_decoder_2to4 is

    component DECODER_2TO4
        Port (
            A : in STD_LOGIC_VECTOR(1 downto 0);
            Y : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    signal A_tb : STD_LOGIC_VECTOR(1 downto 0) := "00";
    signal Y_tb : STD_LOGIC_VECTOR(3 downto 0);

begin

    uut: DECODER_2TO4
        port map(
            A => A_tb,
            Y => Y_tb
        );

    process
    begin
        A_tb <= "00"; wait for 20 ns;
        A_tb <= "01"; wait for 20 ns;
        A_tb <= "10"; wait for 20 ns;
        A_tb <= "11"; wait for 20 ns;

        wait;
    end process;

end sim;