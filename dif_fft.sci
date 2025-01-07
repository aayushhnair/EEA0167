function X = dif_fft(x)
    N = length(x);
    X = x;
    
    // FFT computation using DIF-FFT
    L = log2(N);  // Number of stages
    for l = 1:L
        m = 2^l;                // Size of FFT block
        wm = exp(-%i * 2 * %pi / m);  // Twiddle factor
        for k = 0:(N/m - 1)
            for j = 0:(m/2 - 1)
                index1 = k * m + j + 1;       // Index for the first element
                index2 = index1 + m / 2;     // Index for the second element
                
                u = X(index1);               // Upper value
                t = X(index2);               // Lower value
                
                X(index1) = u + t;           // Butterfly computation
                X(index2) = (u - t) * wm^j;  // Twiddle factor multiplication
            end
        end
    end
    
    // Bit reversal permutation
    j = 0;
    for i = 0:(N - 1)
        if i < j
            temp = X(i + 1);  // Swap elements
            X(i + 1) = X(j + 1);
            X(j + 1) = temp;
        end
        m = N / 2;
        while (j >= m) && (m > 0)
            j = j - m;
            m = m / 2;
        end
        j = j + m;
    end
end

// Given sequence
x = [1, -1, -1, -1, 1, 1, 1, -1];

// Compute DFT using DIF-FFT
X = dif_fft(x);

// Display result
disp("DFT of the sequence is:");
disp(X);
