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

####Create plots
par(mfrow = c(2, 2)) 

        plot(myTime2,mySub$Global_active_power,type="l",ylab="Global Active Power",xlab="")
        plot(myTime2,mySub$Voltage,type="l",ylab="Voltage",xlab="datetime")

        plot(myTime2,mySub$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
        lines(myTime2,mySub$Sub_metering_2,col="red")
        lines(myTime2,mySub$Sub_metering_3,col="blue")
        legend("topright",bty = "n",cex=0.6, lty=c(1,1),col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
        
        plot(myTime2,mySub$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")


####Save to PNG
dev.copy(png, file = "plot4.png")
dev.off()
