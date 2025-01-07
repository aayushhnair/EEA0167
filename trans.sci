// Specifications
fs = 8000;  // Sampling frequency in Hz
fc = 1000;  // Cutoff frequency in Hz

// Analog cutoff frequency
omega_c = 2 * %pi * fc;

// Butterworth filter design (Analog prototype)
order = 1;  // Order of the filter
num = [0, omega_c];  // Numerator of the analog filter
den = [1, omega_c];  // Denominator of the analog filter

// Impulse Invariant Transformation (Manual implementation)
T = 1 / fs;  // Sampling period
numz = num * T;  // Scale numerator coefficients
denz = poly(exp(-den(2) * T), 'z');  // Digital denominator (exponential mapping)

// Display the digital filter coefficients
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
title("Frequency Response of the Digital Butterworth Filter");
