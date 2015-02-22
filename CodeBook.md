## Code book - run_analysis.R

# Script

Data is downloaed and extracted from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Three data consists of subjects, activities and variables. Mean and standard deviation will be exrtacted from each varaible 
and held in a tidy data frame. this script will write the tidy_data frame to the "UCI HAR Dataset" folder of the current working 
directory.

# Variables

Features - table containing list of calculations captured (variables). Feature ID and Feature Name
Activities - table containing list of activities performed by the subjects. Activity ID , Activity Name 
Subject_train / subject_test - table containing Subject ID
x_train / x_test - table containing test results  
y_train / y_test - table containing labels for test results

data - merged train and test data sets
std_col_i - index of variables containing 'std' in name
std_col_n - names of columns indexed in std_col_i
mean_col_i - index of variables containing 'mean' in name
mean_col_n - names of columns indexed in mean_col_i
data_xtract - subset of data, columns defined in std_col_n and mean_col_n 
melted_data - result of melt function on data_extract
tidy_data - result of dcast function on melted_data



