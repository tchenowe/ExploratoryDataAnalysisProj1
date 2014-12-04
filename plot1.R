library(datasets)
data<-read.table("household_power_consumption.txt", sep=";", header = TRUE,
    na.strings = "?")
data$Date<-as.Date(data$Date, "%d/%m/%Y")
data<-subset(data, Date>="2007-02-01" & Date<="2007-02-02")
row.names(data)<-NULL
png(filename = "plot1.png", width=480, height=480)
hist(data$Global_active_power, col="red", main="Global Active Power", 
       xlab="Global Active Power (kilowatts)", yaxt="n")
axis(2, at=c(0,200,400,600,800,1000,1200), 
       labels=c(0,200,400,600,800,1000,1200), las=2)
dev.off()
