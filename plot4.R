library(datasets)
data<-read.table("household_power_consumption.txt", sep=";", header = TRUE,
                 na.strings = "?")
data$Date<-as.Date(data$Date, "%d/%m/%Y")
data<-subset(data, Date>="2007-02-01" & Date<="2007-02-02")
row.names(data)<-NULL
data$DateTime<-as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
png(filename = "plot4.png", width=480, height=480)
par(mfcol = c(2, 2), mar = c(5, 4, 2, 1))
with(data, {
    plot(DateTime, Global_active_power, type="l", xlab="", 
         ylab="Global Active Power (kilowatts)")
    plot(DateTime, Sub_metering_1, type="l", xlab="", 
         ylab="Energy sub metering")
    points(DateTime, Sub_metering_2, type="l", col="red")
    points(DateTime, Sub_metering_3, type="l", col="blue")
    legend("topright", lty=1, bty="n",  col = c("black", "red", "blue"), 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(DateTime, Voltage, type="l", ylab="Voltage")
    plot(DateTime, Global_reactive_power, type="l")
})
dev.off()

