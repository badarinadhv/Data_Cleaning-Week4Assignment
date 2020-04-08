Down Loaded Zip file using the download.file().  Unzip did not work for me, so had to do the unzip out side "R" code
Using read.table() Read the TXT files - Training data set and test data set. There are 561 column measurements 
Merged both the data sets 
Selected columns  with names correscponding to the mean and std deviation as per the code book for all the measurements
Created a variable nakes list by text editing the features.txt variable name using gsub() function
Cretaed the names for the data set and created a tidy data set with column names as descriptive names
Using sapply(), created a new data set by averaging columnwise for each measurementm View() displays the results 
Using  write.csv() written the final tidy data set
