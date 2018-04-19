## Getting and cleanning the data from my working directory
dataset <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")

dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")

## Subsetting the data
data <- subset(dataset, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Pasting the dates and times
datetime <- paste(as.Date(data$Date), data$Time)
data$datetime <- as.POSIXct(datetime)

## Plotting
hist(data$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving the Plot
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
