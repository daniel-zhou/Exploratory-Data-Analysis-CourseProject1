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
dataset$Global_active_power <- as.numeric(dataset$Global_active_power)

# plot
png(filename = "plot1.png", height = 480, width = 480)
hist(dataset$Global_active_power, main = "Global Active Power", col='red', xlab = 'Global Active Power(kilowatts)')        
dev.off()