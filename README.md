simply run the script in R to get two output files in your working directory named "tidy_data.txt" and "rownames.txt".
the first file have the columnnames but no row names and the second file has row names but no colon names.

This repo contains only one R script named "run_analysis.R" which acts on the datasets available at the url "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip". The CodeBook.md file contains a comprehensive review of what the script does and why. For the reviews' convenience same review is also given here.

---------------------------------------------------------------------------------------

1. The data is first downloaded and unzipped into the working directory through R.
2. Then the test data is read along with its "activity"" and "subject"" labels (see the codebooks of raw data) into a dataframe named testData. Then those two labels, namely "activity" and "subject" are added as two different colons into the test dataframe.
3. Then the train data is read along with its "activity"" and "subject"" labels (see the codebooks of raw data) into a dataframe named trainData. Then those two labels, namely "activity" and "subject" are added as two different colons into the train dataframe.
4. After that these two dataframes, test and train are merged with respect to same
variables (colons) to form a large dataframe named mergedData.
5. After that the variable names are extracted from the raw data codebook and is used
as meaningful variable names for the merged dataframe. "activity" and "subject colons" are named properly as well.
6. Then all "mean" and "standard deviation" variables are extracted from the merged data
to form a new dataframe named extData. This is done by partially matching the variable names of the merged data with keywords "mean" and "std" and extracting those.
7. After that the "activity_labels.txt" file is read into a dataframe and is used in
conjunction with a for loop to replace all the numeric activity labels with meaningful
literal ones.
8. Then with help of split and loop functions the processed data is split according to activity labels and mean of every variable is calculated in each activity group and is stored into a matrix named rMAct where the activities act as colons and all the mean and standard deviation variables act as rows. 
9. Exactly the same thing is done again on the processed data, except changing the grouping labels to subject labels this time. Again the means of all the variables are calculated and stored in a matrix named rMSub. Here subject labels act as colons.
10. At last the two metrics are merged and transposed into one single dataframe named resultDF. Now the first 6 rows represent 6 activity labels and the next 30 rows represent 30 subject labels. The colons represent the average of the mean and std variables among different groups.
11. The data is then written to a file named "tidy_data.txt" in the working directory.

for a list of rowname variables view "rownames.txt".