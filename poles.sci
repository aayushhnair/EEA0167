clear; clc; close;  

// Parameters
fcut = 5;       // Cutoff frequency in Hz
n = 7;           // Filter order
omega_c = 2 * %pi * fcut; // Convert cutoff frequency to angular frequency

// Butterworth Poles
k = 0:(n - 1);
theta = (2 * k + 1) * %pi / (2 * n); // Pole angles
poles = omega_c * %i * tan(theta);   // Butterworth poles
poles = poles(real(poles) < 0);      // Select only poles in the left-half plane

// Transfer function (Numerator and Denominator)
numerator = omega_c^n;             // High-pass numerator for Butterworth
denominator = poly(poles, 's');    // Polynomial for the denominator

// Define the transfer function
H = syslin('c', numerator, denominator);

// Frequency response and plotting
freqs = 0:0.01:15;                 // Frequency range (Hz)
omega = 2 * %pi * freqs;           // Convert to angular frequency

// Compute frequency response using freq
hf = freqs(H, omega);               // Correct usage of the freqs function

// Plot magnitude response
clf();
plot(freqs, abs(hf), 'c', 'LineWidth', 2);
legend(["Butterworth HPF"]);
xlabel("Frequency (Hz)");
ylabel("Gain");
title("Analog High-Pass Butterworth Filter of Order 7");
xgrid();
