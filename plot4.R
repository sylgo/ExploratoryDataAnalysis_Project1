epc <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
epc <- epc[which(epc$Date == "1/2/2007" | epc$Date == "2/2/2007"),]
epc$Global_active_power <- as.numeric(epc$Global_active_power)
epc$Global_reactive_power <- as.numeric(epc$Global_reactive_power)
epc$Voltage <- as.numeric(epc$Voltage)
epc$Sub_metering_1 <- as.numeric(epc$Sub_metering_1)
epc$Sub_metering_2 <- as.numeric(epc$Sub_metering_2)
epc$Sub_metering_3 <- as.numeric(epc$Sub_metering_3)
epc$Date <- as.Date(epc$Date, "%d/ %m/ %Y")
epc$Time <- strptime(paste(epc$Date, epc$Time), "%Y-%m-%d %H:%M:%S")

png(file = "plot4.png")

par(mfcol = c(2,2))
with(epc,{
  
  plot(Time, Global_active_power, type="n", xlab="", ylab = "Global Active Power (kilowatts)") 
  lines(Time, Global_active_power, type="l") 
  
  plot(Time, Sub_metering_1, type="n", xlab="", ylab = "Energy sub metering") 
  lines(Time, Sub_metering_1, type="l", col="black") 
  lines(Time, Sub_metering_2, type="l", col="red")
  lines(Time, Sub_metering_3, type="l", col="blue")
  legend("topright", lty = c(1,1,1), col=c("black", "blue", "red"), legend = colnames(epc)[7:9])

  plot(Time, Voltage, type="n", xlab="datetime") 
  lines(Time, Voltage, type="l") 
  
  plot(Time, Global_reactive_power, type="n", xlab="datetime") 
  lines(Time, Global_reactive_power, type="l") 
  
})

dev.off()
