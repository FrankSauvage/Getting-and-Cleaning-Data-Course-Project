# Getting-and-Cleaning-Data-Course-Project
##Repo for the Course Project of the John Hopkins' Course 3 of the Data Science specialization

This repo contains 4 items
* this README.md file descibing the repo's content.
* a R script file called run_analysis.R. 
* a Markdown file, which is a codebook called CodeBook.md. It explains the data used and created by the run_analysis.R script.
* a space separated txt file called dataset.Mean.SubAct.txt corresponding to the tidy data uploaded as part I of this project and created by the run_analysis.R script.

### Details about the run_analysis.R script file:
This file use the data from accelerometers from the Samsung Galaxy S smartphone find at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
When run in a R session that uses as working directory the directory containing the unzipped Dataset, it reads the relevant txt files in R and build two datasets:
* dataset.tot: a tidy data set, stored as a R data.table, containing the measurements on the mean and standard deviation for each measurement extracted from the Samsung data files.
* dataset.Mean.SubAct: a second, independent tidy data set with the average of each variable for each activity and each subject.

The script splits in two sets of tasks:
* Preliminary steps: each step is labelled by a letter from a to c 
a. download the data from the Internet using the downloader package and the download() function (the download.file() function was unable to manage the https URLs on my laptop, despite the use of CURL).
b. unzip the data in the working directory (not executed in R but told as a comment for the tracking of required steps)
c. reading in R of all the required files, included those used latter as feature names and activity names.
some checks are made to ensure all is right at each step.
* Assignment steps: numbered from 1 to 5 accordingly to the assignment description at https://class.coursera.org/getdata-032/human_grading/view/courses/975116/assessments/3/submissions
1. Merging the training and the test sets to create one data set
2. Extract features based on mean() and sd() according to features names from the features.txt file
3. Replace number-based levels for the activity (y_* vectors) by the names from the "activity_labels.txt" file
4. Rename the original X features to suppress the parentheses and the minus signs that may affect some manipulations
4'. Additional step to combine all relevant components (subject labels, mean/sd measures, activity labels) in a unique dataset called dataset.tot
5. Create the second dataset containing the average of each variable for each activity and each subject
5'. Additional step to write the second dataset in a text file for upload as PartI of the Course Project

### Details about the CodeBook.md file:
This md file describes the variables, the data, and the transformations performed on the raw data by the run_analysis.R script to produce both tidy datasets "dataset.tot" and "dataset.Mean.SubAct".

### Details about the dataset.Mean.SubAct.txt file:
This file may be open in Excel. To get a relevant spreadsheet, once open in Excel, follow the following steps:
* select all data by the ctrl+A combination (for windows users) or by mouse-selecting the first column,
* click the "DATA" tab then the "convert" button
* in the pop-up window select "delimited" and click next in first step, then check "space" separator and next in step 2, then click on the finish button.
If all went well, here you go to explore the dataset in Excel

You may prefer to read the data in R using:
dataset <- read.table("dataset.Mean.SubAct.txt", h=T, sep=" ")
head(dataset)

The first column gives the Subject number, the second one the type of activity, the following the overall mean and the mean standard deviation by subject and activity of the 33 features selected from raw data and stored in dataset.tot described in the CodeBook.md file
