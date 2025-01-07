n = -10:10;
impulse = zeros(1, length(n));
impulse(n == 0) = 1;
plot2d3(n, impulse);
