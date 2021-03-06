data <- read.csv2("household_power_consumption.txt")
data$Date = as.Date(data$Date, "%d/%m/%Y")
data <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

data$Global_active_power = as.numeric(levels(data$Global_active_power))[data$Global_active_power]

png("plot1.png", width=480, height=480)
hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()