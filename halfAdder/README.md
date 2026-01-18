# Half Adder

A half adder is a basic digital circuit that performs addition of two single-bit binary numbers. It produces two outputs: a sum (S) and a carry (C). The half adder does not account for carry-in from previous additions, making it suitable for the least significant bit in multi-bit addition.

## Truth Table

| A | B | Sum (S) | Carry (C) |
|---|---|---------|-----------|
| 0 | 0 | 0       | 0         |
| 0 | 1 | 1       | 0         |
| 1 | 0 | 1       | 0         |
| 1 | 1 | 0       | 1         |

## Implementations

This project includes three different Verilog implementations of the half adder, each demonstrating a different modeling style:

1. **Dataflow Model** ([ha_dflow.v](./ha_dflow.v)): Uses continuous assignment statements to describe the logic.
2. **Structural Model** ([ha_structural.v](./ha_structural.v)): Instantiates primitive gates (XOR and AND) to build the circuit.
3. **Behavioral Model** ([ha_behavioral.v](./ha_behavioral.v)): Uses an always block with a case statement to define the behavior.

## Testbench

The testbench ([ha_tb.v](./ha_tb.v)) instantiates all three half adder designs simultaneously, allowing for side-by-side comparison of their outputs for the same input stimuli.

## Running the Simulation

To run the simulation and verify the outputs:

1. Ensure you have Icarus Verilog (iverilog) installed on your system.

2. Compile the Verilog files:
   ```
   iverilog -o mysim ha_tb.v ha_dflow.v ha_structural.v ha_behavioral.v
   ```

3. Run the simulation:
   ```
   vvp mysim
   ```

4. The output will display the time, input values (a, b), and outputs from all three implementations (dflow, struct, behav). Verify that all three produce identical results for each input combination.

5. Optionally, view the waveform:
   ```
   gtkwave ha.vcd
   ```

This setup allows you to confirm that all three modeling styles correctly implement the half adder logic.
