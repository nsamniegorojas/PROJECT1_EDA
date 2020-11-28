rm(list = ls())
#reading file csv
setwd ("C:/R_PROJECTS/EXPLORATORY_DATA/PROJECT1_EDA")
sourcefile <- "household_power_consumption.txt"
data <- read.table(sourcefile, header = TRUE, sep = ";", 
                   stringsAsFactors = FALSE, dec = ".")
data <- na.omit(data) 

# convert the date variable
data_d <-as.Date(data$Date, format = "%d/%m/%Y")

subdata<-subset(data, data$Date=="1/2/2007"|data$Date=="2/2/2007")
subdata_ddt <- paste (as.Date(subdata$Date, format="%d/%m/%Y"), subdata$Time)
subdata_ddt <- as.POSIXct (subdata_ddt)  

# Device png

png("plot3.png", width=470, height = 480)

# Plotting

plot(subdata_ddt, subdata$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub_metering")
    

lines(subdata_ddt, subdata$Sub_metering_2, col = "forestgreen")
lines(subdata_ddt, subdata$Sub_metering_3, col = "grey")

legend("topright", col = c("black","forestgreen","grey"), 
       c("Sub_metering_1 ", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1), lwd = c(1,1), cex = 0.66)

dev.off()
file.show("plot3.png")

