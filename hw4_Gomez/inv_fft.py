import numpy as np

def idfs(X, N):
    x = np.fft.ifft(X)  # Use NumPy's IFFT function to compute IDFS
    return x.real  # Take the real part to get the reconstructed signal

# Example usage
X = [6, -2 + 2j, -2, -2 - 2j]  # Replace with your DFS coefficients
N = len(X)

x_reconstructed = idfs(X, N)

# Print the reconstructed signal
print(x_reconstructed)
