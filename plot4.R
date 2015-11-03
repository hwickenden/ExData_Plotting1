# Read in Data
setwd("~/exdata-data-household_power_consumption")
dat <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", head = TRUE)

# Classify Date/Time Data
dat$Date <- as.Date(dat$Date, format = "%d/%m/%Y")
dat$DateTime <- strptime(paste(dat$Date, as.character(dat$Time), sep=" "), "%Y-%m-%d %H:%M:%S")

# Subset Data
power <- subset(dat, Date > "2007-01-31" & Date < "2007-02-03")

# Plot Subsetted Data as png
png("plot4.png", height = 480, width = 480)

par(mfrow=c(2,2))

# Plot (1,1)
plot(power$DateTime,
     power$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power"
)

# Plot (1,2)
plot(power$DateTime,
     power$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

# Plot (2,1)
plot(power$DateTime,
     power$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering"
)

points(power$DateTime,
       power$Sub_metering_2,
       type = "l",
       col = "red")

points(power$DateTime,
       power$Sub_metering_3,
       type = "l",
       col = "blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1,
       bty = "n")

# Plot (2,2)
plot(power$DateTime,
     power$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")

dev.off()

