# LAB 8: VHDL Code for Sequential Circuits (Counters)

This laboratory covers the design, implementation, and simulation of sequential logic circuits—specifically, a 4-bit Synchronous Up Counter (`COUNTER_UP`) and a 4-bit Synchronous Up/Down Counter (`COUNTER_UPDOWN`)—using **VHDL**. The functionality of both counters is verified through a unified testbench and signal waveforms.

---

## Objective

- To design and implement a 4-bit synchronous Up Counter using VHDL.
- To design and implement a 4-bit synchronous Up/Down Counter using VHDL.
- To verify the functional correctness of both counters using a unified testbench (`counter_tb.vhd`).
- To compile, elaborate, and simulate the designs using **GHDL** and inspect the waveforms.

---

## Theory

### 1. 4-bit Synchronous Up Counter
A synchronous counter updates all its flip-flops simultaneously on the active clock edge. In a 4-bit Up Counter, the output counts sequentially from `0000` ($0_{10}$) to `1111` ($15_{10}$) and then rolls over back to `0000`. The design features an active-high synchronous reset (`RST`).

### 2. 4-bit Synchronous Up/Down Counter
An Up/Down counter can count in both directions depending on a control input (`UP`).
- When `UP = '1'`, the counter increments by 1 on each rising clock edge.
- When `UP = '0'`, the counter decrements by 1 on each rising clock edge.
- When `RST = '1'`, the counter reset takes precedence, clearing the count synchronously to `0000`.

---

## Project Structure & Files

All files are located in the `LAB8` directory:

| Filename | Description |
|:---|:---|
| [counter_up.vhd](counter_up.vhd) | VHDL design of the 4-bit Synchronous Up Counter. |
| [counter_updown.vhd](counter_updown.vhd) | VHDL design of the 4-bit Synchronous Up/Down Counter. |
| [counter_tb.vhd](counter_tb.vhd) | Unified testbench for simulating both counter modules. |
| [simulation.vcd](simulation.vcd) | Generated Value Change Dump (VCD) waveform file. |

---

## Compilation & Simulation Instructions

1. Open PowerShell or Bash inside the `LAB8` folder:
   ```powershell
   cd LAB8
   ```

2. Compile/Analyze all counter source files and the testbench:
   ```powershell
   ghdl -a counter_up.vhd counter_updown.vhd counter_tb.vhd
   ```

3. Elaborate the testbench entity:
   ```powershell
   ghdl -e COUNTER_TB
   ```

4. Run the simulation (specifying a stop time to terminate the clock generation):
   ```powershell
   ghdl -r COUNTER_TB --vcd=simulation.vcd --stop-time=600ns
   ```

5. View the waveforms using GTKWave:
   ```powershell
   gtkwave simulation.vcd
   ```
