#set the working directory
setwd("C:/Users/bartoli4/Desktop/Coursera")

#Read the data from the txt file (? coded as NA)
PowerDB<- read.table("household_power_consumption.txt",sep = ";", header = TRUE, na.strings = "?")

PowerDB$Datenew <- as.POSIXct(paste(PowerDB$Date, PowerDB$Time), format="%d/%m/%Y %H:%M:%S")

# Filter Dates for 2007-02-01 and 2007-02-02
PowerDB <- PowerDB[(PowerDB$Datenew >= "2007-02-01") & (PowerDB$Datenew <= "2007-02-03"),]

png("plot2.png", width=480, height=480)

## Plot 2
plot(x = PowerDB$Datenew
     , y = PowerDB$Global_active_power
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()