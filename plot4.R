data <- read.csv2("household_power_consumption.txt")
data$Date = as.Date(data$Date, "%d/%m/%Y")
data <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

data$Sub_metering_1 = as.numeric(levels(data$Sub_metering_1))[data$Sub_metering_1]
data$Sub_metering_2 = as.numeric(levels(data$Sub_metering_2))[data$Sub_metering_2]
data$Sub_metering_3 = as.numeric(levels(data$Sub_metering_3))[data$Sub_metering_3]
data$Global_active_power = as.numeric(levels(data$Global_active_power))[data$Global_active_power]
data$Global_reactive_power = as.numeric(levels(data$Global_reactive_power))[data$Global_reactive_power]
data$Voltage = as.numeric(levels(data$Voltage))[data$Voltage]

data$DateTime = strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(data$DateTime, data$Global_active_power, xlab= "", ylab="Global Active Power", type="l")
plot(data$DateTime, data$Voltage, xlab= "datetime", ylab="Voltage", type="l")
plot(data$DateTime, c(data$Sub_metering_1), xlab= "", ylab="Energy sub metering", type="l")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n", lty=1, lwd=2.5, col=c("black", "red", "blue"))
plot(data$DateTime, data$Global_reactive_power, xlab= "datetime", ylab="Global_reactive_power", type="l")

dev.off()