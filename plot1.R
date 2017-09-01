
Data <- read.table("./household_power_consumption.txt", header=TRUE, sep = ";", stringsAsFactor = FALSE, dec = ".")
Subset <- Data[Data$Date %in% c("1/2/2007", "2/2/2007"), ]
globaleactpower <- as.numeric(Subset$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globaleactpower, col="red", main="Global Active Power", xlab="Power in kilowatts", ylab="Frequency")
dev.off()