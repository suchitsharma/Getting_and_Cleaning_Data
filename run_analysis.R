# This is R code for producing a tidy data set from Samsung Galaxy S smartphone
# downloaded from : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
# 
# The code uses snippets from discussions by David Hood ( Community TA) in 
# David's personal course project FAQ (https://class.coursera.org/getdata-013/forum/thread?thread_id=30)
# & Tidy data and the Assignment (https://class.coursera.org/getdata-013/forum/thread?thread_id=31)

# Load needed packages
library(plyr)

# Download data from website and extract zip file.
Url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(Url,destfile="Dataset.zip")
unzip(zipfile="Dataset.zip")
path <- file.path("." , "UCI HAR Dataset")

# Read needed files from extracted folder
ActivityTest  <- read.table(file.path(path, "test" , "Y_test.txt" ),header = FALSE)
ActivityTrain <- read.table(file.path(path, "train", "Y_train.txt"),header = FALSE)
SubjectTrain <- read.table(file.path(path, "train", "subject_train.txt"),header = FALSE)
SubjectTest  <- read.table(file.path(path, "test" , "subject_test.txt"),header = FALSE)
FeaturesTest  <- read.table(file.path(path, "test" , "X_test.txt" ),header = FALSE)
FeaturesTrain <- read.table(file.path(path, "train", "X_train.txt"),header = FALSE)

# Merge training and test sets
Subject <- rbind(SubjectTrain, SubjectTest)
Activity<- rbind(ActivityTrain, ActivityTest)
Features<- rbind(FeaturesTrain, FeaturesTest)

# Assign descriptive names to columns
names(Subject)<-c("subject")
names(Activity)<- c("activity")
FeaturesNames <- read.table(file.path(path, "features.txt"),head=FALSE)
names(Features)<- FeaturesNames$V2

# Assign desciptive activity names to data set activities.
activityLabels <- read.table(file.path(path, "activity_labels.txt"),header = FALSE)
Activity[, 1] <- activityLabels[Activity[, 1], 2]

# Combine into one data set
Combine <- cbind(Subject, Activity)
Dataset <- cbind(Features, Combine)

# Extract only measurements on mean and standard deviation
MnSDFeaturesNames<-FeaturesNames$V2[grep("mean\\(\\)|std\\(\\)", FeaturesNames$V2)]
Names<-c(as.character(MnSDFeaturesNames), "subject", "activity" )
Dataset<-subset(Dataset,select=Names)

# Appropriates label the data set with decriptive variable names
names(Dataset)<-gsub("^t", "time", names(Dataset))
names(Dataset)<-gsub("^f", "frequency", names(Dataset))
names(Dataset)<-gsub("Acc", "Accelerometer", names(Dataset))
names(Dataset)<-gsub("Gyro", "Gyroscope", names(Dataset))
names(Dataset)<-gsub("Mag", "Magnitude", names(Dataset))
names(Dataset)<-gsub("BodyBody", "Body", names(Dataset))

# From above Dataset, produce tidy data with average of each variable 
# for each activity and subject
TidyData<-aggregate(. ~subject + activity, Dataset, mean)
TidyData<-TidyData[order(TidyData$subject,TidyData$activity),]

# Export tidy data into txt file 'TidyDataSet.txt' using write.table() using
# row.name=FALSE - requirement for errorless submission
write.table(TidyData, file = "TidyDataSet.txt",row.name=FALSE)