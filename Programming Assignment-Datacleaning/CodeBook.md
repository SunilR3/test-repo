Course Project Code Book
Source of the original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Original description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The attached R script (run_analysis.R) performs the following to clean up the data:

1.It merges the training and test sets to create one data set, namely train/X_train.txt with test/X_test.txt.

2.It reads features.txt and extracts only the measurements of the mean and standard deviation for each measurement. 

3.It reads activity_labels.txt and applies descriptive activity names to name of the activities in the data set as below:

walking

walkingupstairs

walkingdownstairs

sitting

standing

laying
4.It also labels the data set with descriptive names.The feature names (attributes) and activity names are converted to lower case and also underscores and brackets () are removed. Then it merges the data frames containing activity labels and subject IDs. The result is saved as merged_clean_data.txt The names of the attributes are as below:

tbodyacc-mean-x 

tbodyacc-mean-y 

tbodyacc-mean-z 

tbodyacc-std-x 

tbodyacc-std-y 

tbodyacc-std-z 

tgravityacc-mean-x 

tgravityacc-mean-y
5.The script creates a second tidy data set with the average of each measurement for each activity and each subject. The result is saved as cleandata_averages.txt.