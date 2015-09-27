library(data.table)
library(reshape2)

# read activity labels file.
activity_labels_file <- read.table("activity_labels.txt")[,2]

# read Feautures labels file.
features_file <- read.table("features.txt")[,2]

#Extracts only the measurements on the mean and standard deviation for each measurement
extract_mean_std_features <- grepl("mean|std", features_file)

# Load and process X_test and y_test data files.
X_test_file <- read.table("test/X_test.txt")
y_test_file <- read.table("test/y_test.txt")
subject_test_file <- read.table("test/subject_test.txt")
names(X_test_file) = features

# Apply mean and standard features
X_test_file = X_test_file [,extract_mean_std_features]

# Load labels for Activities
y_test_file[,2] = activity_labels_file[y_test_file[,1]]
names(y_test_file) = c("Activity_ID", "Label")
names(subject_test_file) = "Subject"

# Bind  y_test_file and  x_test_file files data
XY_test_data <- cbind(as.data.table(subject_test_file), y_test_file, X_test_file)

# Load and process X_train & y_train data.
X_train_file <- read.table("train/X_train.txt")
y_train_file <- read.table("train/y_train.txt")
subject_train_file <- read.table("train/subject_train.txt")
names(X_train_file) = features

# Apply mean and standard features.
X_train_file = X_train_file[,extract_mean_std_features]

# Load activities related data
y_train_file[,2] = activity_labels_file[y_train_file[,1]]
names(y_train_file) = c("Activity_ID", "Label")
names(subject_train_file) = "Subject"
 
# Bind data y_train_file and X_train_file
XY_train_data <- cbind(as.data.table(subject_train_file), y_train_file, X_train_file)
# Merge test data and train data
merged_data = rbind(XY_test_data, XY_train_data)

#Uses descriptive activity labels to name the activities in the data set
id_labels   = c("Subject", "Activity_ID", "Label")
data_labels = setdiff(colnames(merged_data), id_labels)
melt_data      = melt(merged_data, id = id_labels, measure.vars = data_labels)

# Apply the mean function to the tidy dataset
tidy_dataset   = dcast(melt_data, Subject + Label ~ variable, mean)
write.table(tidy_dataset, file = "./tidy_dataset.txt")

write.table(paste("* ", names(tidy_dataset ), sep=""), file="Variables_Averages.md", quote=FALSE,
            row.names=FALSE, col.names=FALSE, sep="\t")
