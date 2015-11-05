## Read in the file after downloading it to your working directory

power_consumption <- read.table("~/household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

##Subset the file to the days required, then overwrite it to the original table so that R 
##doesn't store a large dataset in memory.
power_consumption <- power_consumption[grep("^1/2/2007$|^2/2/2007$",power_consumption$Date),]

##Create a histogram just showing the Global Active Power column
##Specify the filler to be red
##specify the Main Title as "Global Active Power" and X Label as Global Active Power (kilowatts)"
hist(power_consumption$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

##Copy the histogram to PNG.  PNG defaults to a 480x480 pixel size, so there is no need to change it
dev.copy(png, file = "plot1.png")

##Close the connection to the file
dev.off()