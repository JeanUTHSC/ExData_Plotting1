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

png(file ="plot2.png", width = 480, height = 480)
with(data2, plot(RealTime, Global_active_power, pch =NA_integer_, xlab = "", ylab ="Global Active Power (killowatts)"))
with(data2, lines(RealTime, Global_active_power, col="black"))
dev.off()
