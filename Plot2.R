library(dplyr)

setwd("C:\\Users\\savet\\OneDrive\\Documenti\\R\\Esercizi")

overall      <- read.delim("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, header = TRUE, na.strings = "?")

overall$Date <- as.Date(overall$Date, format = "%d/%m/%Y") 

dataset <- overall %>% filter(Date=="2007-02-01" | Date=="2007-02-02") 

#####PLOT2 
dataset$Time <- paste(dataset$Date, dataset$Time)
dataset$Time <- strptime(dataset$Time, format = "%Y-%m-%d %H:%M:%S")
plot(dataset$Time, dataset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.copy(png, file="plot2.png")
dev.off()