###################################################################
### Peer graded assignment for the Exploratory Data Analysis course
### from the Data Science Specialization

### This script creates plot 2


################
### Source the file that reads the data

setwd("C:/Data_Science/Exploratory_Data_Analysis")
source("Reading_data.R")


###############
### Make Plot 2

png(filename = "plot2.png")
plot(hpc2007$Global_active_power, type="l", xlab = NA, ylab = "Global Active Power (kilowatts)", xaxt = 'n')
axis(side = 1, at = c(0, length(hpc2007$Global_active_power)/2,length(hpc2007$Global_active_power)),
     labels = c("Thu", "Fri", "Sat"))
dev.off()