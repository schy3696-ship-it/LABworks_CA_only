entity nand_gate is
    port (
        A : in bit;
        B : in bit;
        Y : out bit
    );
end nand_gate;

architecture behavior of nand_gate is
begin
    Y <= not (A and B);
end behavior;