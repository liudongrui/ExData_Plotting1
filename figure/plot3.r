## Plot3

dataset <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
data <- subset(dataset, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
datetime <- paste(as.Date(data$Date), data$Time)
data$datetime <- as.POSIXct(datetime)

## Plotting
with(data, {plot(Sub_metering_1~datetime, type="l",ylab="Global Active Power (kilowatts)",
    xlab="")
    lines(Sub_metering_2~datetime,col='Red')
    lines(Sub_metering_3~datetime,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1",
    "Sub_metering_2", "Sub_metering_3"))
})

## Save plot3
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
