#set the working directory
setwd("C:/Users/bartoli4/Desktop/Coursera")

#Read the data from the txt file (? coded as NA)
PowerDB<- read.table("household_power_consumption.txt",sep = ";", header = TRUE, na.strings = "?")

# Change the Date Column from factor to Date Type
PowerDB$Date <- as.Date(PowerDB$Date,format= "%d/%m/%Y")

# Filter Dates for 2007-02-01 and 2007-02-02
PowerDB <- PowerDB[(PowerDB$Date >= "2007-02-01") & (PowerDB$Date <= "2007-02-02"),]

png("plot1.png", width=480, height=480)

## Plot 1
hist(PowerDB$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()