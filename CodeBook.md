# CodeBook for the Getting and Cleaning Data Course Project

##  Description of the data
The original data were collected from the accelerometers from the Samsung Galaxy S smartphone.
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
The raw data for this project were stored in a directory called "UCI HAR Dataset" as two sub-directories called "train" and "test".
In each of these directories are the raw data from sensors in the "Inertial Signals" directory and some pre-processed data in a X_*.txt file, the corresponding participant number (from 1 to 30) in a subject_*.txt file and the label of the recorded activity in a y_*.txt file.

Only the last 3 files from the train and test directories were used in this project, not those from the "inertial signals" directories.
Further information about these data and how and in what circomstances they were collected are available here: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##  Description of variables

For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration, my tidy datasets use names containing "Acc" for data from the accelerometer.
- Triaxial Angular velocity from the gyroscope, my tidy datasets use names containing "Gyro" for data from the gyroscope. 
- A 561-feature vector with time and frequency domain variables (from the "X_train.txt" or "X_test.txt" files. Each feature was normalized and bounded within [-1,1]). 
- Its activity label (from the "y_train.txt" or "y_test.txt" files). The names of the activity used in place of their original number from 1 to 6 are those from the "activity_labels.txt" file
- An identifier (number from 1 to 30) of the subject who carried out the experiment (from the "subject_train.txt" or "subject_test.txt" files).


##  Description of transformations/manipulations made to get the final tidy datasets
