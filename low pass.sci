fcut = 5; // Hz
n = 7; // Filter order

// Create the Butterworth filter
hb = analpf(n, 'butt', [0 0], fcut*2*%pi); // Butterworth

// Set filter properties
hb.dt = 'c';

// Plot the magnitude response for the Butterworth filter
clf();
[fr, hf] = repfreq(hb, 0, 15); 
plot(fr, abs(hf), 'r'); // Butterworth in cyan

// Add legend and labels
legend(["Butterworth"]);
xgrid();
xlabel("Frequency (Hz)");
ylabel("Gain");
title("Butterworth filter of order 7");
