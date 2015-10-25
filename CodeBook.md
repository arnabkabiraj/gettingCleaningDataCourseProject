This is the CodeBook for the peer-reviewed project in the course "Getting and Cleaning Data"


The given dataset is used as raw data here, and the CodeBooks included in the zip archive
will act as a basis for this CodeBook.


1. The data is first downloaded and unzipped into the working directory through R.
2. Then the test data is read along with its "activity"" and "subject"" labels (see the codebooks of raw data) into a dataframe named testData. Then those two labels, namely "activity" and "subject" are added as two different columns into the test dataframe.
3. Then the train data is read along with its "activity"" and "subject"" labels (see the codebooks of raw data) into a dataframe named trainData. Then those two labels, namely "activity" and "subject" are added as two different columns into the train dataframe.
4. After that these two dataframes, test and train are merged with respect to same
variables (columns) to form a large dataframe named mergedData.
5. After that the variable names are extracted from the raw data codebook and is used
as meaningful variable names for the merged dataframe. "activity" and "subject columns" are named properly as well.
6. Then all "mean" and "standard deviation" variables are extracted from the merged data
to form a new dataframe named extData. This is done by partially matching the variable names of the merged data with keywords "mean" and "std" and extracting those.
7. After that the "activity_labels.txt" file is read into a dataframe and is used in
conjunction with a for loop to replace all the numeric activity labels with meaningful
literal ones.
8. Then with help of split and loop functions the processed data is split according to activity labels and mean of every variable is calculated in each activity group and is stored into a matrix named rMAct where the activities act as colons and all the mean and standard deviation variables act as rows. 
9. Exactly the same thing is done again on the processed data, except changing the grouping labels to subject labels this time. Again the means of all the variables are calculated and stored in a matrix named rMSub. Here subject labels act as columns.
10. At last the two metrics are merged into one single dataframe named resultDF. Now the first 6 rows represent 6 activity labels and the next 30 rows represent 30 subject labels. The columns represent the average of the mean and std variables among different groups.
11. The data is then written to a file named "tidy_data.txt" in the working directory.

for a list of rowname variables view "rownames.txt".