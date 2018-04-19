## Plot4

dataset <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
data <- subset(dataset, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
datetime <- paste(as.Date(data$Date), data$Time)
data$datetime <- as.POSIXct(datetime)

## Changing the global environment
par(mfrow=c(2,2), mar=c(3,3,2,1))

## Plotting
with(data, {
    plot(Global_active_power~datetime, type="l", ylab="Global Active Power (kilowatts)",
    xlab="")
    plot(Voltage~datetime, type="l", ylab="Voltage (volt)", xlab="")
    plot(Sub_metering_1~datetime, type="l", ylab="Global Active Power (kilowatts)",
    xlab="")
    lines(Sub_metering_2~datetime,col='Red')
    lines(Sub_metering_3~datetime,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~datetime, type="l",
         ylab="Global Rective Power (kilowatts)",xlab="")
})

## Saving plot4
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
