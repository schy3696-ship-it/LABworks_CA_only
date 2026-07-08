# LAB 1: Introduction to VHDL Programming and Open-Source Simulation Environment
This laboratory introduces the fundamentals of **VHDL (VHSIC Hardware Description Language)** and demonstrates how to simulate digital circuits using an open-source simulation environment. The experiment implements a simple **Buffer circuit**, verifies its functionality through a testbench, and observes the simulation results.
---
## Objective

- To understand the basics of VHDL programming.
- To become familiar with an open-source VHDL simulation environment.
- To design and simulate a simple Buffer circuit.
- To verify the circuit using a VHDL testbench.
---

## Theory

**VHDL (VHSIC Hardware Description Language)** is a hardware description language used to model, simulate, and design digital electronic systems. It enables engineers to describe the behavior and structure of digital circuits before implementing them on hardware such as FPGAs or ASICs.

A **Buffer** is one of the simplest digital logic elements. It transfers the input signal directly to the output without changing its logical value.

### Buffer Truth Table

| Input (A) | Output (Y) |
|:---------:|:----------:|
| 0 | 0 |
| 1 | 1 |
---

## Software Used

- **VHDL** – Hardware Description Language
- **GHDL** – Open-source VHDL simulator
- **GTKWave** – Waveform viewer for VCD files
- **Visual Studio Code (VS Code)** – Code editor
---

## Files Included

| File | Description |
|------|-------------|
| `buffer.vhd` | VHDL source code for the Buffer circuit |
| `tb_buffer.vhd` | Testbench used to verify the Buffer circuit |
| `simulation.vcd` | Waveform generated after simulation |
| `lab1.readme` | Additional notes or simulator output |
---

## VHDL Design Code

The following VHDL program implements a simple **Buffer** circuit. The output always follows the input.

```vhdl
-- Library declarations (always required for std_logic)
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity: one input, one output
entity MY_BUFFER is
    Port (
        A : in  STD_LOGIC;
        Y : out STD_LOGIC
    );
end entity MY_BUFFER;

-- Architecture: output simply follows input
architecture Dataflow of MY_BUFFER is
begin
    Y <= A;
end architecture Dataflow;
```
---

## Testbench Code

The following testbench verifies the operation of the Buffer circuit by applying different input values and observing the corresponding output.

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Testbench has no ports
entity BUFFER_TB is
end entity BUFFER_TB;

architecture Simulation of BUFFER_TB is
    -- Signals to connect to the Design Under Test (DUT)
    signal tb_A : STD_LOGIC := '0';
    signal tb_Y : STD_LOGIC;
begin
    -- Instantiate the Design Under Test (DUT)
    DUT : entity work.MY_BUFFER
        port map (
            A => tb_A,
            Y => tb_Y
        );

    -- Stimulus process: toggle the input
    STIMULUS : process
    begin
        tb_A <= '0'; wait for 10 ns;
        tb_A <= '1'; wait for 10 ns;
        tb_A <= '0'; wait for 10 ns;

        wait;
    end process STIMULUS;

end architecture Simulation;
```
---

## Simulation Results

The simulation was performed using **GHDL**, and the generated waveform was saved as `simulation.vcd`.

The waveform can be viewed using **GTKWave** to verify that the Buffer circuit functions correctly.

### Expected Behavior

| Time (ns) | Input (A) | Output (Y) |
|:---------:|:---------:|:----------:|
| 0 – 10    | 0 | 0 |
| 10 – 20   | 1 | 1 |
| 20 – 30   | 0 | 0 |
### Waveform

> **Note:** Add a screenshot of the GTKWave simulation here after opening `simulation.vcd`.

<!-- Example -->
<!-- ![Simulation Waveform](waveform.png) -->
---

## ▶ How to Run the Simulation

Compile the design and testbench using **GHDL**:

```bash
ghdl -a buffer.vhd
ghdl -a tb_buffer.vhd
ghdl -e BUFFER_TB
ghdl -r BUFFER_TB --vcd=simulation.vcd
```

Open the generated waveform using **GTKWave**:

```bash
gtkwave simulation.vcd
```
---

## Conclusion

In this laboratory, a simple **Buffer circuit** was designed and simulated using **VHDL**. The testbench successfully verified that the output always followed the input. The simulation demonstrated the basic VHDL design flow, including writing the design, creating a testbench, compiling the code, and analyzing the waveform using GTKWave.
---

> **Course:** Computer Architecture Lab  
> **Experiment:** Lab 1 – Introduction to VHDL Programming and Open-Source Simulation Environment