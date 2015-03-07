epc <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
epc <- epc[which(epc$Date == "1/2/2007" | epc$Date == "2/2/2007"),]
epc$Global_active_power <- as.numeric(epc$Global_active_power)
epc$Date <- as.Date(epc$Date, "%d/ %m/ %Y")
epc$Time <- strptime(paste(epc$Date, epc$Time), "%Y-%m-%d %H:%M:%S")

png(file = "plot2.png")

plot(epc$Time, epc$Global_active_power, type="n", xlab="", ylab = "Global Active Power (kilowatts)") 
lines(epc$Time, epc$Global_active_power, type="l") 

dev.off()