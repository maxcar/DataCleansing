# DataCleansing - How To

1. load the feature entries from features.txt file
2. discover the indices of the entries according to the desired features (containing -mean() or -std())
3. load both the training and test data sets (retaining data columns determined by indices from step #4)
4. proceed with the merge the training and test data sets
5. replace label codes in the dataset with text labels discovered in step #2
6. proceed to reshape the data by using labels and subjects as identifiers
7. create a tidy data set named tidy_dataset.txt which includes the average of each variable for each activity/subject combination

#Assumptions
The R code in run_analysis.R proceeds under the assumption that the zip file available at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip is downloaded and extracted in the default R Working Directory.

#Required Libraries
library(data.table)
library(reshape2)
