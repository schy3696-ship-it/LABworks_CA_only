entity xnor_gate is
    port (
        A : in bit;
        B : in bit;
        Y : out bit
    );
end xnor_gate;

architecture behavior of xnor_gate is
begin
    Y <= not (A xor B);
end behavior;