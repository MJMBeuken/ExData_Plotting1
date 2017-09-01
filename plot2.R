Data <- read.table("./household_power_consumption.txt", header=TRUE, sep = ";", stringsAsFactor = FALSE, dec = ".")
Subset <- Data[Data$Date %in% c("1/2/2007", "2/2/2007"), ]

datetime <- strptime(paste(Subset$Date, Subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globaleactpower <- as.numeric(Subset$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globaleactpower, type="l", xlab="Weekdays", ylab="Power in kilowatts")
dev.off()

