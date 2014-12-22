Getting-Cleaning-Data-Project
=============================

The purpose of this project is to demonstrate how to collect, work with and clean a data set. The goal is to prepare tidy data that can be used for later analysis. This project will have a script to create a tidy data set and a code book describing the variables. 

This readme file will explain how the "run_analysis.R" script works and what it does. The purpose of run_analysis.R script is to create a tidy data set from the Human Activity Recognition Using Smartphones Data Set. For actual code, please view the run_analysis.R file.

### Getting data for processing
The script first gets the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip . 
It then reads the files found in Zip file into data frames. 

### Step 1 - Merge and Label Data Sets
Each variable is labeled in the training and testing data sets. The activity label data frame is then labeled. The training, testing, subject and activity data sets are then merged. 

### Step 2 - Give variables descriptive names
The variables are then given descriptive names by using feature names. The names comes from the features data set(file). The last two variables are renamed to "Subjects" and "ActivityID", respectively.See CodeBook.md for more information on features.

### Step 3 - Subset Data
Further processing is done by subsetting the new merged data set by selecting only variables that have data related to Mean and Standard Deviations.

### Step 4 - Use descriptive activity names
Activty names are added to the data set. Also, Subject and Activty variables are moved to the beginning of the data frame. 

### Step 5 - Make Variable names more descriptive
Variable names are then cleaned up to be more descriptive. See CodeBook.md for more information on name clean up.

### Step 6 - Create new tidy file
Finally, a the data set is modified to include the mean of the "Subjects" and "Activity" variables. This data set is then saved as a text file.
