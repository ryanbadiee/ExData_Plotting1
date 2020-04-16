#Reading the data:
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "./fulldata.zip")
unzip("./fulldata.zip")
library(data.table)
febdata <- subset(fread(file = "./household_power_consumption.txt"), Date == "2/2/2007" | Date == "1/2/2007")
febdata$datetime <- paste(febdata$Date, febdata$Time, sep = " ")
library(lubridate)
febdata$datetime <- dmy_hms(febdata$datetime)


#Creating plot 2:
png(filename = "plot2.png", width = 480, height = 480)

febdata$Global_active_power <- as.numeric(as.character((febdata$Global_active_power)))
with(febdata, plot(datetime, Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "n"))
with(febdata, lines(datetime, Global_active_power))

dev.off()
