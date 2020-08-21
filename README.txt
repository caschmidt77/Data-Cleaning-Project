README - Getting and Cleaning Data Course Project

This project involves accessing and wrangling a dataset into a 'tidy' format with meaningful names for both variables stored in columns as well as any observations on categorical variables.  The subject dataset is comprised of data readings from the smartphones of 30 subjects across 6 different activity classes. The following explanation of the data under consideration is drawn from the README file available with the original dataset. 

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The entire process by which the data files are accessed, unzipped, read into R, wrangled and analysed is contained in the single R Script, run_analysis.R

As with any R Script, the process begins by loading any particular packages relied upon in the script.  The next step in the process is the downloading and unzipping of the data from the internet.

The next step of the process is to read the data into R.  In this case, this has been done using the fread function of the data.table package.  Suitable colnames have also been included at this step to avoid unwanted behaviours later in processing.

Having read the data into R and done some preliminary exploring, a single data.table is created by using rbind on each corresponding part of the test and train datasets, and the implied cbind of the resulting columns into the object 'data'.

Of the 563 columns in data, only those variables that represent either mean of standard deviation were desired for analysis.  Thus the grep function is used to isolate colnames containing either "mean" or "std", and are converted to a character vector.

The factor labels 1 to 6 for activities are then converted to their descriptive names as contained in the 'activity_labels' file.  The column names are also further refined.

Having reduced the data to that required and wrangled it into a desirable form for analysis, the final step of the process - extracting the desired measurements - can occur.  Here, we are asked to provide the mean of all the observations involving mean or std by subject and activity.  This is very easily done with data.table, and the result stored in a new data.table 'avg_data', which is then written s a file using the write.table function.

Please note:  I have also done some analysis by subject (alone) and activity(alone) additional to the requirements of the course project.  This was done for my own learning to solve some consequential problems encountered along the way with the way data.table updates by reference (or under certain conditions, does not). This particularly involves removing columns not suitable for evaluation, eg. columns of character elements.
Finally, as with the entire process, testing is conducted to establish the script behaves as desired and outputs meaningful results.  Just three examples are given here.  Of course using data.tables powerful .SD, togther with standard base R statistical functions, an endless variety of measurements could be derived from DT now it is in a format that is tidy.
