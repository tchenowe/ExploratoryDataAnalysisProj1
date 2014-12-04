library(datasets)
data<-read.table("household_power_consumption.txt", sep=";", header = TRUE,
                 na.strings = "?")
data$Date<-as.Date(data$Date, "%d/%m/%Y")
data<-subset(data, Date>="2007-02-01" & Date<="2007-02-02")
row.names(data)<-NULL
data$DateTime<-as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
png(filename = "plot2.png", width=480, height=480)
with(data, plot(DateTime, Global_active_power, type="l", 
    xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()
