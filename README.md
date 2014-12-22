Getting-Cleaning-Data-Project
=============================

Geting and Cleaning Data Project

The purpose of this project is to demonstrate how to collect, work with and clean a data set. The goal is to prepare tidy data that can be used for later analysis. This project will have a script to create a tidy data set and a code book describing the variables. 

This readme file will explain how the "run_analysis.R" script works and what it does. The purpose of run_analysis.R script is to create a tidy data set from the Human Activity Recognition Using Smartphones Data Set. 

The script first get the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip . 
It then reads the files found in Zip file into data.frames. 

Then each variable is labeled. The training and testing data sets are then merged.
