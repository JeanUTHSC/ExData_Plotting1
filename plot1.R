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


png(file ="plot1.png", width = 480, height = 480)
hist(data2$Global_active_power_num,col="red", main = "Global Acrtive Power", xlab = "Global Active Power (killowatts)")
dev.off()
