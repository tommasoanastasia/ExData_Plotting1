library(dplyr)

setwd("C:\\Users\\savet\\OneDrive\\Documenti\\R\\Esercizi")

overall      <- read.delim("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, header = TRUE, na.strings = "?")

overall$Date <- as.Date(overall$Date, format = "%d/%m/%Y") 

dataset <- overall %>% filter(Date=="2007-02-01" | Date=="2007-02-02") 

####PLOT4
par(mfrow = c(2,2))
plot(dataset$Time, dataset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(dataset$Time, dataset$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(dataset$Time, dataset$Sub_metering_1, xlab = "", ylab = "Energy sub metering", col = "black", type = "l", lty = 1)
lines(dataset$Time, dataset$Sub_metering_2, col = "red", type = "l", lty = 1)
lines(dataset$Time, dataset$Sub_metering_3, col = "blue", type = "l", lty = 1)
legend("topright", pch = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       cex = 0.7, bty = "n")
plot(dataset$Time, dataset$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.copy(png, file="plot4.png")
dev.off()