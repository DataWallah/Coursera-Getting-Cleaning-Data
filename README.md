Coursera-Getting-Cleaning-Data
==============================
README for Peer Assessment project

Files in this repo:
README.md : This file
run_analysis.R : Script to extract relevant data, merge and then write tidy data
tidied_data.txt : Tidied data per requirement (large--contains 66*10299 rows)
CodeBook.md : how the data was cleaned up

The assignment used data provide here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
and the requirements were to write a script that:
1) Merges the training and the test sets to create one data set.
2) Extracts only the measurements on the mean and standard deviation for each measurement. 
3) Uses descriptive activity names to name the activities in the data set
4) Appropriately labels the data set with descriptive activity names. 
5) Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

The data set contains a directory of test data, and another directory of training data. In both directories there are also tables that detail the activities and subjects associated with the data sets, as well as the raw data used to compile the test and training data sets. We did not use the raw data in this exercise. 

In the main directory there are additional tables that describe further the activities, and a table that provides a listing of all the variables in the main test and training datasets.

run_analysis.R is the single script for the assignment. It is well documented in-line, however here
is the summary of steps taken to produce the tidied data.

Step 1: read the 'features.txt' file to get the column names and grep the ones with 'mean' or 'std' labels.

Step 2: Read the data files in the test and train subdirectories, create subsets based on the columns grepped above, append colums for activities and subjects read the test data set (path can be hardcoded) and subset

Step 3: Apply the descriptive activity labels

Step 4: Create the tidy data set as required (contains the mean of each variable for every activity and every subject. Uses the melt function from the reshape2 library (assumes reshape2 is installed)

Step 5: Write out the dataset to the current directory.





