# Reading the data of only the two days required from the original dataset
twodays_subset <- read.table("household_power_consumption.txt", skip = 66637, nrows = (69518-66638),
                             sep = ";", na.strings = "?")

# Reading column names from original file and assigning them to subset
header <- colnames(read.table("household_power_consumption.txt", header = T, nrows = 1, sep = ";"))
colnames(twodays_subset) <- header

# Converting Date/Time variables to Date/Time classes
datetime <- as.POSIXct(paste(twodays_subset$Date, twodays_subset$Time), "%d/%m/%Y %H:%M:%S", tz = "UTC")

# Plot 3
png(file = "plot3.png")
plot(datetime, as.numeric(twodays_subset$Sub_metering_1), type = "l", xlab = "",
     ylab = "Energy sub metering", col = "black")
points(datetime, as.numeric(twodays_subset$Sub_metering_2), type = "l", col = "red")
points(datetime, as.numeric(twodays_subset$Sub_metering_3), type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1, col = c("black", "red", "blue"))
dev.off()