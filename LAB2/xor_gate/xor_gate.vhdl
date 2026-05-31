entity xor_gate is
    port (
        A : in bit;
        B : in bit;
        Y : out bit
    );
end xor_gate;

architecture behavior of xor_gate is
begin
    Y <= A xor B;
end behavior;