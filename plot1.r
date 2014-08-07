###Load SQLDF Library
library(sqldf)

####Set working directory to where original data file is
setwd("~/IST/Dropbox/Dropbox/Minhas/Coursera/Data Analysis/Project 1")

myfile<-"household_power_consumption.txt"

####Read the necessary days
mySub<-read.csv.sql(myfile, sep=";",sql = 'select * from file where Date = "1/2/2007" OR Date = "2/2/2007"')


####Create plot
hist(mySub$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (killowatts)")

####Save to PNG
dev.copy(png, file = "plot1.png")
dev.off()
