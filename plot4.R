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
png(filename="plot4.png", width=480, height=480, units="px")
par(mfrow=c(2, 2))
##top left plot
plot(d2$Time, d2$Global_active_power, xlab="", ylab="Global Active Power", pch=NA)
lines(d2$Time, d2$Global_active_power)

##top right plot
plot(d2$Time, d2$Voltage, xlab="datetime", ylab="Voltage", pch=NA)
lines(d2$Time, d2$Voltage)

##bottom left plot
plot(d2$Time, d2$Sub_metering_1, xlab="", ylab="Energy sub metering", pch=NA)
lines(d2$Time, d2$Sub_metering_1)
points(d2$Time, d2$Sub_metering_2, pch=NA)
lines(d2$Time, d2$Sub_metering_2, col="red")
points(d2$Time, d2$Sub_metering_3, pch=NA)
lines(d2$Time, d2$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1, 1, 1), col=c("black", "red", "blue"))

##bottom right plot
plot(d2$Time, d2$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", pch=NA)
lines(d2$Time, d2$Global_reactive_power)

dev.off()