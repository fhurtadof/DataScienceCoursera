# Peer reviewed assignment Getting and Cleaning Data

This repository contains three of the files required by the assignment: this ReadMe, the R script used in the assignment and a codebook with the variables of the tidy dataset.

## R script: run_analysis.R

This file contains all the code used for the assignment. The file requires for you to specify the folder that contains the UCI HAR Dataset (folder_path), and the data must have the same folder structure as the original data downloaded for the assignment. 

The script first reads all the files and checks the structure of the data. The different files are then merged into a single object called ```full_data```, which has the following structure:

subject | activity | variable 1 | variable 2 | ...
------- | -------- | ---------- | ---------- | ...
      1 | walking  | (value)    | (value)    | ...
    ... |      ... |        ... |        ... | ...

Using ```full_data```, a new dataset is built with only the measurements on the mean and standard deviation for each measurement. Since there were no specific instructions as to what these variables were, following the description of the original dataset (found in the file 'features_info.txt') I extracted only the variables that contained either 'mean()' or 'std()' in their name.

Activity names in the original dataset were already informative, but for the sake of length they were set to lower case modified to: "walking", "w_upstairs", "w_downstairs", "sitting", "standing", and "laying".

Variable names were also already informative in the original dataset, but they were modified so that they would not conflict with R. New variable names have the structure: ```domain_measurement_axis```. Domain is a single letter (t or f) denoting whether the measurement is from either time or Fourier transform domains. Measurement is the simply the feature being measured. Axis denotes the respective vector component of 3D measurements (x, y or z). 

Last, a new tidy dataset (```tidy_data```) was created, including the average of each variable for each activity and each subject.