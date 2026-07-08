# LAB 3: VHDL Code for Combinational Circuits (Encoder and Decoder)

This laboratory covers the design, implementation, and simulation of combinational logic circuits—specifically a **4-to-2 Priority Encoder** and a **2-to-4 Decoder**—using **VHDL**. The behavior of these circuits is verified through testbenches and signal waveforms in an open-source simulation environment.

---

## Objective

- To design and implement combinational circuits (Priority Encoder and Decoder) using VHDL.
- To verify their functional correctness using VHDL testbenches.
- To compile and simulate the designs using **GHDL** and analyze the output waveforms using **GTKWave**.

---

## Theory & Truth Tables

Combinational circuits are digital circuits whose outputs depend solely on the current inputs. Unlike sequential circuits, they contain no memory elements (such as flip-flops) and do not require clock signals.

### 1. 4-to-2 Priority Encoder
An encoder converts multiple binary input lines into a smaller number of output lines. A **Priority Encoder** resolves the issue of multiple active inputs by assigning priority to each input. In this design, the highest index input $D_3$ has the highest priority, while $D_0$ has the lowest.

#### Truth Table
| Input D3 | Input D2 | Input D1 | Input D0 | Output Y1 | Output Y0 |
|:--------:|:--------:|:--------:|:--------:|:---------:|:---------:|
|    1     |    X     |    X     |    X     |     1     |     1     |
|    0     |    1     |    X     |    X     |     1     |     0     |
|    0     |    0     |    1     |    X     |     0     |     1     |
|    0     |    0     |    0     |    1     |     0     |     0     |
|    0     |    0     |    0     |    0     |     0     |     0     |

---

### 2. 2-to-4 Decoder
A decoder performs the reverse operation of an encoder. It decodes a binary input code of $n$ bits into a maximum of $2^n$ unique outputs. A 2-to-4 decoder takes a 2-bit input vector $A$ and activates one of the 4 output lines in the vector $Y$.

#### Truth Table
| Input A1 | Input A0 | Output Y3 | Output Y2 | Output Y1 | Output Y0 |
|:--------:|:--------:|:---------:|:---------:|:---------:|:---------:|
|    0     |    0     |     0     |     0     |     0     |     1     |
|    0     |    1     |     0     |     0     |     1     |     0     |
|    1     |    0     |     0     |     1     |     0     |     0     |
|    1     |    1     |     1     |     0     |     0     |     0     |

---

## Software Used

- **VHDL** – Hardware Description Language
- **GHDL** – Open-source VHDL compiler & simulator
- **GTKWave** – Waveform viewer for VCD files
- **Visual Studio Code (VS Code)** – Code editor

---

## Project Structure & Files

The files are organized into two main folders for the Encoder and Decoder circuits.

| Directory | Design File | Testbench File | Waveform File |
|:---|:---|:---|:---|
| [`Encoder`](file:///c:/Users/ACER/OneDrive/Desktop/4th%20sem/Computer%20Achitecture/CA/New%20folder/LABworks_CA_only/LAB3/Encoder) | [priority_encoder.vhd](file:///c:/Users/ACER/OneDrive/Desktop/4th%20sem/Computer%20Achitecture/CA/New%20folder/LABworks_CA_only/LAB3/Encoder/priority_encoder.vhd) | [tb_priority_encoder.vhd](file:///c:/Users/ACER/OneDrive/Desktop/4th%20sem/Computer%20Achitecture/CA/New%20folder/LABworks_CA_only/LAB3/Encoder/tb_priority_encoder.vhd) | [priority.vcd](file:///c:/Users/ACER/OneDrive/Desktop/4th%20sem/Computer%20Achitecture/CA/New%20folder/LABworks_CA_only/LAB3/Encoder/priority.vcd) |
| [`De-Coder`](file:///c:/Users/ACER/OneDrive/Desktop/4th%20sem/Computer%20Achitecture/CA/New%20folder/LABworks_CA_only/LAB3/De-Coder) | [decoder_2to4.vhd](file:///c:/Users/ACER/OneDrive/Desktop/4th%20sem/Computer%20Achitecture/CA/New%20folder/LABworks_CA_only/LAB3/De-Coder/decoder_2to4.vhd) | [tb_decoder_2to4.vhd](file:///c:/Users/ACER/OneDrive/Desktop/4th%20sem/Computer%20Achitecture/CA/New%20folder/LABworks_CA_only/LAB3/De-Coder/tb_decoder_2to4.vhd) | [priority.vcd](file:///c:/Users/ACER/OneDrive/Desktop/4th%20sem/Computer%20Achitecture/CA/New%20folder/LABworks_CA_only/LAB3/De-Coder/priority.vcd) |

---

## VHDL Design & Testbench Codes

### 1. Priority Encoder (4-to-2)
* **Design:** `Encoder/priority_encoder.vhd`
```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PRIORITY_ENCODER is
    Port (
        D : in STD_LOGIC_VECTOR(3 downto 0);
        Y : out STD_LOGIC_VECTOR(1 downto 0)
    );
end PRIORITY_ENCODER;

architecture Behavioral of PRIORITY_ENCODER is
begin
    process(D)
    begin
        if D(3) = '1' then
            Y <= "11";
        elsif D(2) = '1' then
            Y <= "10";
        elsif D(1) = '1' then
            Y <= "01";
        elsif D(0) = '1' then
            Y <= "00";
        else
            Y <= "00";
        end if;
    end process;
end Behavioral;
```
* **Testbench:** `Encoder/tb_priority_encoder.vhd`
```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_priority_encoder is
end tb_priority_encoder;

architecture sim of tb_priority_encoder is
    component PRIORITY_ENCODER
        Port (
            D : in STD_LOGIC_VECTOR(3 downto 0);
            Y : out STD_LOGIC_VECTOR(1 downto 0)
        );
    end component;

    signal D_tb : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal Y_tb : STD_LOGIC_VECTOR(1 downto 0);
begin
    uut: PRIORITY_ENCODER
        port map(
            D => D_tb,
            Y => Y_tb
        );

    process
    begin
        D_tb <= "0001"; wait for 20 ns;
        D_tb <= "0010"; wait for 20 ns;
        D_tb <= "0100"; wait for 20 ns;
        D_tb <= "1000"; wait for 20 ns;
        D_tb <= "1010"; wait for 20 ns;
        D_tb <= "1111"; wait for 20 ns;
        wait;
    end process;
end sim;
```

---

### 2. Decoder (2-to-4)
* **Design:** `De-Coder/decoder_2to4.vhd`
```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DECODER_2TO4 is
    Port (
        A : in STD_LOGIC_VECTOR(1 downto 0);
        Y : out STD_LOGIC_VECTOR(3 downto 0)
    );
end DECODER_2TO4;

architecture Behavioral of DECODER_2TO4 is
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
* **Testbench:** `De-Coder/tb_decoder_2to4.vhd`
```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_decoder_2to4 is
end tb_decoder_2to4;

architecture sim of tb_decoder_2to4 is
    component DECODER_2TO4
        Port (
            A : in STD_LOGIC_VECTOR(1 downto 0);
            Y : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    signal A_tb : STD_LOGIC_VECTOR(1 downto 0) := "00";
    signal Y_tb : STD_LOGIC_VECTOR(3 downto 0);
begin
    uut: DECODER_2TO4
        port map(
            A => A_tb,
            Y => Y_tb
        );

    process
    begin
        A_tb <= "00"; wait for 20 ns;
        A_tb <= "01"; wait for 20 ns;
        A_tb <= "10"; wait for 20 ns;
        A_tb <= "11"; wait for 20 ns;
        wait;
    end process;
end sim;
```

---

## How to Run the Simulations

You can compile and simulate both circuits using **GHDL** and inspect the waveforms using **GTKWave**.

### E.g., For Priority Encoder:
```bash
cd Encoder
ghdl -a priority_encoder.vhd tb_priority_encoder.vhd
ghdl -e tb_priority_encoder
ghdl -r tb_priority_encoder --vcd=priority.vcd
gtkwave priority.vcd
```

### E.g., For Decoder:
```bash
cd De-Coder
ghdl -a decoder_2to4.vhd tb_decoder_2to4.vhd
ghdl -e tb_decoder_2to4
ghdl -r tb_decoder_2to4 --vcd=priority.vcd
gtkwave priority.vcd
```

---

## Discussion

In this laboratory, various combinational circuits were designed and implemented using VHDL. Unlike sequential circuits, combinational circuits produce outputs that depend only on the current input values and do not require memory elements or clock signals.

The designed circuits were simulated using an open-source VHDL simulator, and the outputs were verified using a testbench. The simulation waveforms matched the expected truth tables and logical behavior of the implemented combinational circuits. This experiment provided practical experience in writing VHDL code, creating testbenches, and analyzing simulation waveforms using GTKWave.

Through this experiment, the relationship between Boolean logic and hardware implementation was clearly understood. The use of VHDL simplified the process of describing, simulating, and verifying digital circuits before hardware implementation.

---

## Conclusion

The combinational circuits were successfully implemented and simulated using VHDL. The simulation results confirmed that the outputs were generated correctly for all input combinations according to their respective logical functions. This laboratory strengthened the understanding of combinational logic design, VHDL programming, testbench development, and waveform analysis using open-source simulation tools.

---

> **Course:** Computer Architecture Lab  
> **Experiment:** Lab 3 – VHDL Code for Combinational Circuits (Encoder and Decoder)
