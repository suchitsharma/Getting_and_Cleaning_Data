## Codebook for Tidy Data Project
This is the codebook for Coursera's Getting and Cleaning Data Project

## Data Source
Raw Data is readings from Samsung Galaxy S Smartphone accelerometers. Sourced from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Variables

 - *Url* - Holds the location of source data
 - *path* - Holds the path of unzipped files.
 - *Subject* - Merged training and test sets for subject_train.txt and subject_test.txt
 - *Activity* - Merged training and test sets for Y_train.txt and Y_test.txt
 - *Features* - Merged training and test sets for X_train.txt and X_test.txt
 - *FeaturesName* - Names of features from features.txt
 - *ActivityLables* - Lables from activity_lables.txt
 - *Dataset* - Combined data set of all readings
 - *MnSDFeaturesNames* - Feature names of measurement on mean and standard deviation.
 - *TidyData* - Average of each variable for each subject & activity in Dataset filtered for MnSDFeaturesNames.

## Transformations

 1. Plyr package is loaded, it's need to aggregate data.
 2. Zip file is downloaded from source and unzipped.
 3. Needed data is read from extracted files - Y_test, Y_Train, subject_train, subject_test, X_train, X_test.
 4. Training and Test data is merged.
 5. Descriptive Names are assigned to columns
 6. Descriptive activity names are read from activity_lables.txt and added to dataset.
 7. Dataset is filtered for measurements on mean and standard deviation
 8. Lables are replaced by decriptive names
 9. Dataset is aggregated for average of each variable for each activity and subject.
 10. Final result set is exported to TidyDataSet.txt file.