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
