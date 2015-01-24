# Read in the test and train set from the Samsung data
x_test = read.table(file = "UCI HAR Dataset/test/X_test.txt")
x_train = read.table(file = "UCI HAR Dataset/train/X_train.txt")
library(dplyr)
# merge the train and test sets
x_total = rbind(x_test, x_train)

# make the feature labels the column names
x_features = read.table(file = "UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
feature_labels = x_features[,'V2']
colnames(x_total) = feature_labels

# extract out only the mean and std deviation columns
x_std_mean = x_total[, grepl("-mean\\(\\)|-std\\(\\)", colnames(x_total))]

# add the activities as a column in the data set
y_test = read.table(file = "UCI HAR Dataset/test/Y_test.txt",
                    col.names = c("Activity"))
y_train = read.table(file = "UCI HAR Dataset/train/Y_train.txt",
                     col.names = c("Activity"))
y_total = rbind(y_test, y_train)
measurements = cbind(y_total, x_std_mean)

# turn the activities into factors
measurements$Activity = 
  factor(measurements$Activity, 
         labels = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))

# add the subjects as a column in the data set
subject_test = 
  read.table(file = "UCI HAR Dataset/test/subject_test.txt", 
             col.names = c("SubjectID"))
subject_train = 
  read.table(file = "UCI HAR Dataset/train/subject_train.txt",
             col.names = c("SubjectID"))
subject_total = rbind(subject_test, subject_train)
measurements = cbind(subject_total, measurements)
measurements$SubjectID = factor(measurements$SubjectID)

# clean the variable names to remove special characters
names(measurements) = gsub("-", "_", names(measurements))
names(measurements) = gsub("[()]", "", names(measurements))

# compute the average of each variable for each activity and each subject
grouped_measurements = group_by(measurements, Activity, SubjectID)
summed = summarise_each(grouped_measurements, funs(mean))
write.table(summed, file = "summarized.txt", row.name = FALSE)