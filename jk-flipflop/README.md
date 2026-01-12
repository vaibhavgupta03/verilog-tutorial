# JK Flip-Flop Verilog Implementations

This folder contains various Verilog implementations of a JK Flip-Flop, along with testbenches and simulation files. The JK flip-flop is a sequential logic circuit that can store one bit of information and has two inputs (J and K) that determine its next state based on the current state and clock edge.

## Overview

The JK flip-flop is a versatile flip-flop where:
- J=0, K=0: No change (holds current state)
- J=0, K=1: Reset (Q becomes 0)
- J=1, K=0: Set (Q becomes 1)
- J=1, K=1: Toggle (Q inverts)

This folder demonstrates different coding styles and features:
- Basic behavioral implementation
- Implementation with asynchronous preset and clear
- User-Defined Primitive (UDP) implementation
- Testbenches for verification
- Simulation outputs and waveforms

## Files Description

- **jkff_primitive.v**: User-Defined Primitive (UDP) implementation of JK flip-flop with preset and clear inputs. Uses a truth table to define behavior.
- **jkff.v**: Basic behavioral Verilog module for JK flip-flop. Uses a case statement on {J,K} inputs, triggered on positive clock edge.
- **jkff2.v**: Enhanced behavioral implementation with asynchronous preset and clear inputs. Triggered on negative clock edge.
- **testjk.v**: Testbench module for `jkff.v`. Generates input stimuli and dumps waveforms to `jk_ff.vcd`.
- **testjkff2.v**: Testbench module for `jkff2.v`. Tests preset/clear functionality and dumps to `jkff2.vcd`.
- **jk_ff.vcd**: Value Change Dump (VCD) file containing simulation waveforms for `jkff.v` test.
- **jkff2.vcd**: VCD file for `jkff2.v` simulation waveforms.
- **mysim**: Compiled simulation executable (likely for `jkff.v`).
- **sim**: Compiled simulation executable (likely for `jkff2.v`).

## Different Methods of Writing JK Flip-Flop Code

### 1. Behavioral Implementation (jkff.v)
This uses standard Verilog behavioral constructs:
- Module with inputs: clk, j, k
- Outputs: q, qbar (complement of q)
- Always block triggered on `posedge clk`
- Case statement on concatenated {j,k} to determine next state
- qbar assigned as continuous assignment `assign qbar = ~q;`

### 2. Behavioral with Asynchronous Controls (jkff2.v)
Similar to basic behavioral but adds:
- Additional inputs: preset, clear
- Triggered on `negedge clk` (negative edge)
- Priority handling: preset/clear override JK inputs
- If preset=0 and clear=1: Set Q=1
- If clear=0 and preset=1: Reset Q=0
- If both preset/clear=0: Undefined state (1'bx)
- Else: Normal JK operation

### 3. User-Defined Primitive (UDP) (jkff_primitive.v)
Uses Verilog's primitive construct:
- Defined with `primitive` keyword
- Truth table format with inputs: clk, j, k, preset, clear
- Outputs: q
- Table entries define state transitions
- Handles asynchronous preset/clear and JK logic in table form

## How to Write Each Implementation

### Basic JK FF (jkff.v)
See [jkff.v](jkff.v) for the full code.

### JK FF with Preset/Clear (jkff2.v)
See [jkff2.v](jkff2.v) for the full code.

### UDP JK FF (jkff_primitive.v)
See [jkff_primitive.v](jkff_primitive.v) for the full code.

## How to Run Simulations

This project uses Icarus Verilog (iverilog) for simulation. Ensure iverilog is installed.

### Running Basic JK FF Test
1. Compile the design and testbench:
   ```
   iverilog -o mysim jkff.v testjk.v
   ```
2. Run the simulation:
   ```
   vvp mysim
   ```
3. View waveforms (optional, requires GTKWave):
   ```
   gtkwave jk_ff.vcd
   ```

### Running JK FF with Preset/Clear Test
1. Compile:
   ```
   iverilog -o sim jkff2.v testjkff2.v
   ```
2. Run:
   ```
   vvp sim
   ```
3. View waveforms:
   ```
   gtkwave jkff2.vcd
   ```

The testbenches include `$monitor` statements to print signal values during simulation. VCD files are generated for waveform analysis.

## Changes/Differences in Each File

- **jkff.v vs jkff2.v**: jkff2.v adds preset/clear inputs and uses negedge clk instead of posedge. Includes priority logic for async controls.
- **jkff.v vs jkff_primitive.v**: Primitive uses table-based definition vs. behavioral always blocks. Primitive handles timing differently (edge-sensitive table).
- **testjk.v vs testjkff2.v**: testjkff2.v includes preset/clear stimuli and monitors additional signals. Different VCD filenames.

## Prerequisites

- Icarus Verilog (iverilog)
- Optional: GTKWave for waveform viewing

## Notes

- All implementations assume active-low preset/clear (0 = active).
- UDP implementation provides fine-grained control but is less portable.
- Behavioral implementations are more readable and synthesizable.
- Testbenches use timescale of 1ns/1ps for precise timing.
