# Read in the dataset
powerConsumption <- read.table("./Data/household_power_consumption.txt",
                               header = TRUE,
                               sep = ";",
                               na.strings = c("?"),
                               colClasses = c("character", "character", rep("numeric", 5 )))


#Filter to days of interest : 2007-02-01 and 2007-02-02
powerConsumption <- subset(powerConsumption, powerConsumption$Date %in% c("1/2/2007", "2/2/2007"))

#Combine date & time
powerConsumption$DateTime <- strptime(paste(powerConsumption$Date, powerConsumption$Time), "%d/%m/%Y %H:%M:%S") 


# Create the PNG image
png("./ExData_Plotting1/plot4.png", width = 480, height = 480)

# Need 4 base plots in 2x2 matrix

par(mfrow = c(2, 2))

# 1. Generate the plot of Global Active Power

plot(powerConsumption$DateTime,
     powerConsumption$Global_active_power,
     type="l",
     xlab = "",
     ylab="Global Active Power")

# 2. Generate the plot of Voltage

plot(powerConsumption$DateTime,
     powerConsumption$Voltage,
     type="l",
     xlab="datetime",
     ylab="Voltage")

# 3. Generate the plot of Sub_metering_1

plot(powerConsumption$DateTime,
     powerConsumption$Sub_metering_1,
     type="l",
     xlab = "",
     ylab="Energy sub metering")

# Add Sub_metering_2 in red
lines(powerConsumption$DateTime, powerConsumption$Sub_metering_2, col = "red")

# Add Sub_metering_2 in red
lines(powerConsumption$DateTime, powerConsumption$Sub_metering_3, col = "blue")

# Add the legend
legend("topright",
       col = c("black", "red", "blue"),
       lty = 1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


# 3. Generate the plot of Global_reactive_power

plot(powerConsumption$DateTime,
     powerConsumption$Global_reactive_power,
     type="l",
     xlab = "datetime",
     ylab="Global_reactive_power")

# Close the PNG
dev.off()
