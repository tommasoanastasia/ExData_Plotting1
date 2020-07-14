library(dplyr)

setwd("C:\\Users\\savet\\OneDrive\\Documenti\\R\\Esercizi")

overall      <- read.delim("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, header = TRUE, na.strings = "?")

overall$Date <- as.Date(overall$Date, format = "%d/%m/%Y") 

dataset <- overall %>% filter(Date=="2007-02-01" | Date=="2007-02-02") 

#####PLOT1
hist(dataset$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.copy(png, file="plot1.png")
dev.off()







