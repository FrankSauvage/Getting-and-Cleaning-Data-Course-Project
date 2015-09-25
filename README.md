# Getting-and-Cleaning-Data-Course-Project
Repo for the Course Project of the John Hopkins' Course 3 of the Data Science specialization

This repo contains 4 items
* this readme file descibing the repo's content.
* a R script file called run_analysis.R. 
* a Markdown file, which is a codebook called CodeBook.md. It explains the data used and created by the run_analysis.R script.
* a space separated txt file called dataset.Mean.SubAct.txt corresponding to the tidy data uploaded as part I of this project and created by the run_analysis.R script.

## Details about the run_analysis.R script file:
This file use the data from accelerometers from the Samsung Galaxy S smartphone find at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
When run in a R session that uses as working directory the directory containing the unzipped Dataset, it reads the relevant txt files in R and build two datasets:
* dataset.tot: a tidy data set, stored as a R data.table, containing the measurements on the mean and standard deviation for each measurement extracted from the Samsung data files.
* dataset.Mean.SubAct: a second, independent tidy data set with the average of each variable for each activity and each subject.