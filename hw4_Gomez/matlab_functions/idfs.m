// function x = idfs(X, N)
// % computes the Inverse Discrete Fourier Series coefficients of a periodic 1-D signal
// % x is one period of the signal 
// % N is the fundamental period. 
// fund_period = N;
// signal = x;
//     % Ensure X and N have the same length
//     if length(X) ~= N
//         error('Length of X must be equal to N');
//     end

//     n = 0:N-1;
//     k = 0:N-1;

//     % Compute the IDFS
//     x = (X * exp(1i * 2 * pi * (n.') * k / N)) / N;

// end
