##Get the household power consumption data from 1/2/2007 and 2/2/2007
url1 <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url1, destfile = "exdata%2Fdata%2Fhousehold_power_consumption.zip")
data1 <- read.table(unz("exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.txt"), header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
hhpcdata <- data1[data1$Date %in% c("1/2/2007","2/2/2007") ,]

##Convert the Date and Time variables to Date/Time classes
dtcl <- strptime(paste(hhpcdata$Date, hhpcdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

##Subset the sub_metering data
sm1 <- as.numeric(hhpcdata$Sub_metering_1)
sm2 <- as.numeric(hhpcdata$Sub_metering_2)
sm3 <- as.numeric(hhpcdata$Sub_metering_3)

##Plot the sub_metering data over time
plot(dtcl, sm1, type = "l", ylab = "Energy sub metering", xlab = " ")
points(dtcl, sm2, type = "l", col = "red")
points(dtcl, sm3, type = "l", col = "blue")

##Add a legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 1, col = c("black", "red", "blue"))

##Copy plot to a png file
dev.copy(png, filename = "plot3.png", width = 480, height = 480)

##Close the png graphics device
dev.off(which = dev.cur())
