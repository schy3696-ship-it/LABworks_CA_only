entity nor_gate is
    port (
        A : in bit;
        B : in bit;
        Y : out bit
    );
end nor_gate;

architecture behavior of nor_gate is
begin
    Y <= not (A or B);
end behavior;