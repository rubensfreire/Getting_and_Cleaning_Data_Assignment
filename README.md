#######################################
Getting_and_Cleaning_Data_Assignment
Name: README.md
Author: Rubens Freire Rosa
Date: December,08th 2016
#######################################

#Final Assignment for Getting and Cleaning Data Project 

##1- This script Performs the following steps 

- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names.
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##2- How to use it
- source the file run_alalysis.R
- execute the function run_analysis()
- Final result is a tidy "allset_tidy.txt" file in same directory the function was executed
- It requires local "UCI HAR Dataset.zip" file or Internet to download file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##2- Step bu step
1- "Get and Unzip files": 
2- "Read Features file"
3- "Group variables from X_train X_test Y_test and subject_test to single data frame:alltestset "
4- "Read and prepairs train data"
5- "Group variables from X_train Y_train and subject_train to single data frame:alltrainset "
6- "Find all mean and standard deviations variables "
7- "Read Activity Labels"
8- "Match all activities ids to activity_labels and create a vector with activity names"
9- "Create data frame with activity names"
10- "Melt to subject and activity"
11- "Dcast applying mean to subject + activity"
12- "Reapply activity labels and creating final tidy data set"
13- "Save File allset_tidy.txt"

