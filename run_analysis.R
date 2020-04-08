##Downloading the zipfile 
if(!file.exists(".data")){dir.create("./data")}
fileurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl,destfile="Assignment_4Data.zip")
##Reading training Data set (70% of the 30 people in the experiment)
##unzip commands did not work properly, so I took files after window nzip
DT_train<-read.table("X_train.txt")
## Reading the test Data set ( 30% of the 30 people in the experiment)
DT_test<-read.table("X_test.txt")
## Merging Test and training Data sets (Assignment-Point#1) 
train_test_merge<-rbind(DT_train, DT_test)
## Creating a new subset of only Average and Std deviation data of the measurements (Assignment-Point#2)
library(dplyr)
DT_Train_test_subset<-select(train_test_merge,V1:V6,V41:V46,V81:V86,V121:V126,V161:V166,V201:V202,
                            V214:V215,V227:V228,V240:V241,V253:V254,V266:V271,V294:V296,V345:V350,
                            V373:V375,V424:V429,V452:V454,V503:V504,V513,V516:V517,V529:V530,V539,V542:V543,V555:V561)
## Activity mapped 1 WALKING 2 WALKING_UPSTAIRS 3 WALKING_DOWNSTAIRS 4 SITTING 5 STANDING 6 LAYING
## Read the features.txt for the code names
FeaturesNames<-read.table("features.txt")
SelectedColumns<-FeaturesNames[c(1:6,41:46,81:86,121:126,161:166,201:202,
                                    214:215,227:228,240:241,253:254,266:271,294:296,345:350,
                                    373:375,424:429,452:454,503:504,513,516:517,529:530,539,542:543,555:561),]
library(readr)
SelectedColumnsNames<-gsub("[(-)-]*", "", SelectedColumns$V2) 
SelectedColumnsNames<-gsub("angle","angle_",SelectedColumnsNames$V2)
## NAming the Data set with the named variables (Point # 3 in the assignment)
i<-1
for (i in c(1:84)) {
  
  names(DT_Train_test_subset)[i]<-SelectedColumnsNames[i]
} 
## Averages on each measurement ( Point-4 Assignment) and display of the table of Averages
Average<-sapply(DT_Train_test_subset, mean )    
View(Average)
write.csv(DT_Train_test_subset,"Tidy_data_train_test.csv")