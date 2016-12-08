Final Assignment for Getting and Cleaning Data Project 

1- This script Performs the following steps 

- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names.
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

2- It generates the final tidy "allset_tidy.txt" file in current directory

"Unzipping": 
"Reading Features file"
"Reading and prepating test data"
"Grouping variables from X_train X_test Y_test and subject_test to single data frame:alltestset "
"Reading and prepating train data"
"grouping variables from X_train Y_train and subject_train to single data frame:alltrainset "
"Find all mean and standard deviations variables "
"Reading Activity Labels"
"Match all activities ids to activity_labels and create a vector with activity names"
"Creating data frame with activity names"
"Melting to subject and activity"
"Dcasting applying mean to subject + activity"
"Reapplying activity labels and creating final tidy data set"
> 
