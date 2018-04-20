# How to combine two date columns with different formats 
Dealing with dates with multiple formats can be challenging. In this example, we will be creating a new date column (NewDate) by combining two date columns with yyyy-mm-dd and dd-mm-yyyy formats

##Step 1) 
Importing data and load the necessary packages
Date.csv is a small sample data frame used for this example. You need two packages: 1) lubridate to manipulate date columns and 2) dplyr to create a new column

##Step 2)
Standardize the format of two date columns, "CollDate" (yyyy-mm-dd) and "AccDate" (dd-mm-yyyy). Note that cells with only complete dates are formatted. Cells with incomplete dates will become "NAs" and sometimes formatted incorrectly. So I suggesting subsetting only the complete dates (containing date, month and year ) prior to this step. Here, we create a new column of CollDate and AccDate that are formatted correctly (yyyy-mm-dd)

##Step 3) 
Creating a new column, "NewDate", which is a combination of CollDate2 and AccDate2. In this step, we use mutate function in dplr to adds new column while preserves existing columns. The logic is the new column is that if CollDate2 is empty, fill with AccDate2. Otherwise, fill with CollDate2

##Reference:
https://stackoverflow.com/questions/41668795/using-mutate-with-dates-gives-numerical-values
