# %%
import math
import matplotlib.pyplot as plt

# Harmonic Series Introduction

# Harmonic Series Introduction
# The harmonic series is the sum of reciprocals of all positive integers up to a given number n.
# Mathematically, it is expressed as H(n) = 1 + 1/2 + 1/3 + ... + 1/n.
# The series is known for its slow convergence; even for large n, it grows slowly.


def harmonic_series(n):
    """
    Calculate the n-th harmonic number.

    The harmonic number H(n) is defined as the sum of the reciprocals of the first n natural numbers.

    Parameters:
    n (int): The number of terms in the harmonic series.

    Returns:
    float: The n-th harmonic number.
    """
    return sum(1 / i for i in range(1, n + 1))


def approximate_harmonic_difference(n, base):
    """
    Calculate the difference between the n-th harmonic number and the logarithm of n with a given base.

    This function computes the harmonic number H(n) and the logarithm of n with the specified base,
    then returns the difference between these two values.

    Parameters:
    n (int): The number of terms in the harmonic series.
    base (float): The base of the logarithm.

    Returns:
    float: The difference between the n-th harmonic number and the logarithm of n with the given base.
    """
    # Calculate harmonic number
    harmonic_sum = harmonic_series(n)
    # Calculate logarithm of n with the given base
    log_n = math.log(n, base)
    # Return the difference
    return harmonic_sum - log_n


def plot_all():
    x_values = range(1, 10001, 1000)

    # Prepare data for plots
    y_values_diff = [approximate_harmonic_difference(x, math.e) for x in x_values]
    y_values_series = [harmonic_series(x) for x in x_values]

    # Create subplots
    fig, axs = plt.subplots(2, 1, figsize=(10, 8))

    # First plot (H(n) - ln(n))
    axs[0].plot(x_values, y_values_diff, marker="o", label="H(n) - ln(n)")
    axs[0].axhline(
        y=0.57721, color="r", linestyle="--", label="Euler-Mascheroni constant (γ)"
    )
    axs[0].set_title("Difference between Harmonic Series and Natural Logarithm")
    axs[0].set_xlabel("n")
    axs[0].set_ylabel("H(n) - ln(n)")
    axs[0].legend()
    axs[0].grid(True)

    # Second plot (Harmonic Series)
    axs[1].plot(x_values, y_values_series, marker="o")
    axs[1].set_title("Harmonic Series")
    axs[1].set_xlabel("n")
    axs[1].set_ylabel("H(n)")
    axs[1].grid(True)

    # Adjust space between plots
    plt.tight_layout()

    # %%
    plt.show()


# Plot both series
plot_all()
print(approximate_harmonic_difference(1000000, math.e))
