## assumes library(reshape2) is installed ##
     
## download & extract data
destfile= "./dataset.zip"
if(!file.exists(destfile))
  {
     download.file("http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile)
     unzip("dataset.zip") 
  }

setwd("./UCI HAR Dataset")

## read data sets
features <- read.table("./features.txt", col.names=c("FeatureId", "FeatureName"))
activities <- read.table("./activity_labels.txt", col.names=c("ActivityId", "ActivityName"))

subject_train = read.table ("./train/subject_train.txt")
subject_test = read.table ("./test/subject_test.txt")

y_train = read.table ("./train/y_train.txt")
X_train = read.table ("./train/X_train.txt")

y_test = read.table ("./test/y_test.txt")
X_test = read.table ("./test/X_test.txt")


## load train data set

names(y_train) = "ActivityId" 
names(X_train) = features$FeatureName
names(subject_train) = "SubjectId"
train = cbind(subject_train, y_train, X_train)


## load test data set
names(y_test) = "ActivityId"
names(X_test) = features$FeatureName 
names(subject_test) = "SubjectId"
test = cbind(subject_test, y_test, X_test)


#### merge train and test data ####
data = rbind(train, test)

      
#### Extract required measurements(mean and std)  ####
std_col_i = grep("std",names(data),ignore.case=TRUE)
std_col_n = names(data)[std_col_i]
mean_col_i = grep("mean",names(data),ignore.case=TRUE)
mean_col_n = names(data)[mean_col_i]
data_xtract =data[,c("SubjectId","ActivityId",mean_col_n,std_col_n)]

   
#### add activity names & create tidy data set ####
data = merge(activities, data, by.x='ActivityId', by.y='ActivityId', all=TRUE)
melted_data = melt(data, id=c("SubjectId","ActivityId","ActivityName"))
tidy_data = dcast(melted_data,SubjectId + ActivityId + ActivityName~variable,mean) 

#### write out tidy data set ####
write.table(tidy_data,"./tidy.txt", row.name=FALSE)
