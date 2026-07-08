# LAB 6: VHDL Code for Code Converters

This laboratory covers the design, implementation, and simulation of two types of code converters using **VHDL**:
1. **BCD to Excess-3 Code Converter** (located in [`BDC_EX3`](BDC_EX3))
2. **Binary to Gray Code Converter** (located in [`BIN_GRAY`](BIN_GRAY))

The functionality of both converters is verified using testbenches and GTKWave waveform analysis.

---

## Objectives

- To design and implement BCD-to-Excess-3 and Binary-to-Gray code converters in VHDL.
- To verify the conversion logics using VHDL testbenches.
- To compile and simulate both designs using **GHDL** and analyze waveforms using **GTKWave**.

---

## Software Used

- **VHDL** – Hardware Description Language
- **GHDL** – Open-source VHDL compiler & simulator
- **GTKWave** – Waveform viewer for VCD files
- **Visual Studio Code (VS Code)** – Code editor

---

## 1. BCD to Excess-3 Code Converter (`BDC_EX3`)

### Theory & Truth Table
Excess-3 code is a non-weighted, self-complementing code used to express decimal numbers. It is obtained by adding binary 3 (0011) to each 4-bit BCD digit representing decimal numbers 0 to 9.

| Decimal | BCD Input (BCD3 BCD2 BCD1 BCD0) | Excess-3 Output (XS3_3 XS3_2 XS3_1 XS3_0) |
|:---:|:---:|:---:|
| 0 | 0000 | 0011 |
| 1 | 0001 | 0100 |
| 2 | 0010 | 0101 |
| 3 | 0011 | 0110 |
| 4 | 0100 | 0111 |
| 5 | 0101 | 1000 |
| 6 | 0110 | 1001 |
| 7 | 0111 | 1010 |
| 8 | 1000 | 1011 |
| 9 | 1001 | 1100 |

### VHDL Source Code

* **Design File ([bcd_to_xs3.vhd](BDC_EX3/bcd_to_xs3.vhd)):**
```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity BCD_TO_XS3 is
    port (
        BCD : in  std_logic_vector(3 downto 0); -- BCD input (0-9)
        XS3 : out std_logic_vector(3 downto 0)  -- Excess-3 output
    );
end entity BCD_TO_XS3;

architecture Behavioral of BCD_TO_XS3 is
begin
    process(BCD)
    begin
        -- Add 3 to BCD input
        XS3 <= std_logic_vector(unsigned(BCD) + 3);
    end process;
end architecture Behavioral;
```

* **Testbench File ([bcd_xs3_tb.vhd](BDC_EX3/bcd_xs3_tb.vhd)):**
```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BCD_XS3_TB is
end entity BCD_XS3_TB;

architecture Simulation of BCD_XS3_TB is
    signal BCD : std_logic_vector(3 downto 0) := "0000";
    signal XS3 : std_logic_vector(3 downto 0);
begin

    DUT : entity work.BCD_TO_XS3 
        port map ( 
            BCD => BCD, 
            XS3 => XS3 
        );

    STIMULUS : process
    begin
        BCD <= "0000"; wait for 10 ns; -- 0 -> 0011
        BCD <= "0001"; wait for 10 ns; -- 1 -> 0100
        BCD <= "0101"; wait for 10 ns; -- 5 -> 1000
        BCD <= "1001"; wait for 10 ns; -- 9 -> 1100
        wait;
    end process;

end architecture Simulation;
```

### Simulation Output Waveform

Below is the simulation output waveform for the BCD to Excess-3 conversion:

![BCD to Excess-3 Waveform](BDC_EX3/image.png)

---

## 2. Binary to Gray Code Converter (`BIN_GRAY`)

### Theory & Truth Table
Gray code is an unweighted code where two successive integers differ by exactly one binary bit. For a 4-bit Binary input $B$ and 4-bit Gray output $G$, the conversion equations are:
* $G_3 = B_3$ (MSB remains unchanged)
* $G_2 = B_3 \oplus B_2$
* $G_1 = B_2 \oplus B_1$
* $G_0 = B_1 \oplus B_0$

| Decimal | Binary Input (B3 B2 B1 B0) | Gray Code Output (G3 G2 G1 G0) |
|:---:|:---:|:---:|
| 0 | 0000 | 0000 |
| 1 | 0001 | 0001 |
| 2 | 0010 | 0011 |
| 3 | 0011 | 0010 |
| 4 | 0100 | 0110 |
| 5 | 0101 | 0111 |
| 6 | 0110 | 0101 |
| 7 | 0111 | 0100 |
| 8 | 1000 | 1100 |
| 9 | 1001 | 1101 |
| 10 | 1010 | 1111 |
| 11 | 1011 | 1110 |
| 12 | 1100 | 1010 |
| 13 | 1101 | 1011 |
| 14 | 1110 | 1001 |
| 15 | 1111 | 1000 |

### VHDL Source Code

* **Design File ([bin_to_gray.vhd](BIN_GRAY/bin_to_gray.vhd)):**
```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BIN_TO_GRAY is
    port (
        B : in std_logic_vector(3 downto 0);   -- 4-bit binary input
        G : out std_logic_vector(3 downto 0)   -- 4-bit Gray code output
    );
end entity BIN_TO_GRAY;

architecture Dataflow of BIN_TO_GRAY is
begin
    G(3) <= B(3);               -- MSB stays the same
    G(2) <= B(3) xor B(2);
    G(1) <= B(2) xor B(1);
    G(0) <= B(1) xor B(0);
end architecture Dataflow;
```

* **Testbench File ([gray_tb.vhd](BIN_GRAY/gray_tb.vhd)):**
```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity GRAY_TB is
end entity GRAY_TB;

architecture Simulation of GRAY_TB is
    signal B : std_logic_vector(3 downto 0) := "0000";
    signal G : std_logic_vector(3 downto 0);
begin

    DUT : entity work.BIN_TO_GRAY 
        port map (
            B => B, 
            G => G
        );

    STIMULUS : process
    begin
        B <= "0000"; wait for 10 ns; -- Gray : 0000
        B <= "0001"; wait for 10 ns; -- Gray : 0001
        B <= "0010"; wait for 10 ns; -- Gray : 0011
        B <= "0011"; wait for 10 ns; -- Gray : 0010
        B <= "0100"; wait for 10 ns; -- Gray : 0110
        B <= "1111"; wait for 10 ns; -- Gray : 1000
        wait;
    end process;

end architecture Simulation;
```

### Simulation Output Waveform

Below is the simulation output waveform for the Binary to Gray conversion:

![Binary to Gray Waveform](BIN_GRAY/image.png)

---

## How to Compile & Run

### For BCD to Excess-3:
```bash
cd BDC_EX3
ghdl -a bcd_to_xs3.vhd bcd_xs3_tb.vhd
ghdl -e bcd_xs3_tb
ghdl -r bcd_xs3_tb --vcd=bcd_xs3.vcd
gtkwave bcd_xs3.vcd
```

### For Binary to Gray:
```bash
cd BIN_GRAY
ghdl -a bin_to_gray.vhd gray_tb.vhd
ghdl -e gray_tb
ghdl -r gray_tb --vcd=gray.vcd
gtkwave gray.vcd
```
