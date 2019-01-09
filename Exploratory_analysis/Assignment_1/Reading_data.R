###################################################################
### Peer graded assignment for the Exploratory Data Analysis course
### from the Data Science Specialization

### This script only reads the data. It doesn't plot anything.


##############
### Libraries

library(dplyr)
library(lubridate)


#################
### Read the data

file_path <- "C:/Data_Science/Exploratory_Data_Analysis"

hpc <- read.table(paste0(file_path, "/household_power_consumption.txt"), sep=";", 
                  header = T, stringsAsFactors = F, na.strings = "?")


hpc$Date <- dmy(hpc$Date)

glimpse(hpc)

hpc2007 <- hpc %>%
    filter(year(Date) == 2007) %>%
    filter(month(Date) == 2) %>%
    filter(day(Date) == 1 | day(Date) == 2)

### Note: for some reason, filter does not support the Period class, so this has to be done after filtering
hpc2007$Time <- strptime(hpc2007$Time, "%H:%M:%S")
