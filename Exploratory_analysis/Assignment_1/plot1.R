###################################################################
### Peer graded assignment for the Exploratory Data Analysis course
### from the Data Science Specialization

### This script creates plot 1


################
### Source the file that reads the data

setwd("C:/Data_Science/Exploratory_Data_Analysis")
source("Reading_data.R")


###############
### Make Plot 1

png(filename = "plot1.png")
hist(hpc2007$Global_active_power, col="red", 
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()