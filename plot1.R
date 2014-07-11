# Call function to get power data for 2/1 and 2/2
source("getting_data.R")

# create plot 1 png file
png(filename="plot1.png",width = 480, height = 480, units = "px")

# create histogram for global active power (imported as numeric already)
hist(power$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()