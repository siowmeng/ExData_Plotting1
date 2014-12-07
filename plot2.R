
## Read electricity data from the local text file residing in the working directory
electricData <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c(rep("character", 2), rep("numeric", 7)), na.strings = c("NA", "?"))
electricData$Date <- as.Date(electricData$Date, "%d/%m/%Y")

## Subset the dataframe to include only the wanted date range
electricData <- electricData[(electricData$Date >= "2007-02-01" & electricData$Date <= "2007-02-02"), ]

## Convert the datetime variables
electricData$DateTime <- paste(electricData$Date, electricData$Time)
electricData$DateTime <- strptime(electricData$DateTime, "%Y-%m-%d %H:%M:%S")

## Plot the plot2.png
png(filename = "plot2.png", bg = "transparent", width = 480, height = 480, units = "px")
with(electricData, plot(DateTime, Global_active_power, type = 'l', xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()