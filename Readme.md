Tidy data derived from theHuman Activity Recognition Using Smartphones Dataset

==================================================================

Original Dataset Information
==================================================================
For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

==================================================================
Transformation steps
==================================================================
1. Merge the training and the test sets to create one data set
2. Extract the measurements on the mean and standard deviation for each measurement
3. Use descriptive activity names to name the activities in the data set
4. Label the data set with descriptive variable names
From the data set in step 4, create a second, independent tidy data set with the average 5. of each variable for each activity and each subject


==================================================================
Transformed Information
==================================================================
-subjectid : a code given to the person/volunteer on whom the experiment was carried out
-activityname: each volunteer carried out 6 activities (walking,walking_upstairs,
walking_downstairs,sitting,standing,laying)
-the rest of the data is average of (mean() and std()) variables measured in the experiment

