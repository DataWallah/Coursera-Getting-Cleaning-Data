

###########################################################################
#
# Step 1: read the 'features.txt' file to get the column names and grep the
# ones with 'mean' or 'std' labels.
#
# use the grep function to identify the columns of interest (only the mean and 
# sd for each measurement)
#
features <- read.table("features.txt", header=F, col.names=c("ID","Feature"))
mean_std_cols <- grep(".*mean\\(\\)|.*std\\(\\)", features$Feature)

###########################################################################
#
# Step 2: Read the data files in the test and train subdirectories, create subsets
# based on the columns grepped above, append colums for activities and subjects
# read the test data set (path can be hardcoded) and subset
#
testset<-read.table("test/X_test.txt", header=F, col.names=features$Feature)
testset<-testset[,mean_std_cols]
# read the test activities and subjects
ytest<-read.table("test/y_test.txt", header=F, col.names=c("ActivityID"))
subjtest<-read.table("test/subject_test.txt", header=F, col.names=c("SubjectID"))
# append the columns
testset$ActivityID<-ytest$ActivityID
testset$SubjectID<-subjtest$SubjectID
#
# Do the same for the training set
trainset<-read.table("train/X_train.txt", header=F, col.names=features$Feature)
trainset<-trainset[,mean_std_cols]
# read the test activities and subjects
ytrain<-read.table("train/y_train.txt", header=F, col.names=c("ActivityID"))
subjtrain<-read.table("train/subject_train.txt", header=F, col.names=c("SubjectID"))
# append the columns
trainset$ActivityID<-ytrain$ActivityID
trainset$SubjectID<-subjtrain$SubjectID
# Now combine the two subsets
merged_set<-rbind(testset,trainset)

###########################################################################
#
# Step 3: Apply the descriptive activity labels
#
# read the labels
activitytext<-read.table("activity_labels.txt",header=F,col.names=c("ActivityID","Activity"))
# make the activity describtion a factor
activitytext$Activity<-as.factor(activitytext$Activity)
# apply to the merged data (ActivityID is the common name between the frames)
labeled_merged_set<-merge(merged_set,activitytext)

###########################################################################
#
# Step 4: Create the tidy data set as required (contains the mean of each variable
# for every activity and every subject
#
# Use the melt function from the reshape2 library (assumes reshape2 is intalled,
# if not please install that first)
#
library(reshape2)
# We want data for each activity and each subject
ids<-c("SubjectID", "ActivityID", "Activity")
# which leaves mean and SD for a whole set of variables
# so best do do a diff and get the list
metrics<-setdiff(colnames(labeled_merged_set),ids)
temp_data<-melt(labeled_merged_set,measure.vars=metrics,id=ids)
# now organize by the means for each variable, per subject per activity
tidied_data<-dcast(temp_data, Activity+SubjectID~variable, mean)    

###########################################################################
#
# Step 5: Write out the dataset to the current directory
#
# this will overwrite any existing file with the same name
write.table(tidied_data,"tidied_data.txt")

#
print("Processing done. Tidied data is in 'tidied_data.txt' in the current directory")





