library(dplyr)
library(reshape2)
# Open File, if needed download and unzip it
file <- "UCI HAR Dataset.zip"
if (!file.exists(file)) {
        print("Downloading the Zip file")
        Url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(url = Url, destfile = "UCI HAR Dataset.zip",method = "curl")
        print("Unzipping")
        unzip("UCI HAR Dataset.zip")
        
}


# 1. Merges the training and the test sets to create one data set. /
# 4 Appropriately labels the data set with descriptive variable names.

print("Reading Features file")
features <- read.table("./UCI HAR Dataset/features.txt")

print("Reading and prepating test data")
X_test<-read.table("./UCI HAR Dataset/test/X_test.txt",col.names = features[,2])
Y_test<-read.table("./UCI HAR Dataset/test/Y_test.txt",col.names = "activity")
subject_test<-read.csv("./UCI HAR Dataset/test/subject_test.txt",sep=" ",header=FALSE,col.names = "subject")
print("Grouping variables from X_train X_test Y_test and subject_test to single data frame:alltestset ")
alltestset<-cbind(subject_test[1],Y_test[1],X_test)

print("Reading and prepating train data")
X_train<-read.table("./UCI HAR Dataset/train/X_train.txt",col.names = features[,2])
Y_train<-read.table("./UCI HAR Dataset/train/Y_train.txt",col.names = "activity")
subject_train<-read.csv("./UCI HAR Dataset/train/subject_train.txt",sep=" ",header=FALSE,col.names = "subject")
print("grouping variables from X_train Y_train and subject_train to single data frame:alltrainset ")
alltrainset<-cbind(subject_train[1],Y_train[1],X_train)

# Merge Test and Trainig data sets to a single data frame
allset<-rbind(alltestset,alltrainset)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
print("Find all mean and standard deviations variables ")
colsmean<-grep("mean", names(allset))
colsstd<-grep("std", names(allset))
allset_means_std<-allset[c(1:2, colsmean,colsstd)]

# 3. Uses descriptive activity names to name the activities in the data set
print("Reading Activity Labels")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
print("Match all activities ids to activity_labels and create a vector with activity names")
activity_names<-activity_labels[match(allset_means_std$activity, activity_labels$V1),2]
print("Creating data frame with activity names")
allset_labels<-cbind(activity_names,allset_means_std)



# 4. Appropriately labels the data set with descriptive variable names.
# Step 4 was implemented along with step 1 above

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
print("Melting to subject and activity")
allsetl <- melt(allset_means_std, id = c("subject", "activity"))
print("Dcasting applying mean to subject + activity")
allsetw <- dcast(allsetl, subject + activity ~ variable, mean)
print("Reapplying activity labels and creating final tidy data set")
activity_names<-activity_labels[match(allsetw$activity, activity_labels$V1),2]

# Final Tidy set with mean per subject and activity
allset_tidy<-cbind(activity_names,allsetw)
write.table(allset_tidy,"allset_tidy.txt")



