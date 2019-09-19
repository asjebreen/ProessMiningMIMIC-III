# This code is used to calculate missing values in .csv files.
# You need to place this code in same folder where your .csv file(s) are then run it

# Import necessary Python library
import pandas as pd
import glob

# Read all .csv files available in same folder
data = glob.glob('*.csv')

# Loop to check missing values in every column for each file, then print the filename with all its columns and the missing values total
for inspectedFile in data:
    inspectedColumn = pd.read_csv(inspectedFile)
    print(" Missing values in:",  inspectedFile)
    print(" ------- ")
    print(inspectedColumn.isnull().sum())
    print(" ------- ")  










