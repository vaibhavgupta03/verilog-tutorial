# 16-Bit Counter

This project implements a 16-bit counter in Verilog HDL. The counter supports synchronous reset, an enable signal, and a mode selection for counting up or down.

## Design Overview

The counter is designed as a synchronous digital circuit that operates on the positive edge of the clock signal. It includes the following features:

- **Synchronous Reset**: When the reset signal (`rst`) is asserted, the counter resets to 0.
- **Enable Signal**: The counter only increments or decrements when the enable signal (`enable`) is high.
- **Mode Selection**: The `mode` input determines the counting direction:
  - `mode = 0`: Up counting (increment)
  - `mode = 1`: Down counting (decrement)

### Module Interface

- **Inputs**:
  - `clk`: Clock signal
  - `rst`: Synchronous reset (active high)
  - `enable`: Enable signal (active high)
  - `mode`: Counting mode (0 for up, 1 for down)

- **Outputs**:
  - `count`: 16-bit output register representing the current count value

### Functionality

The counter starts at 0 and can count from 0 to 65535 (2^16 - 1) in up mode or from 65535 down to 0 in down mode. The count wraps around when it reaches the maximum or minimum value.

## Files in This Directory

- `counter16.v`: The main Verilog module implementing the 16-bit counter.
- `testcounter.v`: Testbench module for simulating and verifying the counter's behavior.
- `counter16.vcd`: Value Change Dump (VCD) file generated during simulation for waveform analysis.
- `mysim`: Compiled simulation executable (generated from the testbench).

## How to Run the Code

To simulate the 16-bit counter, you need a Verilog simulator such as Icarus Verilog (iverilog). If you don't have it installed, you can install it.

### Steps to Compile and Run:

1. **Compile the Design and Testbench**:
   ```
   iverilog -o mysim counter16.v testcounter.v
   ```
   This creates the `mysim` executable.

2. **Run the Simulation**:
   ```
   vvp mysim
   ```
   The simulation will run and output the count values, reset, enable, and mode signals to the console via `$monitor`.



## How to Check the Results

1. **Console Output**: During simulation, the `$monitor` statement in the testbench will print the current count, reset, enable, and mode values at each time step.

2. **Waveform Analysis**: The simulation generates a `counter16.vcd` file. To view the waveforms:
   - Install GTKWave if you don't have it already.
   - Open the VCD file: `gtkwave counter16.vcd`
   - Add signals like `count`, `rst`, `enable`, and `mode` to the waveform viewer to visualize the counter's behavior over time.

### Test Scenario

The testbench performs the following sequence:
- Starts with reset high, enable low, mode 0 (up counting).
- Releases reset, enables counting.
- Disables counting after some time.
- Switches to down counting mode.
- Enables counting again.
- Asserts reset to verify reset functionality.

This allows you to verify that the counter behaves correctly in different modes and under reset/enable conditions.

Feel free to modify the testbench to explore different scenarios and validate the counter's functionality further!

## Author
Created by Vaibhav Gupta.

## Acknowledgments
Thanks to the open-source community for providing resources and tools that made this project possible.

Happy Counting!