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

png(file = "plot1.png", width = 480, height = 480, units = "px")

hist(good$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")

dev.off()
