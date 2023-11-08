# Plum Accumulation Rates

This script calculates accumulation rates from Plum age-depth model outputs. 

## Usage

The script does the following:

1. Loads the Plum R package and runs Plum to generate age-depth outputs if needed.

2. Reads in the Plum age-depth file (_ages.txt). 

3. Calculates accumulation rates by depth using the accrate.depth() function and adds columns to the age file:

   - acc.mean - mean accumulation rate
   - acc.min - 2.5% quantile 
   - acc.max - 97.5% quantile

4. Calculates accumulation rates by age from 0 to max age using the accrate.age() function. Outputs to a new file with columns:

   - Age
   - min - 2.5% quantile
   - mean - mean accumulation rate
   - max - 97.5% quantile

## Inputs

- Core name
- Directory containing Plum runs

## Outputs 

- Updated age-depth file with accumulation rate columns
- New accumulation rate by age file

## Requirements

- R 
- rplum package

## Author 

Marco A Aquino-López

Contact: aquino@cimat.mx

## License

Released under MIT License (see LICENSE file for details)