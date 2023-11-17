# Import the library
from clifford.g3 import *  # import GA for 3D space
from math import e, pi
from rich import print
import numpy as np
from numpy.fft import fft
from clifford import g3c

# prob1 from HW5 used this example sequence. using it for testing
n_min = 0
n_max = 10
n = np.arange(n_min, n_max + 1)
N = n_max+1
x_n = 10 * (0.6)**n


# Importing the layout and basic multivectors for 3D CGA (Conformal Geometric Algebra)
layout, blades = g3c.Cl(3, 0, 1, firstIdx=0)


# Create an array to hold the GA-based DFT using Cliffords
X_clifford = np.zeros(len(n), dtype=object)


# Compute the GA-based DFT manually
# For this simple example,
# I'll use the Clifford library's geometric product
# as a stand-in for complex multiplication
for k in range(N):
    for n_idx, n_val in enumerate(n):
        angle = -2 * np.pi * k * n_val / N
        # in clifford, e12 == i or j 
        basis_blade = np.cos(angle) + e12*np.sin(angle)
        X_clifford[k] += x_n[n_idx] * basis_blade


# complex value array is the same since multivector contains it
X_clifford_complex = X_clifford


# compute the fft using standard methods
X_standard = fft(x_n)


# debugging prints
# print(X_clifford_complex)
# print(X_standard)
# com_val = X_clifford_complex[2][e12]
# print(com_val)


# go through each of the above and exit with failure if there is a disagreement between methods
for k in range(0, len(X_standard)):
    val1_real = X_clifford_complex[k][0]
    val1_imag = X_clifford_complex[k][e12]
    val2_real = np.real(X_standard[k])
    val2_imag = np.imag(X_standard[k])
    print(f"X_clifford_complex_real : {val1_real}")
    print(f"X_standard_real         : {val2_real}")
    print(f"X_clifford_complex_imag : {val1_imag}")
    print(f"X_standard_imag         : {val2_imag}")
    print(f"diff1: {float(val2_real - val1_real)}")
    print(f"diff2: {float(val2_imag - val1_imag)}")
    test_real = float(val2_real - val1_real) < 1e-9
    test_imag = float(val2_imag - val1_imag) < 1e-9
    print(f"comparing: {test_real}")
    print(f"comparing: {test_imag}")
    if not test_real:
        print(f"[bold red]failure[/bold red] at test_real: {test_real}\nval2 not close enough to val1\n")
    else:
        print("[bold green]successful![/bold green]")
    if not test_imag:
        print(f"[bold red]failure[/bold red] at test_imag: {test_real}\nval2 not close enough to val1\n")
    else:
        print("[bold green]successful![/bold green]")
