fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "data.zip", method = "curl")
unzip("data.zip", exdir = getwd())

testActivity <- read.table("UCI\ HAR\ Dataset/test/y_test.txt")
testSubject <- read.table("UCI\ HAR\ Dataset/test/subject_test.txt")
testData <- read.table("UCI\ HAR\ Dataset/test/X_test.txt")
testData$activity <- unlist(testActivity) # to turn a list into a numeric vector
testData$subject <- unlist(testSubject)

trainActivity <- read.table("UCI\ HAR\ Dataset/train/y_train.txt")
trainSubject <- read.table("UCI\ HAR\ Dataset/train/subject_train.txt")
trainData <- read.table("UCI\ HAR\ Dataset/train/X_train.txt")
trainData$activity <- unlist(trainActivity)
trainData$subject <- unlist(trainSubject)

mergedData <- merge(testData, trainData, all = TRUE)

variables <- unlist(read.table("UCI\ HAR\ Dataset/features.txt")[2])
colnames(mergedData) <- variables
colsToExt <- c(grep("mean", colnames(mergedData))
               ,grep("std", colnames(mergedData))
               ,ncol(mergedData)-1, ncol(mergedData))
extData <- mergedData[colsToExt]
colnames(extData)[c(ncol(extData)-1,ncol(extData))] <-
        c("activity", "subject")

activities <- read.table("UCI\ HAR\ Dataset/activity_labels.txt")

for(ind in 1:nrow(activities)){
        extData$activity[extData$activity == activities[ind, 1]] <-
                as.character(activities[ind, 2])
}
# Step 4 is completed here. Kindly view the "extData" df for this stage 

sActData <- split(extData[1:(ncol(extData)-2)], extData$activity)
rMAct <- sapply(sActData, apply, 2, mean)

sSubData <- split(extData[1:(ncol(extData)-2)], extData$subject)
rMSub <- sapply(sSubData, apply, 2, mean)

resultDf <- t(data.frame(rMAct, rMSub, check.names = FALSE))

write.table(resultDf, "tidy_data.txt", row.names = FALSE)
write.table(rownames(resultDf), "rownames.txt")