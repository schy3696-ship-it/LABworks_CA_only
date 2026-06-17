# VHDL Code for Realising Logic Gates (AND, OR, NOT, NAND, NOR, XOR, XNOR)

## Objective
To design and implement basic logic gates (AND, OR, NOT, NAND, NOR, XOR, XNOR) using VHDL and verify their functionality through simulation.

---

## Theory
VHDL (VHSIC Hardware Description Language) is used to describe digital circuits. Logic gates are the basic building blocks of digital systems.

### AND Gate
Output is 1 only when both inputs are 1.

### OR Gate
Output is 1 when at least one input is 1.

### NOT Gate
Inverts the input.

### NAND Gate
Inverse of AND gate output.

### NOR Gate
Inverse of OR gate output.

### XOR Gate
Output is 1 when inputs are different.

### XNOR Gate
Output is 1 when inputs are the same.

---

## VHDL Code

### AND Gate
```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AND_Gate is
    Port (
        A : in STD_LOGIC;
        B : in STD_LOGIC;
        Y : out STD_LOGIC
    );
end AND_Gate;

architecture Behavioral of AND_Gate is
begin
    Y <= A and B;
end Behavioral;
```
### OR Gate
```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OR_Gate is
    Port (
        A : in STD_LOGIC;
        B : in STD_LOGIC;
        Y : out STD_LOGIC
    );
end OR_Gate;

architecture Behavioral of OR_Gate is
begin
    Y <= A or B;
end Behavioral;
```
### NOT Gate
```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NOT_Gate is
    Port (
        A : in STD_LOGIC;
        Y : out STD_LOGIC
    );
end NOT_Gate;

architecture Behavioral of NOT_Gate is
begin
    Y <= not A;
end Behavioral;
```
### NAND Gate
```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NAND_Gate is
    Port (
        A : in STD_LOGIC;
        B : in STD_LOGIC;
        Y : out STD_LOGIC
    );
end NAND_Gate;

architecture Behavioral of NAND_Gate is
begin
    Y <= not (A and B);
end Behavioral;
```
### NOR Gate
```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NOR_Gate is
    Port (
        A : in STD_LOGIC;
        B : in STD_LOGIC;
        Y : out STD_LOGIC
    );
end NOR_Gate;

architecture Behavioral of NOR_Gate is
begin
    Y <= not (A or B);
end Behavioral;
```
### XOR Gate
```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity XOR_Gate is
    Port (
        A : in STD_LOGIC;
        B : in STD_LOGIC;
        Y : out STD_LOGIC
    );
end XOR_Gate;

architecture Behavioral of XOR_Gate is
begin
    Y <= A xor B;
end Behavioral;
```
### XNOR Gate
```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity XNOR_Gate is
    Port (
        A : in STD_LOGIC;
        B : in STD_LOGIC;
        Y : out STD_LOGIC
    );
end XNOR_Gate;

architecture Behavioral of XNOR_Gate is
begin
    Y <= not (A xor B);
end Behavioral;
```
