rm(list=ls()) 

#reading file csv
setwd ("C:/R_PROJECTS/EXPLORATORY_DATA")
#install.packages ("readr") 
#library("readr")

data <-read.csv2 ("C:/R_PROJECTS/EXPLORATORY_DATA/PROJECT1_EDA/household_power_consumption.txt", header = TRUE)

subdata<-subset(data, data$Date=="1/2/2007"|data$Date=="2/2/2007")

#Device png

png("plot1.png", width=480, height = 480)

# GRAPHIC Nro. 1-HISTOGRAM
subdata1<-as.numeric(subdata$Global_active_power)
hist(subdata1, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
#png ("plot1.png", width = 480, height=480)
dev.off()
file.show("plot1.png")


