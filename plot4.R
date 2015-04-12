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

#Fixing the date
good$datetime <- paste(good$Date, good$Time)
good$datetime <- strptime(good$datetime, format = "%d/%m/%Y %H:%M:%S")

#Setting up the panels
with(good, {
  par(mar = c(4, 4, 2, 2))
  par(mfrow = c(2,2))
  plot(datetime, Global_active_power, type = "n", xlab = "", 
       ylab = "Global Active Power (kilowatts)")
  lines(datetime, Global_active_power)
  
  plot(datetime, Voltage, type = "n", ylab = "Voltage")
  lines(datetime, Voltage)
  
  plot(datetime, Sub_metering_1, type = "n", xlab = "", 
       ylab = "Energy sub metering")
  lines(datetime, Sub_metering_1)
  lines(datetime, Sub_metering_2, col = "red")
  lines(datetime, Sub_metering_3, col = "blue")
  legend("topright", pch = "---", col = c("black", "red", "blue"), 
         legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"))
  
  plot(datetime, Global_reactive_power, type = "n")
  lines(datetime, Global_reactive_power)
})

