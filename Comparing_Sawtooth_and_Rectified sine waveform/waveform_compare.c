#include <stdio.h>
#include <math.h>
#include <stdlib.h>  // Added for exit()

// Constants with validation ranges
#define PI 3.14159265359
#define SINE_FREQ 100.0      // 100 Hz
#define SAWTOOTH_FREQ 100000.0 // 100 kHz
#define AMPLITUDE 1.0        // Range: 0 to 1
#define SIMULATION_TIME 0.02 // 20ms
#define TIME_STEP 1e-7      // 0.1µs
#define DEBUG 1             // Debug flag

// Validation functions
double validate_wave(double val, const char* wave_name) {
    if (isnan(val) || isinf(val)) {
        fprintf(stderr, "Error: Invalid %s value\n", wave_name);
        exit(1);
    }
    return val;
}

// Rectified sine wave with validation
double rectified_sine(double t) {
    double val = fabs(sin(2 * PI * SINE_FREQ * t));
    return validate_wave(val, "sine");
}

// Sawtooth wave with validation
double sawtooth(double t) {
    double period = 1.0 / SAWTOOTH_FREQ;
    double phase = fmod(t, period);
    if (phase < 0) phase += period;
    
    double val = phase / period;
    return validate_wave(val, "sawtooth");
}

int main() {
    // File handling with error check
    FILE *output_file = fopen("waveform_comparison.txt", "w");
    if (output_file == NULL) {
        fprintf(stderr, "Error: Could not open output file\n");
        return 1;
    }

    // Debug info
    if (DEBUG) {
        printf("Debug Info:\n");
        printf("Sine Frequency: %.1f Hz\n", SINE_FREQ);
        printf("Sawtooth Frequency: %.1f kHz\n", SAWTOOTH_FREQ/1000);
        printf("Time Step: %.1e s\n", TIME_STEP);
        printf("Simulation Time: %.2f ms\n\n", SIMULATION_TIME*1000);
    }

    fprintf(output_file, "Time,Rectified_Sine,Sawtooth,Output_Pulse\n");

    double prev_sine = 0;
    double prev_saw = 0;
    int prev_pulse = 0;
    int samples = 0;

    for(double t = 0; t < SIMULATION_TIME; t += TIME_STEP) {
        double sine_val = rectified_sine(t);
        double saw_val = sawtooth(t);
        int pulse = (sine_val > saw_val) ? 1 : 0;

        if (t == 0 || pulse != prev_pulse || 
            fabs(sine_val - prev_sine) > 1e-6 || 
            fabs(saw_val - prev_saw) > 1e-6) {
            
            fprintf(output_file, "%.10f,%.6f,%.6f,%d\n", 
                    t, sine_val, saw_val, pulse);
            samples++;

            prev_sine = sine_val;
            prev_saw = saw_val;
            prev_pulse = pulse;
        }

        if(fmod(t, SIMULATION_TIME/10) < TIME_STEP) {
            printf("Progress: %.0f%%\n", (t/SIMULATION_TIME) * 100);
        }
    }

    fclose(output_file);
    if (DEBUG) {
        printf("\nTotal samples saved: %d\n", samples);
    }
    printf("Simulation complete! Results saved to 'waveform_comparison.txt'\n");

    return 0;
}
