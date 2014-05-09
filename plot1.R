##Please note that my code requires the "sqldf" package in order to selectively
##read only the specific data I'm interested in. I opted to do this rather than
##read the entire file and subset, thereby saving time and processing power.
##My code assumes that the "household_power_consumption.txt" file is already
##in your working directory.

library(sqldf)
require("sqldf")
SqlCode <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
d2 <- read.csv.sql("household_power_consumption.txt", SqlCode, sep=";")
png(filename="plot1.png", width=480, height=480, units="px")
hist(d2$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power", yaxp=c(0, 1200, 6))
dev.off()