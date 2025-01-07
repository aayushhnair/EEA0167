clc;
clear;
t = 0:0.1:10;
y = exp(0.5 * t);
plot(t, y, 'b-');
xlabel('t');
ylabel('Amplitude');
title('Exponential Signal');
xgrid();
