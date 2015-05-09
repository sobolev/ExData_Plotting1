library(readr)
library(lubridate)

data<-subset(read_delim("household_power_consumption.txt",delim=";",na="?"),Date %in% c("1/2/2007","2/2/2007"))

data$DateTime<-paste(data$Date,data$Time,sep=" ")
data$DateTime<-dmy_hms(data$DateTime)

png("plot3.png")

plot(data$DateTime,data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(data$DateTime,data$Sub_metering_2,type="l",col="red")
lines(data$DateTime,data$Sub_metering_3,type="l",col="blue")
legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))

dev.off()
