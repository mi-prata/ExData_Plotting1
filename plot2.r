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
plot(myTime2,mySub$Global_active_power,type="l",ylab="Global Active Power (killowatts)",xlab="")

####Save to PNG
dev.copy(png, file = "plot2.png")
dev.off()
