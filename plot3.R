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
datasub$Sub_metering_1 <- as.numeric(datasub$Sub_metering_1)
datasub$Sub_metering_2 <- as.numeric(datasub$Sub_metering_2)
datasub$Sub_metering_3 <- as.numeric(datasub$Sub_metering_3)

##use png device to save the plot result.
png(file="plot3.png",width = 480, height = 480,units = "px")
with(datasub,{
        plot(datetime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
        axis(1,at=weekday,labels=weekday)
        lines(datetime,Sub_metering_2,,col="red")
        lines(datetime,Sub_metering_3,,col="blue")
        legend("topright",lty=c(1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
})
dev.off()
