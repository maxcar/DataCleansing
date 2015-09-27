# DataCleansing - How To
load the feature entries from features.txt file
discover the indices of the entries according to the desired features (containing -mean() or -std())
load both the training and test data sets (retaining data columns determined by indices from step #4)
proceed with the merge the training and test data sets
replace label codes in the dataset with text labels discovered in step #2
proceed to reshape the data by using labels and subjects as identifiers
create a tidy data set named tidy_dataset.txt which includes the average of each variable for each activity/subject combination
