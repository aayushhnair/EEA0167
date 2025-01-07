// Sampling and cutoff frequencies
fs = 8000;  // Sampling frequency in Hz
fc = 1000;  // Cutoff frequency in Hz

// Normalize and pre-warp the analog cutoff frequency
omega_c = 2 * %pi * fc;  // Analog cutoff angular frequency
prewarped_wc = 2 * fs * tan(omega_c / (2 * fs));  // Pre-warped frequency

// Butterworth analog filter coefficients (1st order)
num = [0, prewarped_wc];  // Numerator coefficients
den = [1, prewarped_wc];  // Denominator coefficients

// Bilinear transformation to digital domain (Manual implementation)
T = 1 / fs;  // Sampling period
a = 2 / T;   // Bilinear transform constant

// Transform coefficients
numz = [num(2), num(2)] / (den(2) + den(1) * a);
denz = [1, (den(1) * a - den(2)) / (den(2) + den(1) * a)];

// Display digital filter coefficients
disp("Numerator coefficients (b):");
disp(numz);
disp("Denominator coefficients (a):");
disp(denz);

// Frequency response calculation
N = 512;  // Number of frequency points
f = linspace(0, fs / 2, N);  // Frequency vector
z = exp(%i * 2 * %pi * f / fs);  // Unit circle points
H = polyval(numz, z) ./ polyval(denz, z);  // Frequency response

// Plot frequency response
clf();
plot(f, abs(H));
xgrid();
xlabel("Frequency (Hz)");
ylabel("Magnitude");
title("Frequency Response of the Digital Filter");
