entity and_gate is
    port (
        A : in bit;
        B : in bit;
        Y : out bit
    );
end and_gate;

architecture behavior of and_gate is

    signal temp : bit;   -- internal signal

begin

    temp <= A and B;
    Y <= temp;

end behavior;