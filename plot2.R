## some settings and library some necessary packages
setwd("/Users/Janet/Desktop/Coursera/Data Science/4_Exploratory_Data_Analysis/week1_project")
library(data.table)
library(dplyr)
library(lubridate)

##import dataset,subset the necessary data.
data <- fread("./household_power_consumption.txt")
data$Date <- as.Date(data$Date,"%d/%m/%Y")
datasub <- filter(data,Date=="2007-02-01"|Date=="2007-02-02")
datasub$Global_active_power <- as.numeric(datasub$Global_active_power)
datasub <- mutate(datasub,datetime=ymd_hms(paste(Date,Time)))
datasub <- mutate(datasub,weekday=wday(datasub$datetime,label=TRUE))

##use png device to save the plot result.
png(file="plot2.png",width = 480, height = 480,units = "px")
with(datasub,{
        plot(datetime,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
        axis(1,at=weekday,labels=weekday)
})
dev.off()
