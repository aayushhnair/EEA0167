clear;
clc;
close;

s = poly(0, 's'); // Define the Laplace variable
Omegac = 0.2 * %pi; // Cutoff frequency
H = Omegac / (s + Omegac); // Transfer function of the analog LPF

T = 1; // Sampling period T = 1 second

// Bilinear transformation for LPF to HPF
z = poly(0, 'z');
Hz_LPF = horner(H, (2 / T) * ((z - 1) / (z + 1))); // Low-pass filter
alpha = -(cos((Omegac + Omegac) / 2)) / (cos((Omegac - Omegac) / 2)); // Transformation coefficient
HZ_HPF = horner(Hz_LPF, -(z + alpha) / (1 + alpha * z)); // High-pass filter

// Frequency response computation
HW = frmag(HZ_HPF(2), HZ_HPF(3), 512);
W = 0:%pi / 511:%pi;

// Plot magnitude response
plot(W / %pi, HW);
a = gca();
a.thickness = 3;
a.foreground = 1;
a.font_style = 9;
xgrid(1);
xtitle('Magnitude Response of Single Pole HPF Filter Cutoff Frequency = 0.2*pi', ...
       'Digital Frequency-->', 'Magnitude');

// Display the high-pass filter transfer function
disp("HZ_HPF = ", HZ_HPF);
