#Getting and cleaning the data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "./fulldata.zip")
unzip("./fulldata.zip")
library(data.table)
febdata <- subset(fread(file = "./household_power_consumption.txt"), Date == "2/2/2007" | Date == "1/2/2007")
febdata$datetime <- paste(febdata$Date, febdata$Time, sep = " ")
library(lubridate)
febdata$datetime <- dmy_hms(febdata$datetime)

#Creating plot 1:
png(filename = "plot1.png", width = 480, height = 480)

febdata$Global_active_power <- as.numeric(as.character((febdata$Global_active_power)))
hist(febdata$Global_active_power, breaks = 12, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()
