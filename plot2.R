# Read in Data
setwd("~/exdata-data-household_power_consumption")
dat <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", head = TRUE)

# Classify Date/Time Data 
dat$Date <- as.Date(dat$Date, format = "%d/%m/%Y")
dat$DateTime <- strptime(paste(dat$Date, as.character(dat$Time), sep=" "), "%Y-%m-%d %H:%M:%S")

# Subset Data
power <- subset(dat, Date > "2007-01-31" & Date < "2007-02-03")

# Plot Subsetted Data as png
png("plot2.png", height = 480, width = 480)

plot(power$DateTime,
     power$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)"
     )

dev.off()

