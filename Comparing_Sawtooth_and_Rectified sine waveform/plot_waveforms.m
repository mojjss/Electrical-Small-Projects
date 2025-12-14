% filepath: /wave_plot.m
% Load and prepare data with error checking
try
    % Read CSV file
    data = readtable('waveform_comparison.txt');
    
    % Get column names for verification
    colNames = data.Properties.VariableNames;
    
    % Extract data using exact column names from CSV
    time = data.Time;
    rectified_sine = data.Rectified_Sine;
    sawtooth = data.Sawtooth;
    output_pulse = data.Output_Pulse;
catch err
    fprintf('Error loading data: %s\n', err.message);
    % Display available column names if table was loaded
    if exist('data', 'var')
        fprintf('Available columns are:\n');
        disp(data.Properties.VariableNames);
    end
    return;
end

% Create figure with specified size
figure('Position', [100, 100, 800, 900]);

% Plot 1: Rectified Sine Wave
subplot(4, 1, 1);
plot(time*1000, rectified_sine, 'b-', 'LineWidth', 1.5);
title('Rectified Sine Wave (100 Hz)');
xlabel('Time (ms)');
ylabel('Amplitude');
grid on;
ylim([-1.2, 1.2]);

% Plot 2: Sawtooth Wave
subplot(4, 1, 2);
plot(time*1000, sawtooth, 'r-', 'LineWidth', 1.5);
title('Sawtooth Wave (100 kHz)');
xlabel('Time (ms)');
ylabel('Amplitude');
grid on;
ylim([-1.2, 1.2]);

% Plot 3: Both Waves Overlaid
subplot(4, 1, 3);
plot(time*1000, rectified_sine, 'b-', time*1000, sawtooth, 'r-', 'LineWidth', 1.5);
title('Overlaid Waveforms');
xlabel('Time (ms)');
ylabel('Amplitude');
legend('Rectified Sine', 'Sawtooth');
grid on;
ylim([-1.2, 1.2]);

% Plot 4: Output Pulse
subplot(4, 1, 4);
plot(time*1000, output_pulse, 'k-', 'LineWidth', 1.5);
title('Output Pulse');
xlabel('Time (ms)');
ylabel('Logic Level');
grid on;
ylim([-0.2, 1.2]);

% Add overall title
sgtitle('Waveform Comparison Analysis');

% Add zoom controls for detailed view
zoom on;

% Optional: Create a zoomed view of first 1ms
figure('Position', [900, 100, 800, 900]);
timeWindow = time <= 0.001; % 1ms window

subplot(4,1,1);
plot(time(timeWindow)*1000, rectified_sine(timeWindow), 'b-', 'LineWidth', 1.5);
title('Rectified Sine Wave (Zoomed 1ms)');
grid on;

subplot(4,1,2);
plot(time(timeWindow)*1000, sawtooth(timeWindow), 'r-', 'LineWidth', 1.5);
title('Sawtooth Wave (Zoomed 1ms)');
grid on;

subplot(4,1,3);
plot(time(timeWindow)*1000, rectified_sine(timeWindow), 'b-', ...
     time(timeWindow)*1000, sawtooth(timeWindow), 'r-', 'LineWidth', 1.5);
title('Overlaid Waveforms (Zoomed 1ms)');
legend('Rectified Sine', 'Sawtooth');
grid on;

subplot(4,1,4);
plot(time(timeWindow)*1000, output_pulse(timeWindow), 'k-', 'LineWidth', 1.5);
title('Output Pulse (Zoomed 1ms)');
grid on;

sgtitle('Detailed View (First 1ms)');

% Create a combined plot of all waveforms
figure('Position', [100, 100, 800, 600]);
plot(time*1000, rectified_sine, 'b-', 'LineWidth', 1.5);
hold on;
plot(time*1000, sawtooth, 'r-', 'LineWidth', 1.5);
plot(time*1000, output_pulse, 'k-', 'LineWidth', 1.5);
hold off;
title('Combined Waveforms');
xlabel('Time (ms)');
ylabel('Amplitude / Logic Level');
legend('Rectified Sine', 'Sawtooth', 'Output Pulse');
grid on;
ylim([-1.2, 1.2]);
