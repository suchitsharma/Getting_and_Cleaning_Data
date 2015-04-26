# **Getting and Cleaning Data Project**
This repository contains deliverable for Coursera's Getting and Cleaning Data Project.

# Project Requirements
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

You should create one R script called run_analysis.R that does the following. 
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Repository Contents
This repository contains 3 files as part of project deliverable.

 - *run_analysis.R* - R script which executes steps needed to download base data set, run required analysis and export results in a txt file.
 - *CodeBook.md* - Describes the variables, the data, and any transformations / work performed to clean up the data 
 - *README.md* - Explains the premise of this repository, project requirements, contents and steps to execute R script.

# Steps to execute R script
Please follow these instructions to execute the R script :

 1. Please ensure you have internet connectivity to download files from source ((https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 
 2. Put run_analysis.R into C:\Coursera folder.
 3. Launch RStudio, confirm Version 0.98.1103 and R 3.1.3
 4. In RStudio, `setwd("C:\Coursera")` to set C:\Coursera as working directory.
 5. Load & execute R script via `source("run_analysis.R")` 
 6. Open C:\Coursera\TidyDataSet.txt in any text editor and review.

