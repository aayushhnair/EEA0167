clc;
clear;
close;

t = 0:1:10;
r = t;

subplot(2, 1, 1);
plot(t, r, 'b', 'LineWidth', 2);
xlabel('Time');
ylabel('Amplitude');
title('Continuous Ramp Signal');
