clear; clc; close;

s = poly(0, 's');
Omegac = 0.2 * %pi;
H = Omegac / (s + Omegac);

T = 1;

z = poly(0, 'z');
Hz_LPF = horner(H, (2 / T) * ((z - 1) / (z + 1)));

HW = frmag(Hz_LPF(2), Hz_LPF(3), 512);
W = 0:%pi / 511:%pi;

plot(W / %pi, HW);
a = gca();
a.thickness = 3;
a.foreground = 1;
a.font_style = 9;
xgrid(1);
xtitle('Magnitude Response of Low-Pass Butterworth Filter Cutoff Frequency = 0.2*pi', 'Digital Frequency-->', 'Magnitude');

disp("Hz_LPF = ", Hz_LPF);
