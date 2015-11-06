##Read in the data frame  and subset by the information I need.
##Overwrite the previous data frame to free up storage space

library("dplyr")
power_consumption <- read.table("~/household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
power_consumption <- (power_consumption[grep("^1/2/2007$|^2/2/2007$",power_consumption$Date),])



library("lubridate")

##change the date and time to proper format

power_consumption$Date <- strptime(paste(power_consumption$Date,power_consumption$Time), "%d/%m/%Y %H:%M:%S")

png(file = "plog2.png")

##make the plot
plot(Global_active_power ~ Time, power_consumption, xlab = "", ylab = "Global Active Power (kilowatts)", xaxt = "n", type = "l")

##Change the x-axis
axis(1, at = c(0,720,1440), labels = c("Thurs", "Fri", "Sat"))


##create the png file.  I didn't resize to 480x480 pixels becase png's default to that size
##dev.copy(png,file="plot2.png")

##close the connection!
dev.off()