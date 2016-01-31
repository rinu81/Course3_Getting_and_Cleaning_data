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
Code description
==================================================================
1. Loads the required packages (# data.table and # dplyr).
2. Loads the (train and test) datasets to R, using # read.table.
3. Reads the features.txt data set.
4. Merges the train and test data through # cbind and # rbind to # merged_data.
5. Finds the keywords mean and std from the column names of the merged data to extract the measurements on mean and standard deviation for each measurement. And subsets the required columns to # onlyMeanStdData.
6. The activities are numbered (1 -6). Gives the descriptive names for each activity. To do so, reads activity_label.txt and merges it to the data from 6.
7. Column names look better without the special characters and are preferred to include numbers and characters. So removes the '-', '(', ')' etc. Also to make the column names more unstandable, replaces time for t and freq for f.
8. Finds the mean each measurement variable grouped by the volunteer and the activity.
9. Also sorts the data through subjectid and activity.
10. Writes the tidy data obtained through the above steps into a text file.


