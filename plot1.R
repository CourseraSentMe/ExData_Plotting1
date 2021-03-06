##Get the household power consumption data from 1/2/2007 and 2/2/2007
url1 <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url1, destfile = "exdata%2Fdata%2Fhousehold_power_consumption.zip")
data1 <- read.table(unz("exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.txt"), header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
hhpcdata <- data1[data1$Date %in% c("1/2/2007","2/2/2007") ,]

##Subset the Global Active Power data
gap <- as.numeric(hhpcdata$Global_active_power)

##Create a histogram of the Global Active Power data
hist(gap, breaks = 15, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab = "Frequency")

##Copy the histogram to a png file
dev.copy(png, filename = "plot1.png", width = 480, height = 480)

##Close the png graphics device
dev.off(which = dev.cur())
