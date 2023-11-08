#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
PyCalibrate.py

This script contains a function to calibrate radiocarbon dates using standard calibration curves.

The Calibration() function takes a radiocarbon age, standard deviation, calibration curve, and density percentage as inputs. It returns the calendar age ranges containing the specified percentage of probability density.

Plotting and printing of results is also included.

Author: Marco A Aquino-López

"""

import pandas as pd
from numpy import array, vstack, cumsum, where, max , min, sum, copy, diff, array_split
import matplotlib.pyplot as plt
from scipy.stats import norm
from scipy.signal import find_peaks



def Calibration(x,sd,cc,percentage=95.0 ,cc_folder='path/to/calibration/curves'):
    print(cc)
    # Define file paths for each calibration curve
    if isinstance(cc, str):
        file_paths = cc_folder + cc
        df =  pd.read_csv(file_paths, header=None, names=['age', 'radiocarbon age', 'sd'])
    else:
        file_paths = {
            1: cc_folder + '/IntCal20.14C',
            2: cc_folder + '/SHCal20.14C',
            3: cc_folder + '/Marine20.14C'
        }
        df =  pd.read_csv(file_paths[cc], header=None, names=['age', 'radiocarbon age', 'sd'])
    # Load the appropriate file as a dataframe based on the value of 'cc'
    
    
    # Calculate the range for the radiocarbon age
    lower_bound = x - 10 * sd
    upper_bound = x + 10 * sd
    
    # Find all intersections - rows where the radiocarbon age falls within the calculated range
    intersections = df[(df['radiocarbon age'] >= lower_bound) & (df['radiocarbon age'] <= upper_bound)]
    
    # Calculate the density 
    density = norm.pdf(intersections['radiocarbon age'] , x, intersections['sd']+sd)
        
    # Creating a DataFrame with density
    df = pd.DataFrame({'density': density})
    
    # Calculate the ordered rank for each density value
    df['order'] = df['density'].rank(method='first')
    
    # Sort the dataframe by density in ascending order and reset the index to get the order of each value
    df_sorted = df
    df_sorted['order'] = df_sorted.index + 1  # Order starts at 1
    df_sorted = df.sort_values(by='density',ascending=False)

    
    # Calculate the cumulative density based on the sorted values
    df_sorted['cumulative_density'] = df_sorted['density'].cumsum()
    
    # Normalize the cumulative density by the total sum of densities to get the cumulative probability
    df_sorted['normalized_cumulative_density'] = df_sorted['cumulative_density'] / df_sorted['density'].sum()
    
    # Join the sorted cumulative densities back to the original dataframe using the order
    df = df.join(df_sorted.set_index('order'), on='order', rsuffix='_sorted')

    def find_density_intervals(ages, normalized_cumulative_density, percentages):
        # Threshold for the cumulative density
        threshold = (percentages / 100.0)
        
        # Find where the normalized cumulative density is greater than the threshold
        indices = where(normalized_cumulative_density <= threshold)[0]
               
        return indices

    # Assuming 'ages' is the np.array of ages and 'normalized_cumulative_density' is the np.array from the DataFrame
    # Let's say we want to find the age intervals that contain 80% of the cumulative density

    
    # Plotting the density plot
    plt.figure(figsize=(10, 6))
    plt.fill_between(intersections['age'], density, alpha=0.8, color='gray')

    indx = find_density_intervals(intersections['age'].to_numpy(), df['normalized_cumulative_density'], percentage)
    density_indx = copy(density)

    # Set all values to 0 that are not in the 'indx' array
    for i in range(len(density_indx)):
        if i in indx:
            density_indx[i] = density[i]
        else:
            density_indx[i] = 0

    plt.fill_between(intersections['age'], density_indx, alpha=0.5, color='red')
    
    plt.title('Density Plot')
    plt.xlabel('Age')
    plt.ylabel('Density')
    plt.grid(True)
    plt.show()
    
    
    # Calculate the differences between consecutive elements
    differences = diff(indx)
    
    # Find indices where the difference is greater than 1
    gaps = where(differences > 1)[0]
    
    # Initialize the vector with the first index
    result_vector = [indx[0]]
    
    # Add the indices before and after the gaps
    result_vector.extend(indx[gaps])
    result_vector.extend(indx[gaps + 1])
    
    # Add the last index
    result_vector.append(indx[-1])
    
    # Convert to a numpy array for consistency
    result_vector = array(result_vector)
    
    intervals = intersections['age'].to_numpy()[result_vector]
    n = len(intervals )/2
    divided = array_split(intervals, n)
    print('the intervals which combine make a '+ str(percentage) +'% of the probability are:')
    for i in divided:
        print(i)
    

    return divided
    
    



# Example of the use of the Calibration function

# test = Calibration(1000, 20, 'IntCal20.14C', percentage=90,cc_folder='/Users/ma2060/Documents/PyPlum/Calibration Curves/')

# test






