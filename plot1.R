#plot1
library(tidyverse)
library(lubridate)

url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = "exdata_data_household_power_consumption.tar.gz")
unzip("exdata_data_household_power_consumption.tar.gz")
df_power<-read.table('household_power_consumption.txt',sep = ";", na.strings="?",header=TRUE)
df_power$Date<-as.Date(df_power$Date,format="%d/%m/%Y")
df<-df_power%>%filter(Date>="2007-02-01"& Date<="2007-02-02")

png(filename = "Plot 1.png", width = 480, height = 480)
hist(df$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",
     ylab="Frequency",main="Global Active Power")
dev.off()
