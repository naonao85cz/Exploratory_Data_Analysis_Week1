## some settings and library some necessary packages
setwd("/Users/Janet/Desktop/Coursera/Data Science/4_Exploratory_Data_Analysis/week1_project")
library(data.table)
library(dplyr)

##import dataset,subset the necessary data.
data <- fread("./household_power_consumption.txt")
data$Date <- as.Date(data$Date,"%d/%m/%Y")
datasub <- filter(data,Date=="2007-02-01"|Date=="2007-02-02")
datasub$Time <- strptime(datasub$Time,format="%H:%M:%S")
datasub$Global_active_power <- as.numeric(datasub$Global_active_power)

##use png device to save the plot result.
png(file="plot1.png",width = 480, height = 480,units = "px")
with(datasub,hist(Global_active_power,main="",col="red",xlab="Global Active Power (kilowatts)"))
title(main="Global Active Power")
dev.off()
