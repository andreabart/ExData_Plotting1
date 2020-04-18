#set the working directory
setwd("C:/Users/bartoli4/Desktop/Coursera")

#Read the data from the txt file (? coded as NA)
PowerDB<- read.table("household_power_consumption.txt",sep = ";", header = TRUE, na.strings = "?")

#create a new column as POSIXct able to be filtered and showed on chart
PowerDB$Datenew <- as.POSIXct(paste(PowerDB$Date, PowerDB$Time), format="%d/%m/%Y %H:%M:%S")

# Filter Dates for 2007-02-01 and 2007-02-03
PowerDB <- PowerDB[(PowerDB$Datenew >= "2007-02-01") & (PowerDB$Datenew <= "2007-02-03"),]

#Open a Png connection
png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

#Plot1
plot(x = PowerDB$Datenew,y = PowerDB$Global_active_power, type="l", xlab="", ylab="Global Active Power")

# Plot 2
plot(PowerDB$Datenew,PowerDB$Voltage, type="l", xlab="datetime", ylab="Voltage")

# Plot 3
plot(PowerDB$Datenew, PowerDB$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(PowerDB$Datenew, PowerDB$Sub_metering_2,col="red")
lines(PowerDB$Datenew, PowerDB$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

#Plot 4
plot(PowerDB$Datenew, PowerDB$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

#close the connection
dev.off()