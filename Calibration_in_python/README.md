# Calibration() Function Manual

The `Calibration()` function calibrates a radiocarbon date and returns the age ranges that contain a specified percentage of the probability density.

## Usage

```python
Calibration(x, sd, cc, percentage=95.0, cc_folder='path/to/calibration/curves')
```

## Arguments

- `x`: The radiocarbon date to be calibrated (float)
- `sd`: The standard deviation of the radiocarbon date (float) 
- `cc`: Either a string specifying the name of the calibration curve file, or an integer code specifying which of the predefined calibration curves to use (1 - IntCal20, 2 - SHCal20, 3 - Marine20)
- `percentage`: The percentage of the probability density to include in the calibration age ranges (float between 0 and 100)
- `cc_folder`: The folder path containing the calibration curve files (string)

## Returns

A list of arrays containing the age ranges for the specified percentage of probability density. Each inner array contains the lower and upper bounds of an age range.

The function first calculates the radiocarbon age range by adding/subtracting 10 * sd from the input radiocarbon age x.

It then intersects this range with the selected calibration curve to get the calendar age probability density. 

The density is normalized and cumulative probability calculated.

Age ranges containing the specified percentage of probability are found.

These ranges are returned for use in calibration of the radiocarbon date.

The function will also generates a plot showing the probability density and highlighted age ranges.


### Author

Marco A Aquino-López 

Contact: aquino@cimat.mx

### License

Released under MIT License (see LICENSE file for details)