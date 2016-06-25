## BEGIN WORK ON COURSE 3 FINAL PROJECT due June 26, 2016

##1. Merge the training and the test sets to create one data set.
##2. Extracts only the measurements on the mean and standard deviation for each measurement.
##3. Uses descriptive activity names to name the activities in the data set
##4. Appropriately labels the data set with descriptive variable names.
##5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## I first downloaded and extracted zipped folder to "Programming Assignment_Accelerometer" folder on C-drive
setwd("C:/Users/MDO8571/Documents/R/Programming Assignment_Accelerometer/WorkFiles")

## Use readr package to read fixed-width text file
library(readr)
trainFile <- read_table("C:/Users/MDO8571/Documents/R/Programming Assignment_Accelerometer/UCI HAR Dataset/train/X_train.txt")
str(trainFile)
## Classes 'tbl_df', 'tbl' and 'data.frame':       7351 obs. of  561 variables
## all are "num"

testFile <- read_table("C:/Users/MDO8571/Documents/R/Programming Assignment_Accelerometer/UCI HAR Dataset/test/X_test.txt")
str(testFile)
## Classes 'tbl_df', 'tbl' and 'data.frame':       2946 obs. of  561 variables
## all are "num"

library(data.table)
## Subset just the 66 Mean and StdDev columns identified in "features.txt" variable list
subsetTrain <- trainFile[, c(1:6,41:46,81:86,121:126,161:166,201:202,214:215,227:228,240:241,253:254,266:271,345:350,424:429,503:504,516:517,529:530,542:543)]
str(subsetTrain)
## Classes 'tbl_df', 'tbl' and 'data.frame':       7351 obs. of  66 variables

subsetTest <- testFile[, c(1:6,41:46,81:86,121:126,161:166,201:202,214:215,227:228,240:241,253:254,266:271,345:350,424:429,503:504,516:517,529:530,542:543)]
str(subsetTest)
## Classes 'tbl_df', 'tbl' and 'data.frame':       2946 obs. of  66 variables

## adding colnames from "features.txt" corresponding to 66 columns subsetted
colnames(subsetTrain) <- c(
  "tBodyAcc.meanX",
  "tBodyAcc.meanY",
  "tBodyAcc.meanZ",
  "tBodyAcc.stdX",
  "tBodyAcc.stdY",
  "tBodyAcc.stdZ",
  "tGravityAcc.meanX",
  "tGravityAcc.meanY",
  "tGravityAcc.meanZ",
  "tGravityAcc.stdX",
  "tGravityAcc.stdY",
  "tGravityAcc.stdZ",
  "tBodyAccJerk.meanX",
  "tBodyAccJerk.meanY",
  "tBodyAccJerk.meanZ",
  "tBodyAccJerk.stdX",
  "tBodyAccJerk.stdY",
  "tBodyAccJerk.stdZ",
  "tBodyGyro.meanX",
  "tBodyGyro.meanY",
  "tBodyGyro.meanZ",
  "tBodyGyro.stdX",
  "tBodyGyro.stdY",
  "tBodyGyro.stdZ",
  "tBodyGyroJerk.meanX",
  "tBodyGyroJerk.meanY",
  "tBodyGyroJerk.meanZ",
  "tBodyGyroJerk.stdX",
  "tBodyGyroJerk.stdY",
  "tBodyGyroJerk.stdZ",
  "tBodyAccMag.mean",
  "tBodyAccMag.std",
  "tGravityAccMag.mean",
  "tGravityAccMag.std",
  "tBodyAccJerkMag.mean",
  "tBodyAccJerkMag.std",
  "tBodyGyroMag.mean",
  "tBodyGyroMag.std",
  "tBodyGyroJerkMag.mean",
  "tBodyGyroJerkMag.std",
  "fBodyAcc.meanX",
  "fBodyAcc.meanY",
  "fBodyAcc.meanZ",
  "fBodyAcc.stdX",
  "fBodyAcc.stdY",
  "fBodyAcc.stdZ",
  "fBodyAccJerk.meanX",
  "fBodyAccJerk.meanY",
  "fBodyAccJerk.meanZ",
  "fBodyAccJerk.stdX",
  "fBodyAccJerk.stdY",
  "fBodyAccJerk.stdZ",
  "fBodyGyro.meanX",
  "fBodyGyro.meanY",
  "fBodyGyro.meanZ",
  "fBodyGyro.stdX",
  "fBodyGyro.stdY",
  "fBodyGyro.stdZ",
  "fBodyAccMag.mean",
  "fBodyAccMag.std",
  "fBodyBodyAccJerkMag.mean",
  "fBodyBodyAccJerkMag.std",
  "fBodyBodyGyroMag.mean",
  "fBodyBodyGyroMag.std",
  "fBodyBodyGyroJerkMag.mean",
  "fBodyBodyGyroJerkMag.std"
)
head(subsetTrain,2)
## Source: local data frame [2 x 66]
##  tBodyAcc.meanX tBodyAcc.meanY tBodyAcc.meanZ tBodyAcc.stdX tBodyAcc.stdY tBodyAcc.stdZ
##           (dbl)          (dbl)          (dbl)         (dbl)         (dbl)         (dbl)
## 1      0.2784188    -0.01641057     -0.1235202    -0.9982453    -0.9753002     -0.960322
## 2      0.2796531    -0.01946716     -0.1134617    -0.9953796    -0.9671870     -0.978944
## Variables not shown: tGravityAcc.meanX (dbl), tGravityAcc.meanY (dbl), tGravityAcc.meanZ...[truncated output]

## Do same for subsetTest data frame
colnames(subsetTest) <- c(
  "tBodyAcc.meanX",
  "tBodyAcc.meanY",
  "tBodyAcc.meanZ",
  "tBodyAcc.stdX",
  "tBodyAcc.stdY",
  "tBodyAcc.stdZ",
  "tGravityAcc.meanX",
  "tGravityAcc.meanY",
  "tGravityAcc.meanZ",
  "tGravityAcc.stdX",
  "tGravityAcc.stdY",
  "tGravityAcc.stdZ",
  "tBodyAccJerk.meanX",
  "tBodyAccJerk.meanY",
  "tBodyAccJerk.meanZ",
  "tBodyAccJerk.stdX",
  "tBodyAccJerk.stdY",
  "tBodyAccJerk.stdZ",
  "tBodyGyro.meanX",
  "tBodyGyro.meanY",
  "tBodyGyro.meanZ",
  "tBodyGyro.stdX",
  "tBodyGyro.stdY",
  "tBodyGyro.stdZ",
  "tBodyGyroJerk.meanX",
  "tBodyGyroJerk.meanY",
  "tBodyGyroJerk.meanZ",
  "tBodyGyroJerk.stdX",
  "tBodyGyroJerk.stdY",
  "tBodyGyroJerk.stdZ",
  "tBodyAccMag.mean",
  "tBodyAccMag.std",
  "tGravityAccMag.mean",
  "tGravityAccMag.std",
  "tBodyAccJerkMag.mean",
  "tBodyAccJerkMag.std",
  "tBodyGyroMag.mean",
  "tBodyGyroMag.std",
  "tBodyGyroJerkMag.mean",
  "tBodyGyroJerkMag.std",
  "fBodyAcc.meanX",
  "fBodyAcc.meanY",
  "fBodyAcc.meanZ",
  "fBodyAcc.stdX",
  "fBodyAcc.stdY",
  "fBodyAcc.stdZ",
  "fBodyAccJerk.meanX",
  "fBodyAccJerk.meanY",
  "fBodyAccJerk.meanZ",
  "fBodyAccJerk.stdX",
  "fBodyAccJerk.stdY",
  "fBodyAccJerk.stdZ",
  "fBodyGyro.meanX",
  "fBodyGyro.meanY",
  "fBodyGyro.meanZ",
  "fBodyGyro.stdX",
  "fBodyGyro.stdY",
  "fBodyGyro.stdZ",
  "fBodyAccMag.mean",
  "fBodyAccMag.std",
  "fBodyBodyAccJerkMag.mean",
  "fBodyBodyAccJerkMag.std",
  "fBodyBodyGyroMag.mean",
  "fBodyBodyGyroMag.std",
  "fBodyBodyGyroJerkMag.mean",
  "fBodyBodyGyroJerkMag.std"
)
head(subsetTest,2)

## Adding new Var to each set called 'group' so rows in the combined data set can be
## differentiated if needed
subsetTrain <- mutate(subsetTrain, group = "Train")
subsetTest <- mutate(subsetTest, group = "Test")

## Creating row ID for easier merging later
subsetTrain$rowId  <- 1:nrow(subsetTrain)
subsetTest$rowId  <- 1:nrow(subsetTest)

## Before merging the two equivalent subsetted data files together, needed first is to add
## variables file (train, test), subject ID (from respective subject_.txt files), and 
## activityType (from respective Y_.txt files, populated with numbers 1-6, which correspond
## to activity types described in documentation).
trainSubID <- read_table("C:/Users/MDO8571/Documents/R/Programming Assignment_Accelerometer/UCI HAR Dataset/train/subject_train.txt")
str(trainSubID)
## Classes 'tbl_df', 'tbl' and 'data.frame':       7351 obs. of  1 variable:
## $ 1: int  1 1 1 1 1 1 1 1 1 1 ...

testSubID <- read_table("C:/Users/MDO8571/Documents/R/Programming Assignment_Accelerometer/UCI HAR Dataset/test/subject_test.txt")
str(testSubID)
## Classes 'tbl_df', 'tbl' and 'data.frame':       2946 obs. of  1 variable:
## $ 2: int  2 2 2 2 2 2 2 2 2 2 ...

colnames(trainSubID) <- "subID"
colnames(testSubID) <- "subID"
head(testSubID,2)
##   subID
## 1     2
## 2     2
trainSubID$rowId  <- 1:nrow(trainSubID)
testSubID$rowId  <- 1:nrow(testSubID)

trainActivity <- read_table("C:/Users/MDO8571/Documents/R/Programming Assignment_Accelerometer/UCI HAR Dataset/train/Y_train.txt")
str(trainActivity)
## Classes 'tbl_df', 'tbl' and 'data.frame':       7351 obs. of  1 variable:
## $ 5: int  5 5 5 5 5 5 5 5 5 5 ...

testActivity <- read_table("C:/Users/MDO8571/Documents/R/Programming Assignment_Accelerometer/UCI HAR Dataset/test/Y_test.txt")
str(testActivity)

colnames(trainActivity) <- "activity"
colnames(testActivity) <- "activity"
head(testActivity,2)
##   activity
## 1     5
## 2     5

trainActivity$rowId  <- 1:nrow(trainActivity)
testActivity$rowId  <- 1:nrow(testActivity)

## creating final merged data set will take a few merge steps
merged1train <- join(trainSubID, trainActivity, "rowId")
merged1test <- join(testSubID, testActivity, "rowId")
str(merged1train)
##'data.frame':   7351 obs. of  3 variables:
## $ subID   : int  1 1 1 1 1 1 1 1 1 1 ...
## $ rowId   : int  1 2 3 4 5 6 7 8 9 10 ...
## $ activity: int  5 5 5 5 5 5 5 5 5 5 ...

mergedTrainFinal <- join(merged1train, subsetTrain, "rowId")
mergedTestFinal <- join(merged1test, subsetTest, "rowId")
str(mergedTrainFinal)
str(mergedTestFinal)

## Final merge of test and train data sets
finalMergedData <- rbind(mergedTrainFinal, mergedTestFinal, use.names=TRUE)
str(finalMergedData)
##'data.frame':   10298 obs. of  70 variables:
## $ subID                    : int  1 1 1 1 1 1 1 1 1 1 ...
## $ rowId                    : int  1 2 3 4 5 6 7 8 9 10 ...
## $ activity                 : int  5 5 5 5 5 5 5 5 5 5 ...
## $ tBodyAcc.meanX           : num  0.278 0.28 0.279 0.277 0.277 ...
## $ tBodyAcc.meanY           : num  -0.0164 -0.0195 -0.0262 -0.0166 -0.0101 ...
##...[truncated output]
## $ fBodyBodyGyroJerkMag.std : num  -0.996 -0.995 -0.995 -0.995 -0.995 ...
## $ group                    : chr  "Train" "Train" "Train" "Train" ...

## The Var "rowId" was of value when merging separate train and test data sets
## but is moot in the merged data set (and might even cause problems if retained)
finalMergedData <- select(finalMergedData, -rowId)


## Step 5. From the data set in step 4, create a second, independent tidy data 
## set with the average of each variable for each activity and each subject.
## New data set should have only the number of rows as SubIDs * activity combo
## and take the mean of each of the 66 mean and std measures, i.e., 68 cols.
## Since aggregation is by the mean function, will label each of the 66 new
## summary measures with prefix "mean.", so some will be means of means and
## others will be means of std deviations (noted in suffix).

SummaryTidyData <- ddply(finalMergedData, .(subID, activity),
                         summarize,
                         mean.tBodyAcc.meanX = mean(tBodyAcc.meanX),
                         mean.tBodyAcc.meanY = mean(tBodyAcc.meanY),
                         mean.tBodyAcc.meanZ = mean(tBodyAcc.meanZ),
                         mean.tBodyAcc.stdX = mean(tBodyAcc.stdX),
                         mean.tBodyAcc.stdY = mean(tBodyAcc.stdY),
                         mean.tBodyAcc.stdZ = mean(tBodyAcc.stdZ),
                         mean.tGravityAcc.meanX = mean(tGravityAcc.meanX),
                         mean.tGravityAcc.meanY = mean(tGravityAcc.meanY),
                         mean.tGravityAcc.meanZ = mean(tGravityAcc.meanZ),
                         mean.tGravityAcc.stdX = mean(tGravityAcc.stdX),
                         mean.tGravityAcc.stdY = mean(tGravityAcc.stdY),
                         mean.tGravityAcc.stdZ = mean(tGravityAcc.stdZ),
                         mean.tBodyAccJerk.meanX = mean(tBodyAccJerk.meanX),
                         mean.tBodyAccJerk.meanY = mean(tBodyAccJerk.meanY),
                         mean.tBodyAccJerk.meanZ = mean(tBodyAccJerk.meanZ),
                         mean.tBodyAccJerk.stdX = mean(tBodyAccJerk.stdX),
                         mean.tBodyAccJerk.stdY = mean(tBodyAccJerk.stdY),
                         mean.tBodyAccJerk.stdZ = mean(tBodyAccJerk.stdZ),
                         mean.tBodyGyro.meanX = mean(tBodyGyro.meanX),
                         mean.tBodyGyro.meanY = mean(tBodyGyro.meanY),
                         mean.tBodyGyro.meanZ = mean(tBodyGyro.meanZ),
                         mean.tBodyGyro.stdX = mean(tBodyGyro.stdX),
                         mean.tBodyGyro.stdY = mean(tBodyGyro.stdY),
                         mean.tBodyGyro.stdZ = mean(tBodyGyro.stdZ),
                         mean.tBodyGyroJerk.meanX = mean(tBodyGyroJerk.meanX),
                         mean.tBodyGyroJerk.meanY = mean(tBodyGyroJerk.meanY),
                         mean.tBodyGyroJerk.meanZ = mean(tBodyGyroJerk.meanZ),
                         mean.tBodyGyroJerk.stdX = mean(tBodyGyroJerk.stdX),
                         mean.tBodyGyroJerk.stdY = mean(tBodyGyroJerk.stdY),
                         mean.tBodyGyroJerk.stdZ = mean(tBodyGyroJerk.stdZ),
                         mean.tBodyAccMag.mean = mean(tBodyAccMag.mean),
                         mean.tBodyAccMag.std = mean(tBodyAccMag.std),
                         mean.tGravityAccMag.mean = mean(tGravityAccMag.mean),
                         mean.tGravityAccMag.std = mean(tGravityAccMag.std),
                         mean.tBodyAccJerkMag.mean = mean(tBodyAccJerkMag.mean),
                         mean.tBodyAccJerkMag.std = mean(tBodyAccJerkMag.std),
                         mean.tBodyGyroMag.mean = mean(tBodyGyroMag.mean),
                         mean.tBodyGyroMag.std = mean(tBodyGyroMag.std),
                         mean.tBodyGyroJerkMag.mean = mean(tBodyGyroJerkMag.mean),
                         mean.tBodyGyroJerkMag.std = mean(tBodyGyroJerkMag.std),
                         mean.fBodyAcc.meanX = mean(fBodyAcc.meanX),
                         mean.fBodyAcc.meanY = mean(fBodyAcc.meanY),
                         mean.fBodyAcc.meanZ = mean(fBodyAcc.meanZ),
                         mean.fBodyAcc.stdX = mean(fBodyAcc.stdX),
                         mean.fBodyAcc.stdY = mean(fBodyAcc.stdY),
                         mean.fBodyAcc.stdZ = mean(fBodyAcc.stdZ),
                         mean.fBodyAccJerk.meanX = mean(fBodyAccJerk.meanX),
                         mean.fBodyAccJerk.meanY = mean(fBodyAccJerk.meanY),
                         mean.fBodyAccJerk.meanZ = mean(fBodyAccJerk.meanZ),
                         mean.fBodyAccJerk.stdX = mean(fBodyAccJerk.stdX),
                         mean.fBodyAccJerk.stdY = mean(fBodyAccJerk.stdY),
                         mean.fBodyAccJerk.stdZ = mean(fBodyAccJerk.stdZ),
                         mean.fBodyGyro.meanX = mean(fBodyGyro.meanX),
                         mean.fBodyGyro.meanY = mean(fBodyGyro.meanY),
                         mean.fBodyGyro.meanZ = mean(fBodyGyro.meanZ),
                         mean.fBodyGyro.stdX = mean(fBodyGyro.stdX),
                         mean.fBodyGyro.stdY = mean(fBodyGyro.stdY),
                         mean.fBodyGyro.stdZ = mean(fBodyGyro.stdZ),
                         mean.fBodyAccMag.mean = mean(fBodyAccMag.mean),
                         mean.fBodyAccMag.std = mean(fBodyAccMag.std),
                         mean.fBodyBodyAccJerkMag.mean = mean(fBodyBodyAccJerkMag.mean),
                         mean.fBodyBodyAccJerkMag.std = mean(fBodyBodyAccJerkMag.std),
                         mean.fBodyBodyGyroMag.mean = mean(fBodyBodyGyroMag.mean),
                         mean.fBodyBodyGyroMag.std = mean(fBodyBodyGyroMag.std),
                         mean.fBodyBodyGyroJerkMag.mean = mean(fBodyBodyGyroJerkMag.mean),
                         mean.fBodyBodyGyroJerkMag.std = mean(fBodyBodyGyroJerkMag.std)
)

## Use str() to validate Summary Tidy Data set per instructions:

str(SummaryTidyData)
##'data.frame':   180 obs. of  68 variables:
## $ subID                         : int  1 1 1 1 1 1 2 2 2 2 ...
## $ activity                      : int  1 2 3 4 5 6 1 2 3 4 ...
## $ mean.tBodyAcc.meanX           : num  0.285 0.255 0.289 0.261 0.279 ...
##...
## truncated output


## 3. Use descriptive activity names to name the activities in the data set

SummaryTidyData$activity <- as.character(SummaryTidyData$activity)
class(SummaryTidyData$activity)
##[1] "character"

SummaryTidyData$activity <- gsub("1", "walking", SummaryTidyData$activity)
SummaryTidyData$activity <- gsub("2", "walkingUpstairs", SummaryTidyData$activity)
SummaryTidyData$activity <- gsub("3", "walkingDownstairs", SummaryTidyData$activity)
SummaryTidyData$activity <- gsub("4", "sitting", SummaryTidyData$activity)
SummaryTidyData$activity <- gsub("5", "standing", SummaryTidyData$activity)
SummaryTidyData$activity <- gsub("6", "laying", SummaryTidyData$activity)
str(SummaryTidyData)
##'data.frame':   180 obs. of  68 variables:
## $ subID                         : int  1 1 1 1 1 1 2 2 2 2 ...
## $ activity                      : chr  "walking" "walkingUpstairs" "walkingDownstairs" "sitting" ...
## $ mean.tBodyAcc.meanX           : num  0.285 0.255 0.289 0.261 0.279 ...
## $ mean.tBodyAcc.meanY           : num  -0.00679 -0.02395 -0.00992 -0.00131 -0.01606 ...
##...
## truncated output

## Write final tidy data set to CSV file (though 'activity' will still show as numeric)
write.table(SummaryTidyData, file = "SummaryTidyData.csv", quote = TRUE, sep = ",",
            na = "NA", row.names = FALSE, col.names = TRUE)