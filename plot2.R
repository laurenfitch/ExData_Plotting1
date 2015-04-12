# Read in data
data <- read.table("household_power_consumption.txt", sep = ";", 
                   header = TRUE, as.is = TRUE)
smalldata <- data[data$Date == "1/2/2007", ]
smalldata2 <- data[data$Date == "2/2/2007", ]
good <- rbind(smalldata, smalldata2)

# Change these columns to numeric data types
good$Global_active_power <- as.numeric(good$Global_active_power)
good$Sub_metering_1 <- as.numeric(good$Sub_metering_1)
good$Sub_metering_2 <- as.numeric(good$Sub_metering_2)
good$Sub_metering_3 <- as.numeric(good$Sub_metering_3)
good$Voltage <- as.numeric(good$Voltage)
good$Global_reactive_power <- as.numeric(good$Global_reactive_power)

good$datetime <- paste(good$Date, good$Time)
good$datetime <- strptime(good$datetime, format = "%d/%m/%Y %H:%M:%S")

png(file = "plot2.png", width = 480, height = 480, units = "px")

plot(good$datetime, good$Global_active_power, type = "n", xlab = "", 
     ylab = "Global Active Power (kilowatts)")
lines(good$datetime, good$Global_active_power)

dev.off()
