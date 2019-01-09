###################################################################
### Peer graded assignment for the Exploratory Data Analysis course
### from the Data Science Specialization

### This script creates plot 4


################
### Source the file that reads the data

setwd("C:/Data_Science/Exploratory_Data_Analysis")
source("Reading_data.R")


###############
### Make Plot 4

png(filename = "plot4.png", width = 504, height = 504)
par(mfrow=c(2,2))

plot(hpc2007$Global_active_power, type="l", xlab = NA, ylab = "Global Active Power (kilowatts)", xaxt = 'n')
axis(side = 1, at = c(0, length(hpc2007$Global_active_power)/2,length(hpc2007$Global_active_power)),
     labels = c("Thu", "Fri", "Sat"))

plot(hpc2007$Voltage, type="l", xlab = "datetime", ylab = "Voltage", xaxt = 'n')
axis(side = 1, at = c(0, length(hpc2007$Global_active_power)/2,length(hpc2007$Global_active_power)),
     labels = c("Thu", "Fri", "Sat"))

plot(hpc2007$Sub_metering_1, type='l', xaxt = 'n', ylab="Energy sub metering", xlab=NA)
lines(hpc2007$Sub_metering_2, col="red")
lines(hpc2007$Sub_metering_3, col="blue")
axis(side=1, at = c(0, length(hpc2007$Global_active_power)/2,length(hpc2007$Global_active_power)),
     labels = c("Thu", "Fri", "Sat"))
legend("topright", legend = c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"), 
       lwd=1, col=c("black", "red", "blue"), bty='n')

plot(hpc2007$Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power", xaxt = 'n')
axis(side = 1, at = c(0, length(hpc2007$Global_active_power)/2,length(hpc2007$Global_active_power)),
     labels = c("Thu", "Fri", "Sat"))

dev.off()