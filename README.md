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

### Details about the CodeBook.md file:
This md file describes the variables, the data, and the transformations performed on the raw data by the run_analysis.R script to produce both tidy datasets "dataset.tot" and "dataset.Mean.SubAct".

### Details about the dataset.Mean.SubAct.txt file:
This file may be open in Excel. To get a relevant spreadsheet, once open in Excel, follow the following steps:
* select all data by the ctrl+A combination (for windows users) or by mouse-selecting the first column,
* click the "DATA" tab then the "convert" button
* in the popo-up window select "delimited" and click next in first step, then check "space" separator and next in step 2, then click on the finish button.
If all went well, here you go to explore the dataset in Excel

You may prefer to read the data in R using:
dataset <- read.table("dataset.Mean.SubAct.txt", h=T, sep=" ")
head(dataset)

The first column gives the Subject number, the second one the type of activity, the following the overall mean and the mean standard deviation by subject and activity of the 33 features selected from raw data and stored in dataset.tot described in the CodeBook.md file
