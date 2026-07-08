# LAB 6: VHDL Code for BCD to Excess-3 Code Converter

This laboratory covers the design, implementation, and simulation of a code converter—specifically a **BCD to Excess-3 Code Converter**—using **VHDL**. The functionality is verified through a testbench and GTKWave waveform analysis.

---

## Objective

- To design and implement a BCD to Excess-3 Code Converter in VHDL.
- To verify the conversion logic using a VHDL testbench.
- To compile and simulate the design using **GHDL** and analyze waveforms using **GTKWave**.

---

## Theory & Truth Tables

A BCD (Binary Coded Decimal) to Excess-3 converter is a combinational circuit that translates a 4-bit binary input representing decimal digits (0 to 9) into Excess-3 code. Excess-3 code is formed by adding binary 3 (0011) to the decimal value.

#### Truth Table
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
| [bcd_to_xs3.vhd](bcd_to_xs3.vhd) | Design File (BCD to Excess-3) | [bcd_to_xs3.vhd](bcd_to_xs3.vhd) |
| [bcd_xs3_tb.vhd](bcd_xs3_tb.vhd) | Testbench File | [bcd_xs3_tb.vhd](bcd_xs3_tb.vhd) |
| [bcd_xs3.vcd](bcd_xs3.vcd) | Waveform File | [bcd_xs3.vcd](bcd_xs3.vcd) |
| [image.png](image.png) | Simulation Waveform Screenshot | [image.png](image.png) |

---

## VHDL Design & Testbench Codes

### 1. BCD to Excess-3 Converter
* **Design:** `bcd_to_xs3.vhd`
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

* **Testbench:** `bcd_xs3_tb.vhd`
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

---

## Simulation Result Waveform

Below is the output wave captured from GTKWave, illustrating the transition from decimal BCD inputs to their respective Excess-3 equivalents:

![BCD to Excess-3 Waveform](image.png)

---

## How to Run the Simulation

You can compile and simulate the circuit using **GHDL** in your command line:

```bash
# Compile design and testbench
ghdl -a bcd_to_xs3.vhd bcd_xs3_tb.vhd

# Elaborate testbench entity
ghdl -e bcd_xs3_tb

# Run simulation to output VCD
ghdl -r bcd_xs3_tb --vcd=bcd_xs3.vcd

# View waveforms using GTKWave
gtkwave bcd_xs3.vcd
```

---

## Discussion & Conclusion

The BCD to Excess-3 converter was successfully designed and verified in VHDL. Behavioral modeling was used with the `IEEE.NUMERIC_STD` library to cast the input `std_logic_vector` into `unsigned` for numeric addition by 3, which is then cast back to standard logic vector form for the output. 

The testbench output verified the logical conversion correctness by testing decimal digits `0`, `1`, `5`, and `9`, and showing exactly `0011`, `0100`, `1000`, and `1100` respectively. The waveforms displayed on GTKWave verified that the system operates in complete correctness.
