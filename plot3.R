#Reading the data:
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "./fulldata.zip")
unzip("./fulldata.zip")
library(data.table)
febdata <- subset(fread(file = "./household_power_consumption.txt"), Date == "2/2/2007" | Date == "1/2/2007")
febdata$datetime <- paste(febdata$Date, febdata$Time, sep = " ")
library(lubridate)
febdata$datetime <- dmy_hms(febdata$datetime)


#Creating plot 3:
png(filename = "plot3.png", width = 480, height = 480)

febdata$Sub_metering_1 <- as.numeric(febdata$Sub_metering_1)
febdata$Sub_metering_2 <- as.numeric(febdata$Sub_metering_2)
febdata$Sub_metering_3 <- as.numeric(febdata$Sub_metering_3)

with(febdata, plot(datetime, Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "n"))
with(febdata, lines(datetime, Sub_metering_1, col = "black"))
with(febdata, lines(datetime, Sub_metering_2, col = "red"))
with(febdata, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
