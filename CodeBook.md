Coursera-Getting-Cleaning-Data
==============================
CodeBook for Peer Assessment project

A full description of the variables and the data can be found in the main directory of the dataset in the zipped file here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
and also on this website:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

No new variables were created in the merging of data sets, however variables from different tables in the data sets were extracted and combined to form the merged data set.

The merged data set contains one column for each of the variables that describe the mean or standard deviation of a measurement, for a particular subject and activity. We also added columns to identify the subject, and the activity being performed (both the code and the description of the activity).

To create the tidy data set (tidied_dataset.txt) we used the 'melt' function to compute the averages of means and standard deviations.


