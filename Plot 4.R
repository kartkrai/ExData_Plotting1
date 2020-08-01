memory_required<- object.size(read.delim("./data/household_power_consumption.txt", sep = ";", dec = ".", header = TRUE))                  # Checking for the memory required by the dataset

data<-read.delim("./data/household_power_consumption.txt", sep = ";", dec = ".", header = TRUE)                                           # Read the data

datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")                                                           # Converting char data to date and time format
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))                                                            # Converting char data to numeric format
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))                                                        # Converting char data to numeric format
data$Voltage <- as.numeric(as.character(data$Voltage))                                                                                    # Converting char data to numeric format
data$Global_intensity <- as.numeric(as.character(data$Global_intensity))                                                                  # Converting char data to numeric format
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))                                                                      # Converting char data to numeric format
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))                                                                      # Converting char data to numeric format
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))                                                                      # Converting char data to numeric format

subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]                                                                             # Subsetting data iin accordance to the date criteria


png("plot4.png", width=480, height=480)                                                                                                   # Setting PNG Plot dimensions
par(mfrow = c(2, 2))                                                                                                                      # Setting plotting frame of 2 rows, 2 columns

plot(datetime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)                                          # Plotting Graph

plot(datetime, data$Voltage, type="l", xlab="datetime", ylab="Voltage")                                                                   # Plotting Graph

plot(datetime, data$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")                                                         # Plotting Graph
lines(datetime, data$Sub_metering_2, type="l", col="red")                                                                                 # Drawing lines for Marking
lines(datetime, data$Sub_metering_3, type="l", col="blue")                                                                                # Drawing lines for Marking
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")        # Marking Legends

plot(datetime, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")                                       # Plot the 4th graph
dev.off()                                                                                                                                 # Turning Device off