##Read in the data frame  and subset by the information I need.
##Overwrite the previous data frame to free up storage space

library("dplyr")
power_consumption <- read.table("~/household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
power_consumption <- (power_consumption[grep("^1/2/2007$|^2/2/2007$",power_consumption$Date),])



library("lubridate")

##change the date and time to proper format

power_consumption$Date <- strptime(paste(power_consumption$Date,power_consumption$Time), "%d/%m/%Y %H:%M:%S")

##create the png file.  I didn't resize to 480x480 pixels becase png's default to that size
png(file = "plot3.png")

##make the plot for the first variable, Energy sub metering 1
plot(Sub_metering_1 ~ Time, power_consumption, xlab = "", ylab = "Energy sub metering", xaxt = "n", type = "l")

##add sub_meters 1 and 2 to existing plot using the "lines" command
lines(Sub_metering_2 ~ Time, power_consumption, type = "l",col="red")
lines(Sub_metering_3 ~ Time, power_consumption, type = "l",col="blue")

##Change the x-axis
axis(1, at = c(0,720,1440), labels = c("Thurs", "Fri", "Sat"))

##create a legend
legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##close the connection!
dev.off()