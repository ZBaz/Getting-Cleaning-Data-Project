Getting-Cleaning-Data-Project
=============================

The purpose of this project is to demonstrate how to collect, work with and clean a data set. The goal is to prepare tidy data that can be used for later analysis. This project will have a script to create a tidy data set and a code book describing the variables. 

This readme file will explain how the "run_analysis.R" script works and what it does. The purpose of run_analysis.R script is to create a tidy data set from the Human Activity Recognition Using Smartphones Data Set. 

### Step 1
The script first gets the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip . 
It then reads the files found in Zip file into data frames. 

Then each variable is labeled in the training and testing data sets. The activity label data frame is then labeled.The training, testing, subject and activity data sets are then merged. 

The last two variables are renamed to "Subjects" and "ActivityID", respectively.

Further processing is done by subsetting the new merged data set by selecting only variables that have data related to Mean and Standard Deviations.

The Activities are then given descriptive names. Also, Subject and Activty variables are moved to the beggininng of the data frame.

Variable names are then cleaned up to be more descriptive.

Finally, a the data set is modified to include the mean of the "Subjects" and "Activity" variables. This data set is then saved as a text file.
