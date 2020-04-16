#Reading the data:
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "./fulldata.zip")
unzip("./fulldata.zip")
library(data.table)
febdata <- subset(fread(file = "./household_power_consumption.txt"), Date == "2/2/2007" | Date == "1/2/2007")
febdata$datetime <- paste(febdata$Date, febdata$Time, sep = " ")
library(lubridate)
febdata$datetime <- dmy_hms(febdata$datetime)


#Creating plot 4:
png(filename = "plot4.png", width = 480, height = 480)
par(mfcol = c(2,2), mar = c(4,4,2,2))

#Top left plot:
febdata$Global_active_power <- as.numeric(as.character((febdata$Global_active_power)))
with(febdata, plot(datetime, Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "n"))
with(febdata, lines(datetime, Global_active_power))

#Bottom left plot:
with(febdata, plot(datetime, Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "n"))
with(febdata, lines(datetime, Sub_metering_1, col = "black"))
with(febdata, lines(datetime, Sub_metering_2, col = "red"))
with(febdata, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", lty = 1, bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Top right plot:
febdata$Sub_metering_1 <- as.numeric(febdata$Sub_metering_1)
febdata$Sub_metering_2 <- as.numeric(febdata$Sub_metering_2)
febdata$Sub_metering_3 <- as.numeric(febdata$Sub_metering_3)
febdata$Voltage <- as.numeric(febdata$Voltage)
with(febdata, plot(datetime, Voltage, ylab = "Voltage", xlab = "datetime", type = "n"))
with(febdata, lines(datetime, Voltage))

#Bottom right plot:
febdata$Global_reactive_power <- as.numeric((febdata$Global_reactive_power))
with(febdata, plot(datetime, Global_reactive_power, ylab = "Global_reactive_power", xlab = "datetime", type = "n"))
with(febdata, lines(datetime, Global_reactive_power))

#Create png file
dev.off()