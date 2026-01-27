# Absolute Value Circuit

## Overview
This folder contains a Verilog implementation of an absolute value circuit. The circuit takes an 8-bit input `I` and computes its absolute value, outputting the result as an 8-bit value `Y`. The design assumes the input is in two's complement representation for signed integers, where the most significant bit (MSB) indicates the sign.

## Purpose
The absolute value circuit is used to compute the magnitude of a signed number, effectively removing the sign. This is useful in digital signal processing, arithmetic operations, and applications where only the magnitude of a value is needed, such as in distance calculations or error computations.

## How It Works
The circuit operates as follows:
- If the MSB of the input `I[7]` is 0, the number is positive or zero, so the output `Y` is set to the input `I` directly.
- If the MSB `I[7]` is 1, the number is negative, so the output `Y` is computed as the two's complement negation: `Y = (~I) + 1`. This flips all bits and adds 1 to convert the negative number to its positive equivalent.

The Verilog code uses an `always @(*)` block to perform this computation combinatorially, ensuring the output updates immediately based on the input.

### Example
- Input: `8'b00000100` (4 in decimal) → Output: `8'b00000100` (4)
- Input: `8'b11111100` (-4 in two's complement) → Output: `8'b00000100` (4)

## Alternative Implementation Using Signed Numbers
In Verilog, we can declare inputs and outputs as signed to handle signed arithmetic more directly. This allows for a simpler comparison-based approach:

- Declare the input and output as signed: `input signed [7:0] I; output signed [7:0] Y;`
- Use a conditional assignment: `Y = (I >= 0) ? I : -I;`

This method directly compares the signed input to zero and negates it if negative. Note that Verilog's signed arithmetic handles the negation correctly for two's complement numbers.

### Benefits of the Alternative
- More readable and intuitive code.
- Leverages Verilog's built-in signed support, reducing manual bit manipulation.
- Easier to extend for different bit widths.

## Files in This Folder
- `absoluteValue.v`: The main Verilog module implementing the absolute value circuit.
- `absoluteValue_tb.v`: Testbench for simulating and verifying the circuit with various inputs.
- `wave.vcd`: Value Change Dump file for waveform analysis.
- `mysim`: Simulation executable (generated during compilation).

## Simulation
To simulate the circuit:
1. Compile the design and testbench using a Verilog simulator (e.g., Icarus Verilog).
2. Run the simulation to generate waveforms and monitor outputs.

Example command (using Icarus Verilog):
```
iverilog -o mysim absoluteValue.v absoluteValue_tb.v
vvp mysim
```

View waveforms with GTKWave:
```
gtkwave wave.vcd
