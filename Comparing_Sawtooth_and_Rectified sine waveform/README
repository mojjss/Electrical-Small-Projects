# Sawtooth vs. Rectified Sine — Comparator-Based PWM Demo

## Overview
This repository contains a compact, conceptual demonstration of comparator-based pulse-width modulation (PWM) in which the instantaneous duty cycle of a high-frequency pulse train follows the envelope of a low-frequency rectified sine wave.

A rectified sine (100 Hz envelope) is compared sample-by-sample against a high-frequency sawtooth carrier (100 kHz). The comparator outputs a digital pulse (0/1) when the envelope exceeds the carrier. The example is intended for educational purposes and for exploring basic waveform processing, envelope tracking, and PWM generation.

## Repository contents
- `waveform_compare.c` — C program that synthesizes the rectified sine and sawtooth signals, performs the comparator operation, and writes numeric results to disk.  
- `plot_waveforms.m` — MATLAB script that loads the generated data and produces full and zoomed plots.  
- `waveform_comparison.csv` — Example CSV output (columns: `Time, Rectified_Sine, Sawtooth, Output_Pulse`).  
- `output.txt` — Additional textual output / log (optional).

## Brief theory
- **Rectified sine (envelope)**: `rectified_sine(t) = |sin(2π f_sine t)|`, with `f_sine = 100 Hz`.  
- **Sawtooth (carrier)**: a repeating linear ramp from 0 → 1 at `f_saw = 100 kHz`.  
- **Comparator rule**: `output_pulse(t) = 1` if `rectified_sine(t) > sawtooth(t)`, otherwise `0`.

Because `f_saw ≫ f_sine`, many carrier cycles occur during each sine half-cycle. The fraction of carrier cycles for which the envelope exceeds the carrier implements the instantaneous duty cycle — i.e., amplitude maps to duty cycle.

## Usage (local)
### Prerequisites
- C compiler (GCC recommended)  
- MATLAB for plotting (or an equivalent tool that can read CSV)

### Build and run (C)
From the project folder:
```sh
gcc -O2 -o waveform_compare waveform_compare.c -lm
./waveform_compare
