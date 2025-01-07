function X = dit_fft(x)
    N = length(x);
    X = x;
    
    // Bit reversal permutation
    j = 1;
    for i = 1:N
        if i < j
            temp = X(i);
            X(i) = X(j);
            X(j) = temp;
        end
        m = N / 2;
        while m >= 1 && j > m
            j = j - m;
            m = m / 2;
        end
        j = j + m;
    end
    
    // FFT computation using DIT-FFT
    L = log2(N);
    for l = 1:L
        m = 2^l;
        wm = exp(-%i * 2 * %pi / m);  // Twiddle factor
        for k = 1:N / m
            w = 1;
            for j = 0:m/2-1
                t = w * X(k + j + m/2);
                u = X(k + j);
                X(k + j) = u + t;
                X(k + j + m/2) = u - t;
                w = w * wm;
            end
        end
    end
end

// Given sequence
x = [1, -1, -1, -1, 1, 1, 1, -1];

// Compute DFT using DIT-FFT
X = dit_fft(x);

// Display result
disp("DFT of the sequence is:");
disp(X);
