#reading file csv
rm(list=ls()) 

#reading file csv
setwd ("C:/R_PROJECTS/EXPLORATORY_DATA")
#install.packages ("readr") 
#library("readr")

data <-read.csv2 ("C:/R_PROJECTS/EXPLORATORY_DATA/PROJECT1_EDA/household_power_consumption.txt", header = TRUE)
data <- na.omit(data)

#subsetting data
subdata<-subset(data, data$Date=="1/2/2007"|data$Date=="2/2/2007")

# Converting dates&Time

ddtime<-paste(as.Date(subdata$Date, format="%d/%m/%Y"), subdata$Time)
ddtime1<- as.POSIXct(ddtime)
typeof (ddtime1)
ddtime1

#PLOT No. 2

png("plot2.png", width=480, height = 480)

plot(ddtime1, subdata$Global_active_power, type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")
    dev.off()
file.show("plot2.png")

