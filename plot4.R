## Reading the data
data <- read.table("./household_power_consumption.txt", nrows = 2075259, header = TRUE, sep = ";", stringsAsFactors = FALSE)

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subset the data
filterData <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)

## Convert dates
datetime <- paste(as.Date(filterData$Date), filterData$Time)
filterData$datetime <- as.POSIXct(datetime)
rm(datetime)

## PLOT 4
png("plot4.png", width = 480, height = 480, units = "px") 

par(mfrow = c(2,2))

plot(filterData$datetime,as.numeric(filterData$Global_active_power), type ="l", xlab = "", ylab = "Global Active Power (kilowatts)")

plot(filterData$datetime,as.numeric(filterData$Voltage), type ="l", xlab = "datetime", ylab = "Voltage")

with(filterData, {
        plot(datetime,as.numeric(Sub_metering_1), type = "l",xlab = "", ylab = "Energy sub metering")
        lines(datetime,as.numeric(filterData$Sub_metering_2), col = "Red")
        lines(datetime,as.numeric(filterData$Sub_metering_3), col = "Blue")
})
legend("topright",col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(filterData$datetime,as.numeric(filterData$Global_reactive_power), type ="l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
