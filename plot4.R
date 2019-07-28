library(dplyr)
library(lubridate)

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "./HPC.zip", method = "curl")

if(!file.exists("household_power_consumption")){unzip("./HPC.zip")}

data <- read.table("./household_power_consumption.txt",sep =";", header =TRUE)

head(data)

sapply(data, class)

data1<-mutate(data, NewDate = as.Date(data$Date, "%d/%m/%Y"))

data2<- filter(data1, NewDate=="2007-02-02"| NewDate =="2007-02-01")

data2$Global_active_power<- as.character(Global_active_power))
data2$Global_active_power<- as.numeric(Global_active_power))

data2$NewTime <-as.character(data2$Time)
data2$RealTime <- paste(data2$NewDate, data2$NewTime)
data2$RealTime <- ymd_hms(data2$RealTime)

data2$Sub_metering_1<-as.character(data2$Sub_metering_1)
> data2$Sub_metering_1<-as.numeric(data2$Sub_metering_1)
data2$Sub_metering_2<-as.character(data2$Sub_metering_2)
data2$Sub_metering_2<-as.numeric(data2$Sub_metering_2)

data2$Voltage <-as.character(data2$Voltage)
data2$Voltage <-as.numeric(data2$Voltage)
data2$Global_reactive_power <-as.character(data2$Global_reactive_power)
data2$Global_reactive_power <-as.numeric(data2$Global_reactive_power)

png(file ="plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
with(data2, plot(RealTime, Global_active_power, pch =NA_integer_, xlab = "", ylab ="Global Active Power"))
with(data2, lines(RealTime, Global_active_power, col="black"))
with(data2, plot(RealTime, Voltage, xlab = "datatime", ylab ="Voltage", pch=NA_integer_))
with(data2, lines(RealTime,Voltage, col="black"))

with(data2, plot(RealTime, Sub_metering_2, pch = NA_integer_, ann= FALSE, xaxt = "n", yaxt = "n"))
par(new= TRUE)
with(data2, plot(RealTime, Sub_metering_3, pch = NA_integer_, ann= FALSE, xaxt = "n", yaxt = "n"))
par(new= TRUE)
with(data2, plot(RealTime, Sub_metering_1, pch =NA_integer_, xlab ="", ylab = "Energy sub metering"))
with(data2, lines(RealTime, Sub_metering_1, col = "black"))
with(data2, lines(RealTime, Sub_metering_2, col = "red"))
with(data2, lines(RealTime, Sub_metering_3, col = "blue"))
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"), lty = 1)

with(data2, plot(RealTime, Global_reactive_power, pch =NA_integer_, xlab = "datatime", ylab ="Global_reactive_power"))
with(data2, lines(RealTime, Global_reactive_power, col="black"))
dev.off()
