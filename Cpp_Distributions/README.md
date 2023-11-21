### Distributions.cpp - Rcpp Integration for Distribution Likelihoods

#### Overview
`Distributions.cpp` is an Rcpp-integrated C++ file designed for use in R. It provides functions to calculate the log-likelihoods of three key statistical distributions:

- Normal Distribution
- T Distribution (currently a placeholder)
- Gamma Distribution

These functions can be directly called from R, offering the performance benefits of C++ for statistical computations.

#### Dependencies
- Rcpp

Make sure you have [Rcpp](https://cran.r-project.org/web/packages/Rcpp/index.html) installed in R for this integration.

#### Functions
The file includes the following exported functions:

1. **Normal Distribution Log Density**
   ```cpp
   double normalLogDensity(double x, double mu, double sigma);
   ```
   Calculates the log density of a normal distribution with parameters `mu` (mean) and `sigma` (standard deviation).

2. **T Distribution Log Density** (Placeholder)
   ```cpp
   double tDistLogDensity(double x, double mu, double sigma, double a, double b);
   ```
   Placeholder function for the log density of a t-distribution. Requires implementation.

3. **Gamma Distribution Log Density**
   ```cpp
   double gammaLogDensity(double x, double a, double b);
   ```
   Calculates the log density of a gamma distribution with shape parameter `a` and rate parameter `b`.

#### Usage in R
To use these functions in R, source the file using Rcpp as follows:

```R
Rcpp::sourceCpp("path/to/Distributions.cpp")
```

Once sourced, the functions can be called directly in R. Example usage:

```R
# Normal Distribution
normal_density <- normalLogDensity(1.0, 0.0, 1.0)

# T Distribution (Placeholder)
t_distribution_density <- tDistLogDensity(1.0, 0.0, 1.0, 2.0, 2.0)

# Gamma Distribution
gamma_density <- gammaLogDensity(1.0, 2.0, 2.0)
```

#### Note
- The T Distribution function is a placeholder and requires a proper implementation.
- Ensure proper memory management and error handling, especially for more complex integrations.




