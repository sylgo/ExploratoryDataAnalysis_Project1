epc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE)
epc <- epc[which(epc$Date == "1/2/2007" | epc$Date == "2/2/2007"),]
epc$Global_active_power <- as.numeric(epc$Global_active_power)

png(file = "plot1.png")

hist(epc$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main = "Global Active Power")

dev.off()