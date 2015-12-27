# CodeBook.md


Use source('run_analysis.R') you can get 
1. tidyDataSet.txt: the requested tidy data set by the course project.
2. featuresModified.txt: the extracted features for the data set provided by the course project.

tidyDataSet is derived from
==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit?degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

tidyDataSet contains the merged train and test data set and only mean and standard deviation measurements are extracted. Extra variables 'activity' and 'subject' are added to lable the activities of the subjects along with the measurements.


Recited descriptiong from the UCI data set as below: 
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

tidyDataSet:
For each record it is provided:
======================================

- Mean or standard deviation of triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration of an activity and a subject.
- Mean or standard deviation of triaxial Angular velocity from the gyroscope of an activity and a subject.
- A 79-feature vector with time and frequency domain variables. 
- Its activity label and subject.

The dataset includes the following files:
=========================================

- 'tidyDataSet.txt': the data set

- 'README.md'

- 'featuresModified.txt': List of all features extracted.


 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.



License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.


