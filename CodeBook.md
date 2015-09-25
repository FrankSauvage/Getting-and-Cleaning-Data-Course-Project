## CodeBook for the Getting and Cleaning Data Course Project

This file contains
*Description of the data
*Description of the variables
*Description of transformations/manipulations made to get the final tidy datasets

###  Description of the data
The original data were collected from the accelerometers from the Samsung Galaxy S smartphone.
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
The raw data for this project were stored in a directory called "UCI HAR Dataset" as two sub-directories called "train" and "test".
In each of these directories are the raw data from sensors in the "Inertial Signals" directory and some pre-processed data in a X_*.txt file, the corresponding participant number (from 1 to 30) in a subject_*.txt file and the label of the recorded activity in a y_*.txt file.

Only the last 3 files from the train and test directories were used in this project, not those from the "inertial signals" directories.
Further information about these data and how and in what circomstances they were collected are available here: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Each row of the X_ raw data files correspond to features derived from a 128 readings window of 2.56 secondes from each sensor. 

###  Description of variables

For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration, my tidy datasets use names containing "Acc" for data from the accelerometer.
- Triaxial Angular velocity from the gyroscope, my tidy datasets use names containing "Gyro" for data from the gyroscope. 
- A 561-feature vector with time and frequency domain variables (from the "X_train.txt" or "X_test.txt" files. Each feature was normalized and bounded within [-1,1]). 
- Its activity label (from the "y_train.txt" or "y_test.txt" files). The names of the activity used in place of their original number from 1 to 6 are those from the "activity_labels.txt" file
- An identifier (number from 1 to 30) of the subject who carried out the experiment (from the "subject_train.txt" or "subject_test.txt" files).

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
From these signals are succesively derived the following features: the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

Additional vectors (gravityMean, tBodyAccMean, tBodyAccJerkMean, tBodyGyroMean, tBodyGyroJerkMean) obtained by averaging the signals in a signal window sample are not considered here as already some syntheses, and then of different nature, as the previous ones. In addition, they would be partly redondant with the second data set we will compute.

The tidy dataset called dataset.tot of 10299 rows and 68 columns contains the following column variables:

"Subject"
	1	.first participant
	2	.second participant
	...
	30	.thirthiest and last participant



Following 33 quantitative variables contains the mean of the signals over a window of 128 readings from one subject during a given activity. The windows are 50% overlapping. 
The name of the feature gives the signal and the direction (if relevant) considered and how they derived from each other according to the previous paragraphs.
	"tBodyAcc.X.mean"
	"tBodyAcc.Y.mean"
	"tBodyAcc.Z.mean"
	"tGravityAcc.X.mean"
	"tGravityAcc.Y.mean"
	"tGravityAcc.Z.mean"
	"tBodyAccJerk.X.mean"
	"tBodyAccJerk.Y.mean"
	"tBodyAccJerk.Z.mean"
	"tBodyGyro.X.mean"
	"tBodyGyro.Y.mean"
	"tBodyGyro.Z.mean"
	"tBodyGyroJerk.X.mean"
	"tBodyGyroJerk.Y.mean"
	"tBodyGyroJerk.Z.mean"
	"tBodyAccMag.mean"
	"tGravityAccMag.mean"
	"tBodyAccJerkMag.mean"
	"tBodyGyroMag.mean"
	"tBodyGyroJerkMag.mean"
	"fBodyAcc.X.mean"
	"fBodyAcc.Y.mean"
	"fBodyAcc.Z.mean"
	"fBodyAccJerk.X.mean"
	"fBodyAccJerk.Y.mean"
	"fBodyAccJerk.Z.mean"
	"fBodyGyro.X.mean"
	"fBodyGyro.Y.mean"
	"fBodyGyro.Z.mean"
	"fBodyAccMag.mean"
	"fBodyBodyAccJerkMag.mean"
	"fBodyBodyGyroMag.mean"
	"fBodyBodyGyroJerkMag.mean"

Following 33 quantitative variables use the same raw data than the previous ones but are focused on the standard deviation of the signals in each window instead of their mean. 
	"tBodyAcc.X.std"
	"tBodyAcc.Y.std"
	"tBodyAcc.Z.std"
	"tGravityAcc.X.std"
	"tGravityAcc.Y.std"
	"tGravityAcc.Z.std"
	"tBodyAccJerk.X.std"
	"tBodyAccJerk.Y.std"
	"tBodyAccJerk.Z.std"
	"tBodyGyro.X.std"
	"tBodyGyro.Y.std"
	"tBodyGyro.Z.std"
	"tBodyGyroJerk.X.std"
	"tBodyGyroJerk.Y.std"
	"tBodyGyroJerk.Z.std"
	"tBodyAccMag.std"
	"tGravityAccMag.std"
	"tBodyAccJerkMag.std"
	"tBodyGyroMag.std"
	"tBodyGyroJerkMag.std"
	"fBodyAcc.X.std"
	"fBodyAcc.Y.std"
	"fBodyAcc.Z.std"
	"fBodyAccJerk.X.std"
	"fBodyAccJerk.Y.std"
	"fBodyAccJerk.Z.std"
	"fBodyGyro.X.std"
	"fBodyGyro.Y.std"
	"fBodyGyro.Z.std"
	"fBodyAccMag.std"
	"fBodyBodyAccJerkMag.std"
	"fBodyBodyGyroMag.std"
	"fBodyBodyGyroJerkMag.std"

"Activity"

 	WALKING			Walking flat area
	WALKING_UPSTAIRS
 	climbing stairs	
	WALKING_DOWNSTAIRS	descending stairs
	SITTING
			Sitting
	STANDING
		Standing up
	LAYING			Laying

###  Description of transformations/manipulations made to get the final tidy datasets
The description will be made for each step of the assignment, remembered by the corresponding number from 1 to 5.

1. Merging the training and the test sets to create one data set
Only measures from X_train and X_test files are merged at first as we will only keep the subset of columns containing "-mean()" or "-std()" in their names. Columns of subject and activity labels will be added after the selection of the relevant columns of measures.

2. Extract features based on mean() and sd() according to features names from the features.txt file
only consider features containing -mean() or -std() as additional vectors gravityMean, tBodyAccMean, tBodyAccJerkMean, tBodyGyroMean, tBodyGyroJerkMean are already more sophisticated features based on the signals by direction.

3. Replace number-based levels for the activity (y_* vectors) by the names from the "activity_labels.txt" file
Both y_train and y_test are merged to fit the corresponding records of the previous merge of X_train and X_test. The levels 1 to 6 are recoded using the levels() function and the labels from the "activity_labels.txt" file: 1 becomes WALKING and so on.

4. Rename the original X features to suppress the parentheses and the minus signs that may affect some manipulations
This renaming is done following the steps below, based on a split of the names from "features.txt" according to the "-" sign and several manipulations through lapply() to build the final names:
        *split the names in 2 or three parts, those separated by the "-" signs 
        *get the mean() and std() part of the names, which are the second ones originally between the "-" signs
        *suppress the parentheses using nchar() and substring()
        *get the first, and the third if relevant, part(s) of the original names
        *combine and paste together the new parts for names, separated by a ".", mean or std are now at the end of the name

4'. Additional step to combine all relevant components (subject labels, mean/sd measures, activity labels) in a unique dataset called dataset.tot

5. Create the second dataset containing the average of each variable for each activity and each subject
Using the data.table specific way to apply functions to columns, the mean function is applied to the entire dataset.tot table, except to the factor columns Subject and Activity.
The lapply function allows to compute the mean according to the levels of Subject and Activity factors simultaneously.
The result is the second tidy dataset of 180 rows (30 subjects time 6 activities) by 68 columns, where the two first columns contain the combinations of the levels of Subject and Activity and the 66 following contains the corresponding means of the means and means of the standard deviations from the dataset.tot quantitative variables.

5'. Additional step to write the second dataset in a text file for upload as PartI of the Course Project