import numpy as np
import matplotlib.pyplot as plt
n_min = 0
n_max = 10
n = np.arange(n_min, n_max + 1)
x_n = 10 * (0.6)**n
n_shift = 6
N = 16
n_periodic = np.arange(0, N)
x_shifted_periodic = 10 * (0.6)**((n_periodic - n_shift) % N)
fig, axs = plt.subplots(2, 1, figsize=(12, 10))

# Plot original sequence
axs[0].stem(n, x_n, 'b', markerfmt='bo', basefmt=" ", linefmt='b-', label='$x(n)$')
axs[0].set_title('Original Sequence $x(n) = 10 \cdot (0.6)^n$')
axs[0].set_xlabel('n')
axs[0].set_ylabel('Amplitude')
axs[0].grid(True)
axs[0].legend()

# Plot shifted and periodic sequence
axs[1].stem(n_periodic, x_shifted_periodic, 'r', markerfmt='ro', basefmt=" ", linefmt='r-', label='$x((n - 6))_{16}$')
axs[1].set_title('Shifted and Periodic Sequence $x((n - 6))_{16}$')
axs[1].set_xlabel('n')
axs[1].set_ylabel('Amplitude')
axs[1].grid(True)
axs[1].legend()

plt.tight_layout()
plt.show()
