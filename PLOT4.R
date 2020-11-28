rm(list = ls())
#reading file csv
setwd ("C:/R_PROJECTS/EXPLORATORY_DATA")
#install.packages ("readr") 
#library("readr")

data <-read.csv2 ("C:/R_PROJECTS/EXPLORATORY_DATA/PROJECT1_EDA/household_power_consumption.txt", header = TRUE)
data <- na.omit(data)

#subsetting data
subdata<-subset(data, data$Date=="1/2/2007"|data$Date=="2/2/2007")

datetime <- paste(as.Date(subdata$Date, format="%d/%m/%Y"), subdata$Time)
datatime1 <- as.POSIXct(datetime)

datetime

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
# P4.1
plot(datatime1, subdata$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

# P4.2
plot(datatime1, subdata$Voltage,
     type="l", 
     xlab="datetime", 
     ylab="Voltage")

# P4.3
plot(datatime1, subdata$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")

lines(datatime1, subdata$Sub_metering_2, col = "red")
lines(datatime1, subdata$Sub_metering_3, col = "blue")

legend("topright", col = c("black","red","blue"), 
       c("Sub_metering_1 ", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1), lwd = c(1,1), 
       bty = "n", cex = 0.6)

# P4.4
plot(datatime1, subdata$Global_reactive_power, 
     type="l", 
     xlab="datetime", 
     ylab="Global_reactive_power")


dev.off()
file.show("plot4.png")
