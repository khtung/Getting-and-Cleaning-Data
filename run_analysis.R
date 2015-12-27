library(dplyr)
# read in the train and test data set
trainDataSetFileName <- './UCI HAR Dataset/train/X_train.txt'
trainDataSet <- read.table(trainDataSetFileName, sep = '', header = FALSE)
testDataSet <- read.table('./UCI HAR Dataset/test/X_test.txt')

# Step 1. Merges the training and the test sets to create one data. Here it is named as wholeDataSet.
#wholeDataSet <- rbind(trainDataSet, testDataSet)
wholeDataSet <- bind_rows(trainDataSet, testDataSet)

# Naming wholeDataSet with the names in features.txt provided in the same data package
varNames <- read.table('./UCI HAR Dataset/features.txt') 
names(wholeDataSet) <- varNames[,2]
#head(wholeDataSet)

# Step 2. Use grep,regular expression, to extracts only the measurements 
# on the mean and standard deviation for each measurement. 
# Get the indices of the variable with mean or std
selectedVarIndex <- grep('mean|std',varNames[,2], value=F)
extracted <- wholeDataSet[, selectedVarIndex]

# The 3 statements below are to generate the features extracted and saved in a 
# file named as featuresModified.txt
selectedVarNames <- grep('mean|std',varNames[,2], value=T)
#as.table(t(selectedVarNames))
write.table(selectedVarNames,'featuresModified.txt', row.names= FALSE, col.names=F)


# Step 3. Uses descriptive activity names to name the activities in the data set
# wholeDataSet has been named in step 1.

# Step 4. Appropriately labels the data set with descriptive variable names. 
## Read in activity labels of train and test, then merge the lables
## Read in subjects of train and test, then merge the subjects
## Add variables activity and subject to the wholeDataSet
activityTrain <- read.table('./UCI HAR Dataset/train/y_train.txt')
subjectTrain  <- read.table('./UCI HAR Dataset/train/subject_train.txt')
activityTest  <- read.table('./UCI HAR Dataset/test/y_test.txt')
subjectTest   <- read.table('./UCI HAR Dataset/test/subject_test.txt')
activityNames <- read.table('./UCI HAR Dataset/activity_labels.txt')

activity <- bind_rows(activityTrain, activityTest)
subject <- bind_rows(subjectTrain, subjectTest)
names(activity) <- c('activity')
# transform the activity id to activity name
activity <- mutate(activity, activity = activityNames[activity,2])
names(subject) <- c('subject')

labeledDataSet <- bind_cols(activity, subject,extracted)


# Step 5. From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

tidyDataSet <- labeledDataSet %>%
  group_by(activity, subject) %>%
  summarise_each(funs(mean))

write.table(tidyDataSet, file ='./tidyDataSet.txt', row.names= FALSE)



