### Tidying the dataset

# Loading the packages
library(dplyr)
library(data.table)

## 1. Merges the training and the test sets to create one data set.

# Reading the file features.txt
features <- read.table("./Course3_assignment1/features.txt",quote = "")
featuresHeader <- features[,2]

# Reading the train data sets and naming the columns
subjectTrain <- read.table("./Course3_assignment1/train/subject_train.txt",quote = "")
colnames(subjectTrain) <- "subjectId"

YTrain <- read.table("./Course3_assignment1/train/y_train.txt",quote = "")
colnames(YTrain) <- "activity"

XTrain <- read.table("./Course3_assignment1/train/X_train.txt",quote = "")
colnames(XTrain) <- featuresHeader

# Reading test data sets
subjectTest <- read.table("./Course3_assignment1/test/subject_test.txt",quote = "")
colnames(subjectTest) <- "subjectId"

YTest <- read.table("./Course3_assignment1/test/y_test.txt",quote = "")
colnames(YTest) <- "activity"

XTest <- read.table("./Course3_assignment1/test/X_test.txt",quote = "")
colnames(XTest) <- featuresHeader

# Merging the above data sets
trainData <- cbind(subjectTrain, YTrain, XTrain)
testData <- cbind(subjectTest, YTest, XTest)
mergedData <- rbind(trainData, testData)

## 2. Extracts only the measurements on the mean and standard deviation
## for each measurement.
featuresHeaderMean <- grep("mean",featuresHeader, ignore.case = TRUE, value = TRUE)
featuresHeaderStd <- grep("std",featuresHeader, ignore.case = TRUE, value = TRUE)
onlyMeanStdData <- mergedData[,c("subjectId","activity",featuresHeaderMean,featuresHeaderStd)]

## 3. Uses descriptive activity names to name the activities in the data set
# Reading avtivity labels data set
activityLabel <- read.table("./Course3_assignment1/activity_labels.txt",quote = "")
colnames(activityLabel) <- c("activityCode","activityName")
totalData <- merge(activityLabel,onlyMeanStdData, by.x = "activityCode", by.y = "activity", all = TRUE)
requiredData <- totalData[,-1]

## 4. Appropriately labels the data set with descriptive variable names.
colnames(requiredData) <- gsub("-","",colnames(requiredData)) 
colnames(requiredData) <- sub("^t","time",colnames(requiredData))
colnames(requiredData) <- sub("^f","freq",colnames(requiredData))
colnames(requiredData) <- sub("\\(","",colnames(requiredData))
colnames(requiredData) <- sub("\\)","",colnames(requiredData))


## 5. creates a second, independent tidy data set with the average of each 
## variable for each activity and each subject.
finalData <- requiredData %>%
        group_by(subjectId, activityName) %>%
        summarize_each(funs(mean)) %>%
        arrange(desc(subjectId), activityName)

write.table(finalData,"./course3_assignment_tidydata.txt")