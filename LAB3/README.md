# LAB 3: VHDL Code for Combinational Circuit (Encoder and Decoder)

## Objective
To design and implement combinational circuits such as Encoder and Decoder using VHDL and verify their functionality through simulation.

---

## Theory

### Combinational Circuits
Combinational circuits are digital circuits whose output depends only on the current input values, without any memory element.

---

## Encoder

### Definition
An encoder is a combinational circuit that converts multiple input lines into a smaller number of output lines.

### Example: 4-to-2 Encoder
A 4-to-2 encoder converts 4 input lines into 2 output lines.

| Inputs (I0 I1 I2 I3) | Outputs (Y1 Y0) |
|----------------------|-----------------|
| 0001                 | 00              |
| 0010                 | 01              |
| 0100                 | 10              |
| 1000                 | 11              |

---

## Decoder

### Definition
A decoder is a combinational circuit that converts binary input into multiple output lines.

### Example: 2-to-4 Decoder
A 2-to-4 decoder converts 2 input lines into 4 output lines.

| Inputs (A1 A0) | Outputs (Y0 Y1 Y2 Y3) |
|----------------|------------------------|
| 00             | 0001                   |
| 01             | 0010                   |
| 10             | 0100                   |
| 11             | 1000                   |

---

## VHDL Code (Concept Overview)

### Encoder (4-to-2)
```vhdl id="enc1"
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Encoder is
    Port (
        I : in STD_LOGIC_VECTOR(3 downto 0);
        Y : out STD_LOGIC_VECTOR(1 downto 0)
    );
end Encoder;

architecture Behavioral of Encoder is
begin
    process(I)
    begin
        case I is
            when "0001" => Y <= "00";
            when "0010" => Y <= "01";
            when "0100" => Y <= "10";
            when "1000" => Y <= "11";
            when others => Y <= "00";
        end case;
    end process;
end Behavioral;
```
### Decoder (2-to-4)
```vhdl id="dec1"
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decoder is
    Port (
        A : in STD_LOGIC_VECTOR(1 downto 0);
        Y : out STD_LOGIC_VECTOR(3 downto 0)
    );
end Decoder;

architecture Behavioral of Decoder is
begin
    process(A)
    begin
        case A is
            when "00" => Y <= "0001";
            when "01" => Y <= "0010";
            when "10" => Y <= "0100";
            when "11" => Y <= "1000";
            when others => Y <= "0000";
        end case;
    end process;
end Behavioral;
```
