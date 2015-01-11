# Read in the dataset
powerConsumption <- read.table("./Data/household_power_consumption.txt",
                               header = TRUE,
                               sep = ";",
                               na.strings = c("?"),
                               colClasses = c("character", "character", rep("numeric", 5 )))


#Filter to days of interest : 2007-02-01 and 2007-02-02
powerConsumption <- subset(powerConsumption, powerConsumption$Date %in% c("1/2/2007", "2/2/2007"))

# Create the PNG image
png("./ExData_Plotting1/plot1.png", width = 480, height = 480)

# Generate the plot of Global Active Power

hist(powerConsumption$Global_active_power,
     col="red",
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power")

# Close the PNG
dev.off()
