###Load SQLDF Library
library(sqldf)

####Set working directory to where original data file is
setwd("~/IST/Dropbox/Dropbox/Minhas/Coursera/Data Analysis/Project 1")

myfile<-"household_power_consumption.txt"

####Read the necessary days
mySub<-read.csv.sql(myfile, sep=";",sql = 'select * from file where Date = "1/2/2007" OR Date = "2/2/2007"')

####Concatenate Time and Date into the same array
myTime <- paste(mySub[,1],mySub[,2])

####Convert vector of characters into dates with strptime
myTime2 <- strptime(myTime, "%d/%m/%Y %H:%M:%S")

####Make sure weekdays are in english
Sys.setlocale("LC_TIME", "C")

####Create plot
plot(myTime2,mySub$Sub_metering_1,type="l",ann=FALSE)
lines(myTime2,mySub$Sub_metering_2,col="red")
lines(myTime2,mySub$Sub_metering_3,col="blue")
###Anotate plot
title(ylab="Energy sub metering",xlab="")
legend("topright", lty=c(1,1),col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

####Save to PNG
dev.copy(png, file = "plot3.png")
dev.off()
