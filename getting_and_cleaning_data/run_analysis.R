###########################################################
### Course project for the Getting and Cleaning Data course
### from the Data Science Specialization


#################### 
### Libraries needed
library(dplyr)
library(tidyr)
library(stringr)



#############################
### Setting up paths to files

folder_path <- "C:/Data_Science/Get_and_Clean_Data/UCI HAR Dataset"



#################
### Reading files

### training files
x_train <- read.table(paste0(folder_path, "/train/X_train.txt"))
y_train <- read.table(paste0(folder_path, "/train/Y_train.txt"))
subject_train <- read.table(paste0(folder_path, "/train/subject_train.txt"))

### test files
x_test <- read.table(paste0(folder_path, "/test/X_test.txt"))
y_test <- read.table(paste0(folder_path, "/test/y_test.txt"))
subject_test <- read.table(paste0(folder_path, "/test/subject_test.txt"))

### features
features <- read.table(paste0(folder_path, "/features.txt"), stringsAsFactors = F)

### checking that everything looks fine   
glimpse(x_train)
glimpse(y_train)
glimpse(subject_train)
glimpse(x_test)
glimpse(y_test)
glimpse(subject_test)
glimpse(features)



#################################
### Getting a picture of the data

### How many means and stds are there in the variables?
head(features)
sum(str_detect(features$V2, "[Mm]ean"))
sum(str_detect(features$V2, "[Ss]td"))

### there's more 'mean' hits than 'std' ones. Some more detail:

features$V2[str_detect(features$V2, "[Mm]ean")]
features$V2[str_detect(features$V2, "[Ss]td")]

### it seems the structure of feature names we need is: variablename-function()-axis
### Let's check again changing the string to search for

sum(str_detect(features$V2, "mean\\("))
features$V2[str_detect(features$V2, "mean\\(")]

cbind(features$V2[str_detect(features$V2, "mean\\(")], features$V2[str_detect(features$V2, "[Ss]td")])

### That looks about right :)



########################
### Merging the datasets

subject_all <- rbind(subject_train, subject_test)
x_all <- rbind(x_train, x_test)
y_all <- rbind(y_train, y_test)

full_data <- cbind(subject_all, y_all, x_all)



###########################
### Assigning initial names

names(full_data) <- c("subject", "activity", features$V2)

### Making the first two columns factors
full_data$subject <- as.factor(full_data$subject)
full_data$activity <- as.factor(full_data$activity)

#########
### Note:
### full_data is the merged dataset asked for in question 1
str(full_data)



#######################################
### Extracting columns for mean and std

### Which columns contain the mean and std of the measurements
which_columns <- str_detect(names(full_data), "mean\\(|[Ss]td")

### Don't forget to include subject and activity
which_columns[1:2] <- TRUE

extracted_data <- full_data[, which_columns]

#########
### Note:
### extracted_data is the new dataset asked for in question 2
str(extracted_data)



#####################################
### Assigning names to the activities

### The activity names are already informative, so only minor changes for length here
activity_names <- c("walking", "w_upstairs", "w_downstairs", "sitting", "standing", "laying")

### Making the first two columns factors
extracted_data$subject <- as.factor(extracted_data$subject)
extracted_data$activity <- as.factor(extracted_data$activity)
levels(extracted_data$activity) <- activity_names



###########################
### Cleaning variable names

names(extracted_data) <- names(extracted_data) %>%
    tolower %>%
    str_remove("\\(\\)") %>%
    str_replace_all("-", "_") %>%
    str_replace("^t", "t_") %>% 
    str_replace("^f", "f_") 



####################################
### Making the tidy analysis dataset

tidy_data <- extracted_data %>%
    group_by(subject, activity) %>%
    summarise_all(funs(mean))



#####################
### Writing the table

write.table(tidy_data, file=paste0(folder_path,"/tidy_set.txt"), row.name=FALSE)
