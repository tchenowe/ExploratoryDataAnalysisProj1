library(datasets)
data<-read.table("household_power_consumption.txt", sep=";", header = TRUE,
                 na.strings = "?")
data$Date<-as.Date(data$Date, "%d/%m/%Y")
data<-subset(data, Date>="2007-02-01" & Date<="2007-02-02")
row.names(data)<-NULL
data$DateTime<-as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
png(filename = "plot3.png", width=480, height=480)
with(data, plot(DateTime, Sub_metering_1, type="l", xlab="", 
    ylab="Energy sub metering"))
with(data, points(DateTime, Sub_metering_2, type="l", col="red"))
with(data, points(DateTime, Sub_metering_3, type="l", col="blue"))
legend("topright",lty=1 , col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()