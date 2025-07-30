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
