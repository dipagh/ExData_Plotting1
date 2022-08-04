#plot2
library(tidyverse)
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = "exdata_data_household_power_consumption.tar.gz")
unzip("exdata_data_household_power_consumption.tar.gz")
df_power<-read.table('household_power_consumption.txt',sep = ";", na.strings="?",header=TRUE)
df_power$DateTime <- as.POSIXct(strptime(paste(df_power$Date, df_power$Time), format="%d/%m/%Y %H:%M:%S"))
df <- filter(df_power, Date == "1/2/2007" | Date == "2/2/2007")

png(filename = "Plot 2.png", width = 480, height = 480)
plot(df$DateTime, df$Global_active_power, type="l", xlab = NA, ylab = "Global Active Power (kilowatts)")
dev.off()
