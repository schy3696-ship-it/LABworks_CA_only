entity not_gate is
    port (
        A : in bit;
        Y : out bit
    );
end not_gate;

architecture behavior of not_gate is
begin
    Y <= not A;
end behavior;