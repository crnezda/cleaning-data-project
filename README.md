The following files are contained in this git repository - cleaning-data-project:
run_analysis.R: An R program that reads in the Samsung training and testing data, cleans the column names,
                selects the standard deviation and mean feature variables and then computes the mean
                of those variables grouped by the activity and the subject id.

CodeBook.md: A description of all the transformations done to clean the data and the resulting summary table.

summarized.txt: The tidy data set with the means for each mean/std feature grouped by activity and subject id.

README.md: This file.

To run the script un zip the UCI HAR Dataset in the same directory as run_analysis.R. The program assumes that
the top level directory of the data set is at the same level as run_analysis.R. Open a R session and execute the
program. The tidy data will be written to a file: summarized.txt in the same directory.
