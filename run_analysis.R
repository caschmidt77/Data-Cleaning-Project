#Getting and Cleaning Data course project

#Objectives:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set
#       with the average of each variable for each activity and each subject.

#Objective 1 - Merge training and test data sets

library(tidyverse)
library(data.table)

#create data directory if it does not exist
if(!file.exists("./data")){dir.create("./data")}

#download data (note for zip files the mode must be set to "wb" (write binary))
if (!file.exists("./data/UCI HAR Dataset")){
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileUrl, "./data/HAR 20 Dataset", mode = "wb") #mode = "wb" (write binary) req for zipfile
        unzip(zipfile = "./data/HAR 20 Dataset", exdir = "./data") #exdir argument specifies dest file path
}

#read all tables; work done on command to find appropriate colnames
features <- fread("./data/UCI HAR Dataset/features.txt", col.names = c("index", "measurement"))
activity_labels <- fread("./data/UCI HAR Dataset/activity_labels.txt")
subject_test <- fread("./data/UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
X_test <- fread("./data/UCI HAR Dataset/test/X_test.txt", col.names = features[, measurement])
y_test <- fread("./data/UCI HAR Dataset/test/y_test.txt", col.names = "activity", colClasses = "factor")
subject_train <- fread("./data/UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
X_train <- fread("./data/UCI HAR Dataset/train/X_train.txt", col.names = features[,measurement])
y_train <- fread("./data/UCI HAR Dataset/train/y_train.txt", col.names = "activity", colClasses = "factor")

#merging all data - rbind for cols measuring same variables within implied cbind on data.table function
data <- data.table(rbind(subject_test, subject_train), #colnames assigned above in fread to prevent
                   rbind(y_test, y_train), #colnames such as "activity.V1" data
                   rbind(X_test, X_train))

# Objective 2. Extracts only the measurements on the mean and standard deviation

#use grep function on names(data) to provide character vector of only desired colnames
desired_cols <- c("subject", "activity", names(data)[grep("mean|std", names(data))])
data <- data[, ..desired_cols] #note: `..` 'looks up one level', ie. to global environment, but
#results in needing to use an assignment arrow, as unlike for normal
#data.table operations, does not update by reference in this case

# Objective 3. Use descriptive activity names for the activities in the data set

#change factor labels in "activity" cols from numbers to meaningful names from activity_labels object
data[["activity"]] <- factor(data[["activity"]],
                             levels = activity_labels[["V1"]],
                             labels = activity_labels[["V2"]]) #note `[[]]` required in this case

# Objective 4. Appropriately label e data set with descriptive variable names

#colnames are reasonably descriptive, use gsub to improve presentation
names(data) <- gsub(pattern = "^t", replacement = "Time", names(data))
names(data) <- gsub("mean()", "Mean", names(data)) #doesn't remove metacharacter `()`
names(data) <- gsub("std\\()", "Std Dev", names(data)) #fixes above, but didn't amend previous code for future ref
names(data) <- gsub("\\()", "", names(data)) #double backslash required to escape metacharacter `()`

# 5. From the data set in step 4, create a second, independent tidy data set
# with the average of each variable for each activity and each subject.

avg_data <- data[, lapply(.SD, mean), by = .(subject, activity)]
write.table(avg_data, file = "./data/tidy_HAR_data.txt", row.names = FALSE)


#note to reviewers: please ignore the below, it just some extra playing around with the data
#I did to learn more about subtle difference with data.table and does not form part of the
#course project requirements

#mean of each quantitative variable grouped by activity
avg_by_act <- data[, lapply(.SD, mean), by = activity][, subject := NULL] #note here a mean of the 'subject'
#col is meaningless and so has been removed from the displayed result by chaining
#also note the order of chaining matters - if [, subject := NULL] is the first subset operation
#on DT because the DT will update by reference, the object DT itself will be updated to remove
#the subject column, causing problems for further calculations on DT that require subject

#when grouping by subject, the above approach (modifying order of chaining) didn't work as lapply(ing) mean
#to the activity col (which is a character object) throws an error.  But removing the activity col by placing
#[, activity := NULL] as the first in the chain will update DT by reference, causing problems for later
#analysis that needs the activity col (analogous to above).  The solution: first make a copy of DT into a new
#object (avg_by_subject), then remove the activity col from that object before lapply(ing) mean function.  Simple!
avg_by_subject <- copy(data)
avg_by_subject <- avg_by_subject[, activity := NULL][, lapply(.SD, mean), by = subject] #again note here
#as the lapply (..., mean) is the second [] in chain, avg_by_subject is not updated by
#reference and must be assigned to avg_by_subject to update that object

#sample display of outputs from above
avg_by_act[activity == "WALKING", c(1, 25:30)]
avg_by_subject[subject == 16, c(1, 70:80)]
avg_data[subject %in% c(1,2), 1:6]
