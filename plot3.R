# download the dataset zip file
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
dataSetFile <- "./data.zip"
download.file(fileUrl, dataSetFile)

# unzip the dataset zip file
unzip(dataSetFile, overwrite = TRUE)

# load data
dataFile <- "household_power_consumption.txt"
pc_data <- read.table(dataFile, header = TRUE, sep = ";", stringsAsFactors = FALSE)

# subset data
pc_data$Date <- as.Date(pc_data$Date, "%d/%m/%Y")
dataset <- pc_data[pc_data["Date"] =="2007-02-01" | pc_data["Date"] == "2007-02-02",]

# prepare data for plot
dataset$DateTime <- paste(dataset$Date, dataset$Time)
dataset$DateTime <- strptime(dataset$DateTime, "%Y-%m-%d %H:%M:%S") 
dataset$Sub_metering_1 <- as.numeric(dataset$Sub_metering_1)
dataset$Sub_metering_2 <- as.numeric(dataset$Sub_metering_2)
dataset$Sub_metering_3 <- as.numeric(dataset$Sub_metering_3)

# plot
png(filename = "plot3.png", height = 480, width = 480)
plot(dataset$DateTime, dataset$Sub_metering_1, "l", xlab = "", ylab = "Energy sub metering")
lines(dataset$DateTime, dataset$Sub_metering_2, col='red')
lines(dataset$DateTime, dataset$Sub_metering_3, col='blue')
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()