#COURSE PROJECT FOR "GETTING AND CLEANING DATA"


#PRELIMININARY STEPS
# a. Download of the raw data
        #The download.file() function does not work on my computer for "https" URL, despite the use of "curl" method.
        #I use then a workaround from http://stackoverflow.com/questions/17300582/download-file-in-r-has-non-zero-exit-status
        #solution: "install the downloader package which wrap download.file

   #set the directory containing the unzipped data files as the working directory
   # for me: setwd("the path to your chosen directory")

   #install.packages("downloader") #if not already installed
        library(downloader)
        fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download(fileURL, destfile = "data_CourseProject.zip", mode="wb")

# b. Extraction of the zip files in the chosen working directory

# c. Reading of the data files
        #install.packages("data.table") #if not already installed
        library("data.table") #to take advantage of the data.table class over the data.frame class for large "X_*.txt" files
        #Thanks to this post (https://class.coursera.org/getdata-032/forum/thread?thread_id=158) 
        #in the course forum, I find a very good reference for data.table package here: https://s3.amazonaws.com/assets.datacamp.com/img/blog/data+table+cheat+sheet.pdf
        #install.packages("dplyr") #if not already installed, require (R>=3.1.2)
        library("dplyr")

   #read features' names from "features.txt"
        feat.names <- read.table("UCI HAR Dataset/features.txt", h=F)
        dim(feat.names) #check dimensions
        head(feat.names) #check containt: the first column gives the feature ID, the second gives the name
        
   #Train set:
        # get X values from the file "X_train.txt"
        measures_train <- data.table(read.table("UCI HAR Dataset/train/X_train.txt", h=F)) # workaround as measures_train <- fread("UCI HAR Dataset/train/X_train.txt") #presented the following error: Expected sep (' ') but new line, EOF (or other non printing character) ends field 655 on line 32 when detecting types
        setnames(measures_train,as.character(feat.names[,2])) #name the columns of the measures_train dataset according to the feature names
        dim(measures_train) #check the dimensions of measures_train dataset
        #head(measures_train) #check the result

        # get Train subject labels from the file "subject_train.txt"
        subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", h=F)
        subject_train <-as.factor(subject_train[,1]) #take labels as a factor vector
        table(subject_train) #Number of records by subject

        # get Train activity labels from the file "y_train.txt"
        y_train <- as.factor(read.table("UCI HAR Dataset/train/y_train.txt", h=F)[,1]) #take labels as a factor
        table(y_train) #Number of records by activity
        
   #Test set:
        # get X values from the file "X_test.txt"
        measures_test <- data.table(read.table("UCI HAR Dataset/test/X_test.txt", h=F)) # " fread("UCI HAR Dataset/test/X_test.txt")
        setnames(measures_test,as.character(feat.names[,2])) #name the columns of the measures_test dataset according to the feature names
        dim(measures_test) #check the dimensions of the measures dataset

        # get Test subject labels from the file "subject_test.txt"
        subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", h=F)
        subject_test <-as.factor(subject_test[,1]) #take labels as a factor
        table(subject_test) #Number of records by subject

        # get Test activity labels from the file "y_test.txt"
        y_test <- as.factor(read.table("UCI HAR Dataset/test/y_test.txt", h=F)[,1]) #take labels as a factor
        table(y_test) #Number of records by activity
        

# ASSIGNMENT STEPS
        
# 1. Merging the training and the test sets to create one data set
        # Only measures from X_train and X_test files at first as we will only keep columns containing "-mean()" or "-std()" in their names
        # labels columns will be added after this selection of columns
        dataset.tot <- rbind(measures_train,measures_test) # at this stage, dataset.tot contains all X_ measures
        dim(dataset.tot) #checking of the dimensions
        summary(dataset.tot) #reveals there is no missing data
        
# 2. Extract features based on mean() and sd() according to features names
        #only consider features containing -mean() or -std() as additional vectors gravityMean, tBodyAccMean, tBodyAccJerkMean, tBodyGyroMean, tBodyGyroJerkMean are means by window and not by measurement
        dataset.tot <- cbind(dplyr::select(dataset.tot, contains("-mean()")),dplyr::select(dataset.tot, contains("-std()"))) 
        # check all is right:
        dim(dataset.tot)
        class(dataset.tot)
        names(dataset.tot)

# 3. Replace number-based levels for the activity (y_* vectors) by the names from the "activity_labels.txt" file
        activity <- c(y_train,y_test)
        mode(activity) #check how R consider the labels, here as numeric
        activity <- as.factor(activity)
        is.factor(activity)
        levels(activity) #levels are currently named 1 to 6 
        table(activity) #count of records for each activity
        names.activity <- read.table("UCI HAR Dataset/activity_labels.txt")
        levels(activity) <- names.activity[,2]
        table(activity) #check the counts remain consistent after renaming
        
# 4. Rename the original X features to suppress the parentheses and the minus signs that may affect some manipulations
        names.X <- names(dataset.tot)
        names.X.elem <- strsplit(names.X,"-") #split the names in 2 or three parts, those separated by the "-" signs 
        type.feat <- lapply(names.X.elem, function(x) {x[2]}) #get the mean() and std() part of the names, the second one that was between the "-" signs
        type.feat <- lapply(type.feat, function(x) {stop <- nchar(x)-2; substr(x, 1,stop)}) #suppress the parentheses
        name.feat <- lapply(names.X.elem, function(x) {x[-2]}) #get the first, and the third if relevant, part(s) of the original names
        name.feat <- lapply(mapply(c, name.feat, type.feat, SIMPLIFY=FALSE), paste, collapse=".") #combine and paste together the new parts for names, separated by a ".", mean or std are now at the end of the name
        setnames(dataset.tot,unlist(name.feat)) #change the names in dataset.tot
        
# 4'. COMBINE ALL RELEVANT COMPONENTS (subject labels, mean/sd measures, activity labels) in a unique dataset, dataset.tot
        dataset.tot <- data.table(Subject=as.numeric(c(as.character(subject_train),as.character(subject_test))),dataset.tot, Activity=activity) #as.factor(c(as.character(subject_train),as.character(subject_test)))
        dim(dataset.tot)
        class(dataset.tot)
        names(dataset.tot)
        head(dataset.tot)

        
# COMPUTATIONs and writing of the txt file
# 5. Create the second dataset containing the average of each variable for each activity and each subject
        setkey(dataset.tot,Subject,Activity) #set keys to allow function over their levels
        dataset.Mean.SubAct <- dataset.tot[,lapply(.SD, function(.){mean(.)}), by=.(Subject, Activity), .SDcols=-c(1, ncol(dataset.tot))] 
        dim(dataset.Mean.SubAct)
        # We get the mean for each combination of Subject and Activity for each variable
        head(dataset.Mean.SubAct)
        
        #Save of this second dataset in a text file called "dataset.Mean.SubAct.txt" using the default separator sep = " "
        write.table(dataset.Mean.SubAct, "dataset.Mean.SubAct.txt", row.name=FALSE)  

