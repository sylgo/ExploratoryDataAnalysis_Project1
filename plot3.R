epc <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
epc <- epc[which(epc$Date == "1/2/2007" | epc$Date == "2/2/2007"),]
epc$Global_active_power <- as.numeric(epc$Global_active_power)
epc$Sub_metering_1 <- as.numeric(epc$Sub_metering_1)
epc$Sub_metering_2 <- as.numeric(epc$Sub_metering_2)
epc$Sub_metering_3 <- as.numeric(epc$Sub_metering_3)
epc$Date <- as.Date(epc$Date, "%d/ %m/ %Y")
epc$Time <- strptime(paste(epc$Date, epc$Time), "%Y-%m-%d %H:%M:%S")

png(file = "plot3.png")

plot(epc$Time, epc$Sub_metering_1, type="n", xlab="", ylab = "Energy sub metering") 
lines(epc$Time, epc$Sub_metering_1, type="l", col="black") 
lines(epc$Time, epc$Sub_metering_2, type="l", col="red")
lines(epc$Time, epc$Sub_metering_3, type="l", col="blue")
legend("topright", lty = c(1,1,1), col=c("black", "red", "blue"), legend = colnames(epc)[7:9])

dev.off()
