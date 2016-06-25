CODEBOOK FOR COURSE 3 CLASS PROJECT USING ACCELEROMETER DATA

File Name:  SummaryTidyData.csv

This data frame contains 68 variables/columns and 180 observations/rows (181 including header)

Each row/observation uniquely identified by subject and activity, in two rows:

	"SubID" identifies the unique subject, range 1-30 (integer)
	"activity" identifies the 6 types of activities studied:
		walking (character; originally coded 1)
		walkingUpstairs (character; originally coded 2)
		walkingDownstairs (character; originally coded 3)
		sitting (character; originally coded 4)
		standing (character; originally coded 5)
		laying (character; originally coded 6)

As there were 30 subjects and 6 activities with no missing data, the resulting data set is 180 rows/observations.

The data frame contains 66 summary metrics. Each is numeric and ranges from -1 to 1, out to several decimal points. Each observation in this summary data set is the mean of all observations in the original 'test' and 'train' data sets for the combination of subject (n=30) and activity (n=6). All 66 summary metrics are prefixed with "mean." to denote this fact.

Following this prefix is a 't' or an 'f', which stand for time ('t') or frequency ('f'). Following this is 'Body' or 'Gravity', which denotes the acceleration signal collected from the accelerometer for body or gravity. Following this is 'Acc' or 'Gyro', which denote gyroscope or accelerometer signals. Following this may be 'Jerk' and/or 'Mag', which denote angular velocity (jerk) or the magnitude (mag) of 3-dimensional signals. The suffix is always begins with a period (.) then either 'mean' or 'std', which reflect orignal measurements of average (mean) or standard devision (std) for the preceding combination of measure description. Lastly, some metrics are separated by 3-dimensional axis (X, Y or Z). 

The full 68 column/variable list, in the order appearing in the file:
	1	subID
	2	activity
	3	mean.tBodyAcc.meanX
	4	mean.tBodyAcc.meanY
	5	mean.tBodyAcc.meanZ
	6	mean.tBodyAcc.stdX
	7	mean.tBodyAcc.stdY
	8	mean.tBodyAcc.stdZ
	9	mean.tGravityAcc.meanX
	10	mean.tGravityAcc.meanY
	11	mean.tGravityAcc.meanZ
	12	mean.tGravityAcc.stdX
	13	mean.tGravityAcc.stdY
	14	mean.tGravityAcc.stdZ
	15	mean.tBodyAccJerk.meanX
	16	mean.tBodyAccJerk.meanY
	17	mean.tBodyAccJerk.meanZ
	18	mean.tBodyAccJerk.stdX
	19	mean.tBodyAccJerk.stdY
	20	mean.tBodyAccJerk.stdZ
	21	mean.tBodyGyro.meanX
	22	mean.tBodyGyro.meanY
	23	mean.tBodyGyro.meanZ
	24	mean.tBodyGyro.stdX
	25	mean.tBodyGyro.stdY
	26	mean.tBodyGyro.stdZ
	27	mean.tBodyGyroJerk.meanX
	28	mean.tBodyGyroJerk.meanY
	29	mean.tBodyGyroJerk.meanZ
	30	mean.tBodyGyroJerk.stdX
	31	mean.tBodyGyroJerk.stdY
	32	mean.tBodyGyroJerk.stdZ
	33	mean.tBodyAccMag.mean
	34	mean.tBodyAccMag.std
	35	mean.tGravityAccMag.mean
	36	mean.tGravityAccMag.std
	37	mean.tBodyAccJerkMag.mean
	38	mean.tBodyAccJerkMag.std
	39	mean.tBodyGyroMag.mean
	40	mean.tBodyGyroMag.std
	41	mean.tBodyGyroJerkMag.mean
	42	mean.tBodyGyroJerkMag.std
	43	mean.fBodyAcc.meanX
	44	mean.fBodyAcc.meanY
	45	mean.fBodyAcc.meanZ
	46	mean.fBodyAcc.stdX
	47	mean.fBodyAcc.stdY
	48	mean.fBodyAcc.stdZ
	49	mean.fBodyAccJerk.meanX
	50	mean.fBodyAccJerk.meanY
	51	mean.fBodyAccJerk.meanZ
	52	mean.fBodyAccJerk.stdX
	53	mean.fBodyAccJerk.stdY
	54	mean.fBodyAccJerk.stdZ
	55	mean.fBodyGyro.meanX
	56	mean.fBodyGyro.meanY
	57	mean.fBodyGyro.meanZ
	58	mean.fBodyGyro.stdX
	59	mean.fBodyGyro.stdY
	60	mean.fBodyGyro.stdZ
	61	mean.fBodyAccMag.mean
	62	mean.fBodyAccMag.std
	63	mean.fBodyBodyAccJerkMag.mean
	64	mean.fBodyBodyAccJerkMag.std
	65	mean.fBodyBodyGyroMag.mean
	66	mean.fBodyBodyGyroMag.std
	67	mean.fBodyBodyGyroJerkMag.mean
	68	mean.fBodyBodyGyroJerkMag.std

For more information about the original 'train' and 'test' files, see 'README.txt', 'features_info.txt', and 'features.txt' files found in the zipped folder at: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
