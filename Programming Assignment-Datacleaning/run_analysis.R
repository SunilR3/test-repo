
a <- read.table("train/X_train.txt")
b <- read.table("test/X_test.txt")
X <- rbind(a, b)

a <- read.table("train/subject_train.txt")
b <- read.table("test/subject_test.txt")
S <- rbind(a, b)

a <- read.table("train/y_train.txt")
b <- read.table("test/y_test.txt")
Y <- rbind(a, b)



features <- read.table("features.txt")
measures_features <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
X <- X[, measures_features]
names(X) <- features[measures_features, 2]
names(X) <- gsub("\\(|\\)", "", names(X))
names(X) <- tolower(names(X))


activities <- read.table("activity_labels.txt")
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
Y[,1] = activities[Y[,1], 2]
names(Y) <- "activity"


names(S) <- "subject"
clean_data <- cbind(S, Y, X)
write.table(clean_data, "merged_clean_data.txt")



uniqueSubjects = unique(S)[,1]
numSubjects = length(unique(S)[,1])
numActivities = length(activities[,1])
numCols = dim(clean_data)[2]
result = clean_data[1:(numSubjects*numActivities), ]

row = 1
for (s in 1:numSubjects) {
    for (a in 1:numActivities) {
        result[row, 1] = uniqueSubjects[s]
        result[row, 2] = activities[a, 2]
        tmp <- clean_data[clean_data$subject==s & clean_data$activity==activities[a, 2], ]
        result[row, 3:numCols] <- colMeans(tmp[, 3:numCols])
        row = row+1
    }
}
write.table(result, "cleandata_averages.txt")