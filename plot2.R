library(readr)
library(lubridate)

data<-subset(read_delim("household_power_consumption.txt",delim=";",na="?"),Date %in% c("1/2/2007","2/2/2007"))

data$DateTime<-paste(data$Date,data$Time,sep=" ")
data$DateTime<-dmy_hms(data$DateTime)

png("plot2.png")

plot(data$DateTime,data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")


dev.off()
