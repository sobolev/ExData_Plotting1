library(readr)
library(lubridate)

data<-subset(read_delim("household_power_consumption.txt",delim=";",na="?"),Date %in% c("1/2/2007","2/2/2007"))

data$DateTime<-paste(data$Date,data$Time,sep=" ")
data$DateTime<-dmy_hms(data$DateTime)

png("plot1.png")

hist(data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

dev.off()
