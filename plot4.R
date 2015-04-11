# Coursera course Project1
# Exploratory Data Analysis
# ==================================================

elect <- read.csv2("household_power_consumption.txt", na.strings = "?") # The separator is ;

head(elect)

# Use only data from the dates 2007-02-01 and 2007-02-02
electsubset <- rbind(subset(elect, as.Date(Date, format="%d/%m/%Y") == as.Date("2007-02-01")), subset(elect, as.Date(Date, format="%d/%m/%Y") == as.Date("2007-02-02")))

# Put the date and hour toguether
Fulldate_col <- paste(electsubset$Date, electsubset$Time)
Fulldate <- strptime(Fulldate_col, "%d/%m/%Y %H:%M:%S")
head(Fulldate)

# Add it to the rest of the data
finalelect <- cbind(electsubset, Fulldate)
head(finalelect)

attach(finalelect)

# Plot 4
png(file= "plot4.png", width = 480, height = 480) # Make pdf of the plots that follow
par(mfrow = c(2, 2))
plot(Fulldate, as.numeric(as.character(Global_active_power)), type = "l",
     ylab = "Global Active Power", xlab = "")

plot(Fulldate, as.numeric(as.character(Voltage)), type = "l", 
     ylab = "Voltage", xlab = "datetime")

plot(Fulldate, as.numeric(as.character(Sub_metering_1)), type = "n",
     ylab = "Energy sub metering")
lines(Fulldate, as.numeric(as.character(Sub_metering_1)))
lines(Fulldate, as.numeric(as.character(Sub_metering_2)), col = "red")
lines(Fulldate, as.numeric(as.character(Sub_metering_3)), col = "blue")
legend("topright", lty = 1, col = c("black", "blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n") # bty = "n" to remove the box of the legend

plot(Fulldate, as.numeric(as.character(Global_reactive_power)), type = "l", 
     ylab = "Global_reactive_power", xlab = "datetime")
dev.off()