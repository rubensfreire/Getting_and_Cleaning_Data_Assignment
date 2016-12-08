library(dplyr)
library(reshape2)
# Open File, if needed download and unzip it
file <- "UCI HAR Dataset.zip"
if (!file.exists(file)) {
        
        Url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(url = Url, destfile = "UCI HAR Dataset.zip",method = "curl")
        unzip("UCI HAR Dataset.zip")
}


# 1. Merges the training and the test sets to create one data set. /
# 4 Appropriately labels the data set with descriptive variable names.
activity_labels<-read.csv("./UCI HAR Dataset/activity_labels.txt",sep=" ",header=FALSE,col.names = c("ID","activity"))
features <- read.table("./UCI HAR Dataset/features.txt")

X_test<-read.table("./UCI HAR Dataset/test/X_test.txt",col.names = features[,2])
Y_test<-read.table("./UCI HAR Dataset/test/Y_test.txt",col.names = "activity")
subject_test<-read.csv("./UCI HAR Dataset/test/subject_test.txt",sep=" ",header=FALSE,col.names = "subject")
alltestset<-cbind(subject_test[1],Y_test[1],X_test)


X_train<-read.table("./UCI HAR Dataset/train/X_train.txt",col.names = features[,2])
Y_train<-read.table("./UCI HAR Dataset/train/Y_train.txt",col.names = "activity")
subject_train<-read.csv("./UCI HAR Dataset/train/subject_train.txt",sep=" ",header=FALSE,col.names = "subject")
alltrainset<-cbind(subject_train[1],Y_train[1],X_train)

#final merge of Test and Trainig sets
allset<-rbind(alltestset,alltrainset)



# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
colsmean<-grep("mean", names(allset))
colsstd<-grep("std", names(allset))
allset[c(colsmean,colsstd)]

# 3. Uses descriptive activity names to name the activities in the data set
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
activity_names<-activity_labels[match(allset$activity, activity_labels$V1),2]
allset_labels<-cbind(activity_names,allset)

# 4. Appropriately labels the data set with descriptive variable names.
# Step 4 was implemented along with step 1 above

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
allsetl <- melt(allset, id = c("subject", "activity"))
allsetw <- dcast(allsetl, subject + activity ~ variable, mean)
activity_names<-activity_labels[match(allsetw$activity, activity_labels$V1),2]

# Final Tidy set with mean per subject and activity
allset_tidy<-cbind(activity_names,allsetw)


