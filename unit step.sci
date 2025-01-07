clc;
clear;
close;

t = -5:0.1:5;
s = zeros(1, length(t));

for i = 1:length(t)
    if t(i) >= 0
        s(i) = 1;
    else
        s(i) = 0;
    end
end

plot(t, s, 'b', 'LineWidth', 2);
xlabel('Time (t)');
ylabel('Amplitude');
title('Unit Step Signal');
xgrid();
