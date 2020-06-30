# Reading the data of only the two days required from the original dataset
twodays_subset <- read.table("household_power_consumption.txt", skip = 66637, nrows = (69518-66638),
                             sep = ";", na.strings = "?")

# Reading column names from original file and assigning them to subset
header <- colnames(read.table("household_power_consumption.txt", header = T, nrows = 1, sep = ";"))
colnames(twodays_subset) <- header

# Converting Date/Time variables to Date/Time classes
datetime <- as.POSIXct(paste(twodays_subset$Date, twodays_subset$Time), "%d/%m/%Y %H:%M:%S", tz = "UTC")

# Plot 2
png(file = "plot2.png")
plot(datetime, as.numeric(twodays_subset$Global_active_power), type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()