# 💻 LAB 5: VHDL Code for 2-bit Magnitude Comparator

This laboratory covers the design, implementation, and simulation of a combinational logic circuit—specifically a **2-bit Magnitude Comparator**—using **VHDL**. The behavior of this circuit is verified through a testbench and signal waveforms in an open-source simulation environment.

---

## 🎯 Objective

- To understand the operation of magnitude comparators.
- To design and implement a 2-bit Magnitude Comparator using VHDL.
- To simulate the combinational circuit using **GHDL** and verify its operation.
- To analyze simulation waveforms using **GTKWave**.

---

## 📖 Theory & Truth Tables

Combinational circuits are digital circuits whose outputs depend solely on the current inputs. A magnitude comparator is a combinational circuit that compares two numbers, $A$ and $B$, and determines their relative magnitudes (whether $A$ is equal to, greater than, or less than $B$).

A 2-bit Magnitude Comparator compares two 2-bit binary inputs $A = A_1 A_0$ and $B = B_1 B_0$. It has three outputs:
* $EQ$ ($A = B$)
* $GT$ ($A > B$)
* $LT$ ($A < B$)

#### Truth Table
| Input A1 | Input A0 | Input B1 | Input B0 | Output EQ | Output GT | Output LT |
|:--------:|:--------:|:--------:|:--------:|:---------:|:---------:|:---------:|
|    0     |    0     |    0     |    0     |     1     |     0     |     0     |
|    0     |    0     |    0     |    1     |     0     |     0     |     1     |
|    0     |    0     |    1     |    0     |     0     |     0     |     1     |
|    0     |    0     |    1     |    1     |     0     |     0     |     1     |
|    0     |    1     |    0     |    0     |     0     |     1     |     0     |
|    0     |    1     |    0     |    1     |     1     |     0     |     0     |
|    0     |    1     |    1     |    0     |     0     |     0     |     1     |
|    0     |    1     |    1     |    1     |     0     |     0     |     1     |
|    1     |    0     |    0     |    0     |     0     |     1     |     0     |
|    1     |    0     |    0     |    1     |     0     |     1     |     0     |
|    1     |    0     |    1     |    0     |     1     |     0     |     0     |
|    1     |    0     |    1     |    1     |     0     |     0     |     1     |
|    1     |    1     |    0     |    0     |     0     |     1     |     0     |
|    1     |    1     |    0     |    1     |     0     |     1     |     0     |
|    1     |    1     |    1     |    0     |     0     |     1     |     0     |
|    1     |    1     |    1     |    1     |     1     |     0     |     0     |

---

## 🛠️ Software Used

- **VHDL** – Hardware Description Language
- **GHDL** – Open-source VHDL compiler & simulator
- **GTKWave** – Waveform viewer for VCD files
- **Visual Studio Code (VS Code)** – Code editor

---

## 📂 Project Structure & Files

The files are organized directly inside the `LAB5` folder:

| File | Description | Link |
|:---|:---|:---|
| [comparator_2bit.vhd](file:///c:/Users/ACER/OneDrive/Desktop/4th%20sem/Computer%20Achitecture/CA/New%20folder/LABworks_CA_only/LAB5/comparator_2bit.vhd) | Design File (2-bit Comparator) | [comparator_2bit.vhd](file:///c:/Users/ACER/OneDrive/Desktop/4th%20sem/Computer%20Achitecture/CA/New%20folder/LABworks_CA_only/LAB5/comparator_2bit.vhd) |
| [tb_comparator_2bit.vhd](file:///c:/Users/ACER/OneDrive/Desktop/4th%20sem/Computer%20Achitecture/CA/New%20folder/LABworks_CA_only/LAB5/tb_comparator_2bit.vhd) | Testbench File | [tb_comparator_2bit.vhd](file:///c:/Users/ACER/OneDrive/Desktop/4th%20sem/Computer%20Achitecture/CA/New%20folder/LABworks_CA_only/LAB5/tb_comparator_2bit.vhd) |
| [simulation.vcd](file:///c:/Users/ACER/OneDrive/Desktop/4th%20sem/Computer%20Achitecture/CA/New%20folder/LABworks_CA_only/LAB5/simulation.vcd) | Waveform File | [simulation.vcd](file:///c:/Users/ACER/OneDrive/Desktop/4th%20sem/Computer%20Achitecture/CA/New%20folder/LABworks_CA_only/LAB5/simulation.vcd) |
| [comparator.png](file:///c:/Users/ACER/OneDrive/Desktop/4th%20sem/Computer%20Achitecture/CA/New%20folder/LABworks_CA_only/LAB5/comparator.png) | Simulation Waveform Screenshot | [comparator.png](file:///c:/Users/ACER/OneDrive/Desktop/4th%20sem/Computer%20Achitecture/CA/New%20folder/LABworks_CA_only/LAB5/comparator.png) |

---

## 💻 VHDL Design & Testbench Codes

### 1. 2-bit Magnitude Comparator
* **Design:** `comparator_2bit.vhd`
```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity COMPARATOR_2BIT is
    Port (
        A  : in  STD_LOGIC_VECTOR(1 downto 0);
        B  : in  STD_LOGIC_VECTOR(1 downto 0);
        EQ : out STD_LOGIC;  -- A = B
        GT : out STD_LOGIC;  -- A > B
        LT : out STD_LOGIC   -- A < B
    );
end entity COMPARATOR_2BIT;

architecture Behavioral of COMPARATOR_2BIT is
begin
    process(A, B)
    begin
        if unsigned(A) = unsigned(B) then
            EQ <= '1';
            GT <= '0';
            LT <= '0';

        elsif unsigned(A) > unsigned(B) then
            EQ <= '0';
            GT <= '1';
            LT <= '0';

        else
            EQ <= '0';
            GT <= '0';
            LT <= '1';
        end if;
    end process;
end architecture Behavioral;
```
* **Testbench:** `tb_comparator_2bit.vhd`
```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_COMPARATOR_2BIT is
end entity TB_COMPARATOR_2BIT;

architecture Simulation of TB_COMPARATOR_2BIT is

    signal A  : STD_LOGIC_VECTOR(1 downto 0) := "00";
    signal B  : STD_LOGIC_VECTOR(1 downto 0) := "00";
    signal EQ : STD_LOGIC;
    signal GT : STD_LOGIC;
    signal LT : STD_LOGIC;

begin

    DUT : entity work.COMPARATOR_2BIT
        port map (
            A  => A,
            B  => B,
            EQ => EQ,
            GT => GT,
            LT => LT
        );

    STIMULUS : process
    begin
        -- Loop through all possible combinations of A and B (16 cases)
        for i in 0 to 3 loop
            for j in 0 to 3 loop
                A <= std_logic_vector(to_unsigned(i, 2));
                B <= std_logic_vector(to_unsigned(j, 2));
                wait for 10 ns;
            end loop;
        end loop;

        wait;
    end process STIMULUS;

end architecture Simulation;
```

---

## ▶️ How to Run the Simulations

You can compile and simulate the circuit using **GHDL** and inspect the waveforms using **GTKWave**.

```bash
ghdl -a comparator_2bit.vhd tb_comparator_2bit.vhd
ghdl -e TB_COMPARATOR_2BIT
ghdl -r TB_COMPARATOR_2BIT --vcd=simulation.vcd
gtkwave simulation.vcd
```

---

## 📊 Discussion

In this experiment, a 2-bit Magnitude Comparator was successfully designed using VHDL and simulated using GHDL. The architecture utilizes behavioral modeling with a process block. Inside the process, type casting to `unsigned` (using the `IEEE.NUMERIC_STD.ALL` library) is performed on the input `STD_LOGIC_VECTOR` vectors, allowing for direct numerical comparison (`=`, `>`, and `<`) in the if-elsif-else control structure.

The testbench systematically evaluated all 16 possible input state combinations ($2^2 \times 2^2$) by nesting loops that generated inputs $00$ to $11$ for both $A$ and $B$. The simulation waveform generated in GTKWave matched the theoretical truth table exactly.

![2-bit Comparator Simulation Waveform](file:///c:/Users/ACER/OneDrive/Desktop/4th%20sem/Computer%20Achitecture/CA/New%20folder/LABworks_CA_only/LAB5/comparator.png)

---

## ✅ Conclusion

The 2-bit Magnitude Comparator circuit was successfully designed, simulated, and verified in VHDL. The simulation outputs correctly determined equality ($A = B$), greater than ($A > B$), and less than ($A < B$) for all combinations of the inputs. This experiment reinforced how numeric type conversions and relational operations are described in VHDL.

---

> **Course:** Computer Architecture Lab  
> **Experiment:** Lab 5 – VHDL Code for 2-bit Magnitude Comparator
