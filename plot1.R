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

# Plot 1
png(file= "plot1.png", width = 480, height = 480)# Make pdf of the plots that follow
hist(as.numeric(as.character(Global_active_power)), col = "red", 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off() 
