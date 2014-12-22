
## This script meets the following conditions: 
## 1.Merges the training and the test sets to create one data set.
## 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3.Uses descriptive activity names to name the activities in the data set
## 4.Appropriately labels the data set with descriptive variable names. 
## 5.From the data set in step 4, creates a second, independent tidy data set with the average
## of each variable for each activity and each subject.
## The data can be found at: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## First unzip downloaded file
unzip("getdata_projectfiles_UCI HAR Dataset.zip")

## Read files into data frames
trainX = read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
trainY = read.csv("UCI HAR Dataset/train/Y_train.txt", sep="", header=FALSE)
trainSubj = read.csv("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE)
activityLabels = read.csv("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)
features = read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE)
testX = read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
testY = read.csv("UCI HAR Dataset/test/Y_test.txt", sep="", header=FALSE)
testSubj = read.csv("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE)

## label each variable name
colnames(trainX) = features[,2]
colnames(testX) = features[,2]
colnames(activityLabels)[1]="ActivityID"
colnames(activityLabels)[2]="Activity"

## Merge Training sets & Testing sets together, then Merge Traing with Testing sets
trainData = cbind(trainX,trainSubj,trainY)
testData = cbind(testX,testSubj,testY)
myData <- rbind(trainData,testData)

## label each variable name with feature name
colnames(myData) = features[,2]
names(myData)[562] <- "Subjects"
names(myData)[563] = "ActivityID"


## Extract only the measurements on the mean and standard deviation for each measurement 
myFeatures <- grep(".*mean.*|.*std.*", features[,2])
myFeatures <- c(myFeatures,562,563)   ## Add last two columns
mySubData = myData[,myFeatures]



## Use descriptive activity names to name the activities in the data set
mySubData = merge(mySubData,activityLabels,"ActivityID")
mySubData <-mySubData[,c(ncol(mySubData),1:(ncol(mySubData)-1))]  ## Move last variable to first
mySubData <-mySubData[,c(ncol(mySubData),1:(ncol(mySubData)-1))]  ## Move last variable to first


## Appropriately label the data set with descriptive variable names. 
names(mySubData) <- gsub("mean", "Mean", names(mySubData))
names(mySubData) <- gsub("std", "StdDev", names(mySubData))
names(mySubData) <- gsub("Acc", "Accelerator", names(mySubData))
names(mySubData) <- gsub("^t", "Time-", names(mySubData))
names(mySubData) <- gsub("^f", "Frequency-", names(mySubData))
names(mySubData) <- gsub("Mag", "Magnitude", names(mySubData))
names(mySubData) <- gsub("Gyro", "Gyroscope", names(mySubData))
names(mySubData) <- gsub("BodyBody", "Body", names(mySubData))


## From the data set in step 4, create a second, independent tidy data set with the average
## of each variable for each activity and each subject.
require(plyr)
tidyData = ddply(mySubData, c("Subjects","Activity"), numcolwise(mean))
write.table(tidyData, file = "tidy.txt", row.names = FALSE)