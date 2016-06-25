COURSE 3 CLASS PROJECT USING ACCELEROMETER DATA
READ ME FILE DESCRIBING PROCESS IN SIMPLE STEP-BY-STEP LANGUAGE

Final File:  SummaryTidyData.csv
This data frame contains 68 variables/columns and 180 observations/rows (181 including header)

Codebook:  see Codebook.md for description of final file, variables definitions, etc.

STEPS TAKEN:

1. Downloaded and extracted zipped folder to local drive. Read documentation and perused all data files.

2. Read 6 text files, 3 per data set type ('train' and 'test'):
		a. A vector of subject identifiers (e.g., subject_train.txt)
		b. A vector of activity type (e.g., y_test.txt)
		c. A data frame of 561 metrics (e.g., X_train.txt)
   All 3 'train' files had 7351 observations. All 3 'test' files had 2946 observations.

3. Narrowed each data set (X_train, X_test) to only the variables/fields required for the project, i.e., those ending with 'mean' or 'std'. Those column numbers were identified via codebook and subsetted, which narrowed each data set to 66 variables (from their original 561).

4. The 66 columns/variables were assigned headers/column names using the naming methodology from the original study, but removing dashes and parentheses for better naming convention.

5. A new variable named 'group' was created for each file and populated with 'Train' or 'Test' so that rows could be distinguished once merged (if necessary). Also, a new variable/column was added to each file named 'rowID' with rows consecutively numbered, which would enable merging other files later on.

6. Before the 66 equivalent variables across 'train' and 'test' files could be merged, it was necessary to merge subject ID and activity from separate files. 

7. 'subject' and 'activity' (e.g., y_train.txt) files were imported, and headers assigned to the new vectors ('subId' and 'activity', respectively).

8. Each 'subject' and 'activity' vector was then made into a data frame by adding 'rowID' columns/variables with consecutively numbered rows (these allowed for merging).

9. Merged 'subID' and 'activity' data frames (for 'train' and 'test' separately) by 'rowID'.

10. Merged the subsetted data files (with 66 metrics plus 'group') with the respective 'train' and 'test' files created in step 9 by 'rowID'.

11. The separate 'test' and 'train' data files merged in step 10 (with 66 metrics, rowID, subID, group fields) were then merged via row bind, which just appended them. The resulting file ("finalMergedData") had 10,298 observations/rows.

12. rowID was helpful only for merging separate 'train' and 'test' files, but not after row-binding, so rowID was dropped from "finalMergedData".

13. Project instructions did not require 'group' (train vs. test data) differentiation, so was dropped in the next step. Instructions were to summarize 'finalMergedData' by taking the mean of each of the 66 metrics by subject AND activity. With 30 subjects and 6 activities, the resulting summary data file should have 180 observations/rows and 66 metrics (not including subID and activity designations). ddply by subID and activity was used to accomplish this, saving the resulting data frame as 'SummaryTidyData' and adding the 'mean.' prefix to the 66 metric names (header).

14. 'SummaryTidyData' still had numbers instead of descriptive names for 'activity', so the variable 'activity' was first changed to a character vector then gsub() was used to substitute descriptive names (e.g., walkingDownstairs) for numbers per original codebook provided by data set authors.

15. SummaryTidyData was written to CSV for upload to github, retaining column names. This file has the expected 180 observations, 66 metrics, and two more columns for subID and 'activity'.
