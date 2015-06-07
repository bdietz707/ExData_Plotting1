data <- read.csv2("household_power_consumption.txt")
data$Date = as.Date(data$Date, "%d/%m/%Y")
data <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

data$Global_active_power = as.numeric(levels(data$Global_active_power))[data$Global_active_power]

data$DateTime = strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
png("plot2.png", width=480, height=480)
plot(data$DateTime, data$Global_active_power, xlab= "", ylab="Global Active Power(kilowatts)", type="l")
dev.off()