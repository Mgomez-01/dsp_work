# Importing the required libraries again
import numpy as np
from numpy.fft import fft

# Re-establishing the original sequence parameters and calculating the sequence
n_min = 0
n_max = 10
n = np.arange(n_min, n_max + 1)
x_n = 10 * (0.6)**n

# Initialize an array to store the GA-based DFT
X_ga = np.zeros(len(n), dtype=complex)

# Compute the GA-based DFT manually
# This is essentially the same as the standard DFT for this example
N = len(n)
for k in range(N):
    for n_idx, n_val in enumerate(n):
        X_ga[k] += x_n[n_idx] * np.exp(-1j * 2 * np.pi * k * n_val / N)

# Compute the standard DFT using NumPy for comparison
X_standard = fft(x_n)

# Compare the two DFTs to check if they match
comparison = np.allclose(X_standard, X_ga)

X_standard, X_ga, comparison
