# 1. PulseTracer

## Objective
Detect a single-cycle high pulse from a noisy input stream. The design must ignore short glitches and only react to a clean rising transition.

## Interface

| Signal      | Direction | Description                        |
|-------------|-----------|------------------------------------|
| clk         | Input     | Clock signal                       |
| rst         | Input     | Active-high reset                  |
| noisy_in    | Input     | Noisy signal input                 |
| clean_pulse | Output    | Clean, one-cycle output pulse      |

---

# 2. BitBalancer

## Objective
Count the number of 1s in an 8-bit input and output the total count. The count resets on each load.

## Interface

| Signal     | Direction | Description                   |
|------------|-----------|-------------------------------|
| clk        | Input     | Clock signal                  |
| rst        | Input     | Synchronous reset             |
| load       | Input     | Load trigger for count        |
| data_in    | Input     | 8-bit binary input            |
| ones_count | Output    | 4-bit count of number of 1s   |

---

# 3. NibbleSwapper

## Objective
Swap the upper and lower 4-bit nibbles of an 8-bit input when the swap signal is asserted.

## Interface

| Signal    | Direction | Description                      |
|-----------|-----------|----------------------------------|
| clk       | Input     | Clock                            |
| rst       | Input     | Reset                            |
| swap      | Input     | Control to trigger nibble swap   |
| data_in   | Input     | 8-bit input                      |
| data_out  | Output    | 8-bit swapped output             |

---

# 4. EvenOddFSM

## Objective
Detect whether a 4-bit number is even or odd using its least significant bit.

## Interface

| Signal   | Direction | Description                     |
|----------|-----------|---------------------------------|
| clk      | Input     | Clock                           |
| rst      | Input     | Reset                           |
| num_in   | Input     | 4-bit number                    |
| valid    | Input     | Indicates number is valid       |
| is_even  | Output    | 1 if number is even, else 0     |

---

# 5. GrayCoder

## Objective
Convert a 4-bit binary number into its equivalent Gray code.

## Interface

| Signal     | Direction | Description                |
|------------|-----------|----------------------------|
| clk        | Input     | Clock                      |
| rst        | Input     | Reset                      |
| bin_in     | Input     | 4-bit binary input         |
| valid      | Input     | Input validity flag        |
| gray_out   | Output    | 4-bit Gray code output     |

---

# 6. DebouncerLite

## Objective
Filter out glitches in a noisy digital input and produce a stable clean output after 3 consistent samples.

## Interface

| Signal     | Direction | Description                 |
|------------|-----------|-----------------------------|
| clk        | Input     | Clock                       |
| rst        | Input     | Reset                       |
| noisy_in   | Input     | Noisy signal input          |
| clean_out  | Output    | Debounced clean output      |

---

# 7. LightChaser

## Objective
Generate a rotating LED pattern (1-hot encoded) across 8 LEDs when enabled.

## Interface

| Signal | Direction | Description               |
|--------|-----------|---------------------------|
| clk    | Input     | Clock                     |
| rst    | Input     | Reset                     |
| enable | Input     | Enables pattern rotation  |
| leds   | Output    | 8-bit rotating LED output |

---

# 8. SeqCheck

## Objective
Detect the sequence “110” in a serial bitstream input and raise a flag when the pattern is detected.

## Interface

| Signal        | Direction | Description                         |
|---------------|-----------|-------------------------------------|
| clk           | Input     | Clock                               |
| rst           | Input     | Reset                               |
| in_sig        | Input     | Serial input bitstream              |
| pattern_found | Output    | High when "110" pattern is detected |

---

# 9. RotatorUnit

## Objective
Rotate an 8-bit value left or right based on the dir control signal each clock cycle.

## Interface

| Signal    | Direction | Description                          |
|-----------|-----------|--------------------------------------|
| clk       | Input     | Clock                                |
| rst       | Input     | Reset                                |
| dir       | Input     | Direction (0 = left, 1 = right)      |
| data_in   | Input     | 8-bit input value                    |
| load      | Input     | Load trigger for data_in             |
| data_out  | Output    | Rotated output                       |

---

# 10. EdgeHighlighter

## Objective
Detect both rising and falling edges of a signal and output a single-cycle pulse for each event.

## Interface

| Signal        | Direction | Description                         |
|---------------|-----------|-------------------------------------|
| clk           | Input     | Clock                               |
| rst           | Input     | Reset                               |
| signal_in     | Input     | Input signal                        |
| rising_edge   | Output    | High for 1 cycle on rising edge     |
| falling_edge  | Output    | High for 1 cycle on falling edge    |
