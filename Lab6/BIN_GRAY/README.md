# LAB 6: VHDL Code for Binary to Gray Code Converter

This laboratory covers the design, implementation, and simulation of a code converter—specifically a **Binary to Gray Code Converter**—using **VHDL**. The functionality is verified through a testbench and GTKWave waveform analysis.

---

## Objective

- To design and implement a 4-bit Binary to Gray Code Converter in VHDL.
- To verify the conversion logic using a VHDL testbench.
- To compile and simulate the design using **GHDL** and analyze waveforms using **GTKWave**.

---

## Theory & Truth Tables

A Binary to Gray Code Converter translates standard binary integers into Gray code. Gray code is an unweighted code where two successive integers differ by exactly one binary bit. This unit-distance property helps prevent transient errors in digital hardware communication.

For a 4-bit Binary input $B$ and 4-bit Gray output $G$, the conversion equations are:
* $G_3 = B_3$ (MSB stays same)
* $G_2 = B_3 \oplus B_2$
* $G_1 = B_2 \oplus B_1$
* $G_0 = B_1 \oplus B_0$

#### Truth Table
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

---

## Software Used

- **VHDL** – Hardware Description Language
- **GHDL** – Open-source VHDL compiler & simulator
- **GTKWave** – Waveform viewer for VCD files
- **Visual Studio Code (VS Code)** – Code editor

---

## Project Structure & Files

The files are organized directly inside this directory:

| File | Description | Link |
|:---|:---|:---|
| [bin_to_gray.vhd](bin_to_gray.vhd) | Design File (Binary to Gray) | [bin_to_gray.vhd](bin_to_gray.vhd) |
| [gray_tb.vhd](gray_tb.vhd) | Testbench File | [gray_tb.vhd](gray_tb.vhd) |
| [gray.vcd](gray.vcd) | Waveform File | [gray.vcd](gray.vcd) |
| [image.png](image.png) | Simulation Waveform Screenshot | [image.png](image.png) |

---

## VHDL Design & Testbench Codes

### 1. Binary to Gray Converter
* **Design:** `bin_to_gray.vhd`
```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BIN_TO_GRAY is
    port (
        B : in std_logic_vector(3 downto 0);   -- 4 -bit binary input
        G : out std_logic_vector(3 downto 0)   -- 4 -bit Gray code output
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

* **Testbench:** `gray_tb.vhd`
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

---

## Simulation Result Waveform

Below is the output wave captured from GTKWave, illustrating the transition from standard binary inputs to Gray code output:

![Binary to Gray Waveform](image.png)

---

## How to Run the Simulation

You can compile and simulate the circuit using **GHDL** in your command line:

```bash
# Compile design and testbench
ghdl -a bin_to_gray.vhd gray_tb.vhd

# Elaborate testbench entity
ghdl -e gray_tb

# Run simulation to output VCD
ghdl -r gray_tb --vcd=gray.vcd

# View waveforms using GTKWave
gtkwave gray.vcd
```

---

## Discussion & Conclusion

The 4-bit Binary to Gray Code Converter was successfully designed and verified in VHDL. Dataflow modeling style was implemented using concurrent signal assignments, mapping bit logical XOR gates directly.

The testbench verified correct function for multiple test cases, showing unit distance changes in the outputs in perfect synchronization with standard Gray code behavior. Waveform validation was completed successfully.
