
## Read electricity data from the local text file residing in the working directory
electricData <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c(rep("character", 2), rep("numeric", 7)), na.strings = c("NA", "?"))
electricData$Date <- as.Date(electricData$Date, "%d/%m/%Y")

## Subset the dataframe to include only the wanted date range
electricData <- electricData[(electricData$Date >= "2007-02-01" & electricData$Date <= "2007-02-02"), ]

## Convert the datetime variables
electricData$DateTime <- paste(electricData$Date, electricData$Time)
electricData$DateTime <- strptime(electricData$DateTime, "%Y-%m-%d %H:%M:%S")

## Plot the plot4.png
png(filename = "plot4.png", bg = "transparent", width = 480, height = 480, units = "px")
par(mfcol = c(2, 2))
with(electricData, plot(DateTime, Global_active_power, type = 'l', xlab = "", ylab = "Global Active Power"))
with(electricData, plot(DateTime, Sub_metering_1, type = 'l', xlab = "", ylab = "Energy sub metering"))
with(electricData, lines(DateTime, Sub_metering_2, col = "red"))
with(electricData, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, bty = 'n')
with(electricData, plot(DateTime, Voltage, type = 'l', xlab = "datetime", ylab = "Voltage"))
with(electricData, plot(DateTime, Global_reactive_power, type = 'l', xlab = "datetime", ylab = "Global_reactive_power"))
dev.off()
