import numpy as np
from rich import print


def dfs(x, N):
    X = np.fft.fft(x)  # Use NumPy's FFT function to compute DFS coefficients
    return X


def idfs(X, N):
    x = np.fft.ifft(X)  # Use NumPy's IFFT function to compute IDFS
    return x.real  # Take the real part to get the reconstructed signal


# Example usage dfs
x = [0, 1, 2, 3]
N = 9

X = dfs(x, N)

# Print the DFS coefficients
print(f"X: {X}")


# Example usage idfs
N = len(X)

x_reconstructed = idfs(X, N)
# Print the reconstructed signal
print(f"x_reconstructed: {x_reconstructed}")

