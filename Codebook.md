Codebook for Getting and Cleaning Data Course Project
This project involves accessing and wrangling a dataset into a ‘tidy’ format with meaningful names for both variables stored in columns as well as any observations on categorical variables. The subject dataset is comprised of data readings from the smartphones of 30 subjects across 6 different activity classes. The following explanation of the data under consideration is drawn from the README file available with the original dataset.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

Of the 563 columns in data, only those variables that represent either mean of standard deviation were desired for analysis. The resulting data set contains the subject id, activity being observed and the following 79 variables measured in the experiment.

 [1] "subject"                       "activity"                      "TimeBodyAcc-Mean-X"           
 [4] "TimeBodyAcc-Mean-Y"            "TimeBodyAcc-Mean-Z"            "TimeBodyAcc-Std Dev-X"        
 [7] "TimeBodyAcc-Std Dev-Y"         "TimeBodyAcc-Std Dev-Z"         "TimeGravityAcc-Mean-X"        
[10] "TimeGravityAcc-Mean-Y"         "TimeGravityAcc-Mean-Z"         "TimeGravityAcc-Std Dev-X"     
[13] "TimeGravityAcc-Std Dev-Y"      "TimeGravityAcc-Std Dev-Z"      "TimeBodyAccJerk-Mean-X"       
[16] "TimeBodyAccJerk-Mean-Y"        "TimeBodyAccJerk-Mean-Z"        "TimeBodyAccJerk-Std Dev-X"    
[19] "TimeBodyAccJerk-Std Dev-Y"     "TimeBodyAccJerk-Std Dev-Z"     "TimeBodyGyro-Mean-X"          
[22] "TimeBodyGyro-Mean-Y"           "TimeBodyGyro-Mean-Z"           "TimeBodyGyro-Std Dev-X"       
[25] "TimeBodyGyro-Std Dev-Y"        "TimeBodyGyro-Std Dev-Z"        "TimeBodyGyroJerk-Mean-X"      
[28] "TimeBodyGyroJerk-Mean-Y"       "TimeBodyGyroJerk-Mean-Z"       "TimeBodyGyroJerk-Std Dev-X"   
[31] "TimeBodyGyroJerk-Std Dev-Y"    "TimeBodyGyroJerk-Std Dev-Z"    "TimeBodyAccMag-Mean"          
[34] "TimeBodyAccMag-Std Dev"        "TimeGravityAccMag-Mean"        "TimeGravityAccMag-Std Dev"    
[37] "TimeBodyAccJerkMag-Mean"       "TimeBodyAccJerkMag-Std Dev"    "TimeBodyGyroMag-Mean"         
[40] "TimeBodyGyroMag-Std Dev"       "TimeBodyGyroJerkMag-Mean"      "TimeBodyGyroJerkMag-Std Dev"  
[43] "fBodyAcc-Mean-X"               "fBodyAcc-Mean-Y"               "fBodyAcc-Mean-Z"              
[46] "fBodyAcc-Std Dev-X"            "fBodyAcc-Std Dev-Y"            "fBodyAcc-Std Dev-Z"           
[49] "fBodyAcc-MeanFreq-X"           "fBodyAcc-MeanFreq-Y"           "fBodyAcc-MeanFreq-Z"          
[52] "fBodyAccJerk-Mean-X"           "fBodyAccJerk-Mean-Y"           "fBodyAccJerk-Mean-Z"          
[55] "fBodyAccJerk-Std Dev-X"        "fBodyAccJerk-Std Dev-Y"        "fBodyAccJerk-Std Dev-Z"       
[58] "fBodyAccJerk-MeanFreq-X"       "fBodyAccJerk-MeanFreq-Y"       "fBodyAccJerk-MeanFreq-Z"      
[61] "fBodyGyro-Mean-X"              "fBodyGyro-Mean-Y"              "fBodyGyro-Mean-Z"             
[64] "fBodyGyro-Std Dev-X"           "fBodyGyro-Std Dev-Y"           "fBodyGyro-Std Dev-Z"          
[67] "fBodyGyro-MeanFreq-X"          "fBodyGyro-MeanFreq-Y"          "fBodyGyro-MeanFreq-Z"         
[70] "fBodyAccMag-Mean"              "fBodyAccMag-Std Dev"           "fBodyAccMag-MeanFreq"         
[73] "fBodyBodyAccJerkMag-Mean"      "fBodyBodyAccJerkMag-Std Dev"   "fBodyBodyAccJerkMag-MeanFreq" 
[76] "fBodyBodyGyroMag-Mean"         "fBodyBodyGyroMag-Std Dev"      "fBodyBodyGyroMag-MeanFreq"    
[79] "fBodyBodyGyroJerkMag-Mean"     "fBodyBodyGyroJerkMag-Std Dev"  "fBodyBodyGyroJerkMag-MeanFreq"
