library(dplyr)

setwd("C:\\Users\\savet\\OneDrive\\Documenti\\R\\Esercizi")

overall      <- read.delim("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, header = TRUE, na.strings = "?")

overall$Date <- as.Date(overall$Date, format = "%d/%m/%Y") 

dataset <- overall %>% filter(Date=="2007-02-01" | Date=="2007-02-02") 

#####PLOT3
plot(dataset$Time, dataset$Sub_metering_1, xlab = "", ylab = "Energy sub metering", col = "black", type = "l", lty = 1)
lines(dataset$Time, dataset$Sub_metering_2, col = "red", type = "l", lty = 1)
lines(dataset$Time, dataset$Sub_metering_3, col = "blue", type = "l", lty = 1)
legend("topright", pch = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 1, lty = 1)

dev.copy(png, file="plot3.png")
dev.off()