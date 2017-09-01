Data <- read.table("./household_power_consumption.txt", header=TRUE, sep = ";", stringsAsFactor = FALSE, dec = ".")
Subset <- Data[Data$Date %in% c("1/2/2007", "2/2/2007"), ]

datetime <- strptime(paste(Subset$Date, Subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globaleactpower <- as.numeric(Subset$Global_active_power)
globalreactpower <- as.numeric(Subset$Global_reactive_power)
volt <- as.numeric(Subset$Voltage)

Sub_metering_1 <- as.numeric(Subset$Sub_metering_1)
Sub_metering_2 <- as.numeric(Subset$Sub_metering_2)
Sub_metering_3 <- as.numeric(Subset$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

plot(datetime, globaleactpower, type="l", ylab="Global Active Power", xlab="", cex=0.2)
plot(datetime, volt, type="l", xlab="dattime", ylab="Voltage")
plot(datetime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")

lines(datetime, Sub_metering_2, type="l", col="red")
lines(datetime, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalreactpower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()




