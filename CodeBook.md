The variables of the tidy data set include: SubjectID, Activity, and the means of all the mean and std deviation variables collected from the UCI HAR
Dataset. SubjectID is the id assigned to each of the people from who measurements were taken, Activity is one of: walking, laying, standing,
waliking_upstairs, walking_downstairs, and sitting.

The data used to generate the tidy data set comes from UCI HAR Dataset. The resulting tidy data set is the result of computing the 
mean of each of the activity measurements after they have been grouped by activity and subject id.

All transformations done to clean up and summarize the data:
# merge the train and test sets
# make the feature labels the column names
# extract out only the mean and std deviation columns
# add the activities as a column in the data set
# turn the activities into factors
# add the subjects as a column in the data set
# clean the variable names to remove special characters
# compute the average of each variable for each activity and each subject 
# write out a summarized table of the mean of the variables called summarized.txt

