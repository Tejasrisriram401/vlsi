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
