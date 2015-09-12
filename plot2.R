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

## PLOT 2
png("plot2.png", width = 480, height = 480, units = "px") 

plot(filterData$datetime,as.numeric(filterData$Global_active_power), type ="l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()
