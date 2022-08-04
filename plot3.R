#plot3
library(tidyverse)
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = "exdata_data_household_power_consumption.tar.gz")
unzip("exdata_data_household_power_consumption.tar.gz")
df_power<-read.table('household_power_consumption.txt',sep = ";", na.strings="?",header=TRUE)
df_power$DateTime <- as.POSIXct(strptime(paste(df_power$Date, df_power$Time), format="%d/%m/%Y %H:%M:%S"))
df <- filter(df_power, Date == "1/2/2007" | Date == "2/2/2007")


png(filename = "Plot 3.png", width = 480, height = 480)
plot(df$DateTime, df$Sub_metering_1, type="l", xlab = NA, ylab = "Energy sub metering")
lines(df$DateTime, df$Sub_metering_2, type="l", col = "red")
lines(df$DateTime, df$Sub_metering_3, type="l", col = "blue")
legend("topright", legend = c(names(df)[7:9]), col = c("black", "red", "blue"), lty=1, cex=0.8)
dev.off()
