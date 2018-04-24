---
title: "Run Analysis"
author: "Saurabh Pai"
date: "April 24, 2018"
output: html_document
---

# Getting And Cleaning Data Project

## Merges the training and the test sets to create one data set.
* Uses cbind to create the individual test and train data sets
* Uses rbind to consolidate into one singe data set

## Extracts only the measurements on the mean and standard deviation for each measurement. 
* Based on the Features info file, selects only the colums containing the mean and std. dev and uses cbind to create the required tidy data set.

## Uses descriptive activity names to name the activities in the data set
*Using the Activity labels and a for loop, replaces the activity values with appropriate labels.

## Appropriately labels the data set with descriptive variable names.
* Using the features info file, creates a list on variable names, with the first two columns being 'Activity' and 'Subject'

## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
* Using a for loop, creates a subset of the tidy data for each activity.
* For each such subset, creates individual subsets for each subject using another for loop.
* For each such subset, extracts the column averages for each measurement and appends this row of data to the second tidy data set using rbind.