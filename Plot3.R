Data <- read.table("./household_power_consumption.txt", header=TRUE, sep = ";", stringsAsFactor = FALSE, dec = ".")
Subset <- Data[Data$Date %in% c("1/2/2007", "2/2/2007"), ]

datetime <- strptime(paste(Subset$Date, Subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globaleactpower <- as.numeric(Subset$Global_active_power)

Sub_metering_1 <- as.numeric(Subset$Sub_metering_1)
Sub_metering_2 <- as.numeric(Subset$Sub_metering_2)
Sub_metering_3 <- as.numeric(Subset$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, Sub_metering_1, type="l", ylab="Energy Sub metering", xlab="Weekdays")

lines(datetime, Sub_metering_2, type="l", col="red")
lines(datetime, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()

