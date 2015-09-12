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

## PLOT 3
png("plot3.png", width = 480, height = 480, units = "px") 

with(filterData, {
        plot(datetime,as.numeric(Sub_metering_1), type = "l",xlab = "", ylab = "Energy sub metering")
        lines(datetime,as.numeric(filterData$Sub_metering_2), col = "Red")
        lines(datetime,as.numeric(filterData$Sub_metering_3), col = "Blue")
})
legend("topright",col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
