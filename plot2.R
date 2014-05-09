##Please note that my code requires the "sqldf" package in order to selectively
##read only the specific data I'm interested in. I opted to do this rather than
##read the entire file and subset, thereby saving time and processing power.
##My code assumes that the "household_power_consumption.txt" file is already
##in your working directory.

library(sqldf)
require("sqldf")
SqlCode <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
d2 <- read.csv.sql("household_power_consumption.txt", SqlCode, sep=";")
d2$Date <- as.Date(d2$Date, "%d/%m/%Y")
c <- paste(d2$Date, d2$Time)
e <- strptime(c, "%Y-%m-%d %H:%M:%S")
d2$Time <- e
png(filename="plot2.png", width=480, height=480, units="px")
plot(d2$Time, d2$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", pch=NA)
lines(d2$Time, d2$Global_active_power)
dev.off()