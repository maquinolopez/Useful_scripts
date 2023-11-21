# Useful_scripts
## A miscellany of different useful R and Python scripts

This repo contains various useful R and Python scripts for data analysis and visualization.

## Contents

### Plum_acc_rates

R scripts to calculate accumulation rates from Plum age-depth model outputs.

- Calculates rates by depth and age
- Adds accumulation rate columns to Plum age file
- Outputs accumulation rates by age to new file

---

### PyCalibrate

Python script for radiocarbon date calibration. 

- Calibrates 14C dates using calibration curves
- Calculates calendar age ranges containing specified probability
- Plots probability density and highlighted ranges
- Handles IntCal20, SHCal20, Marine20 calibration curves


---

### Cpp distros

The folder "Cpp_Distributions" contains the `Distributions.cpp` file, which integrates with Rcpp to provide functions for calculating log likelihoods of statistical distributions in R. The file includes functions for the Normal, T (currently a placeholder), and Gamma distributions.




## Usage

The scripts are intended to be customized/extended as needed for different projects.

Modify variables like core name, directories, calibration curves etc. for your use case.

## Requirements

- R and rplum package (for Plum_acc_rates)
- Python with Pandas, Numpy, Matplotlib, Scipy (for PyCalibrate)

## Author

Marco A Aquino-López 

Contact: aquino@cimat.mx

## License 

Released under MIT License (see LICENSE file for details)