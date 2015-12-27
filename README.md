# Getting and Cleaning Data Course Project README.md

Use source('run_analysis.R') you can get 
1. tidyDataSet.txt: the requested tidy data set by the course project.
2. featuresModified.txt: the extracted features for the data set provided by the course project.


This script uses package dplyr table processing to make things easier to be done.


library(dplyr)

## read in the train and test data set
Use read.table() to read in the train and test data set. 
The UCI HAR Datase should be placed in the working directory with the path tree arranged as in the zip file provided by this course.

scripts as below:
trainDataSetFileName <- './UCI HAR Dataset/train/X_train.txt'
trainDataSet <- read.table(trainDataSetFileName, sep = '', header = FALSE)
testDataSet <- read.table('./UCI HAR Dataset/test/X_test.txt')

## Step 1. Merges the training and the test sets to create one data. 
Here it is named as wholeDataSet.
scripts as below: use bind_rows() to merge train and test data set as one data set.
wholeDataSet <- bind_rows(trainDataSet, testDataSet)

Naming wholeDataSet with the names in features.txt provided in the same data package.
scripts as below: 
varNames <- read.table('./UCI HAR Dataset/features.txt') 
names(wholeDataSet) <- varNames[,2]


## Step 2. Use grep,regular expression, to extracts only the measurements on the mean and standard deviation for each measurement. 
Get the indices of the variable with mean or std
Extract the variables by grep,regular expressing, with mean or (or logic is used in grep to meet the course request) std by the indices just got.
scripts as below:
selectedVarIndex <- grep('mean|std',varNames[,2], value=F)
extracted <- wholeDataSet[, selectedVarIndex]

The 3 statements below are to generate the features extracted and saved in a 
file named as featuresModified.txt
selectedVarNames <- grep('mean|std',varNames[,2], value=T)
write.table(selectedVarNames,'featuresModified.txt', row.names= FALSE, col.names=F)


## Step 3. Uses descriptive activity names to name the activities in the data set
wholeDataSet has been named in the previous statement executed.

## Step 4. Appropriately labels the data set with descriptive variable names. 
Read in activity labels of train and test, then merge the lables
Read in subjects of train and test, then merge the subjects
Add variables activity and subject to the wholeDataSet
scripts as below:
activityTrain <- read.table('./UCI HAR Dataset/train/y_train.txt')
subjectTrain  <- read.table('./UCI HAR Dataset/train/subject_train.txt')
activityTest  <- read.table('./UCI HAR Dataset/test/y_test.txt')
subjectTest   <- read.table('./UCI HAR Dataset/test/subject_test.txt')
activityNames <- read.table('./UCI HAR Dataset/activity_labels.txt')

merge activity train and test to a data set
merge subject train and test to a data set
scripts as below:
activity <- bind_rows(activityTrain, activityTest)
subject <- bind_rows(subjectTrain, subjectTest)

name the activity variable to 'activity'
script as below:
names(activity) <- c('activity')

transform the activity id to activity name
script as below:
activity <- mutate(activity, activity = activityNames[activity,2])

name the subject varaible to 'subject'
script as below:
names(subject) <- c('subject')

combine the variables activity and subject to the extracted data set
script as below:
labeledDataSet <- bind_cols(activity, subject,extracted)


# Step 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Use group_by() to group the labeled data set on activity, subject. dplyr chaining function %>% is used.
Use summarise_each() to summarise each variable mean in labeledDataSet, except activity and subject, since activity and subject variables are used as group variables.
tidyDataSet <- labeledDataSet %>%
  group_by(activity, subject) %>%
  summarise_each(funs(mean))

# Output the labeledDataSet to a file named as didyDataSet.
write.table(tidyDataSet, file ='./tidyDataSet.txt', row.names= FALSE)
