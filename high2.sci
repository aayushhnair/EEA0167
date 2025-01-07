fcut = 5; 
n = 7;    
fs = 50;  


wc = 2 * %pi * fcut / fs;

f = 0:0.1:15; 
omega = 2 * %pi * f / fs; 

h = 1 ./ sqrt(1 + (wc ./ omega).^(2 * n));


h(omega == 0) = 0;


plot(f, abs(h), 'r');
xgrid();
xlabel('Frequency (Hz)');
ylabel('Gain');
title('High-pass Filter');
legend(['Order ' + string(n) + ' High-pass']);
