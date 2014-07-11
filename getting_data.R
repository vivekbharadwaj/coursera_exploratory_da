# Loading the data
colnames <- names(read.table("household_power_consumption.txt",header=TRUE,sep=";",nrows=1))

## reading 20k rows from file after estimating that 2/1 and 2/2 lie in this row range
power_data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",col.names=colnames,skip=60000,nrows=20000,comment.char="")

## concatenating time+date into time field and subsetting for 2/1 and 2/2 (unable to get sqldf read.csv2.sql working. most probably issue with R 3.1.1)
power_data$Time <- strptime(paste(power_data$Date,power_data$Time,sep=""),format="%d/%m/%Y %H:%M:%S")
power<-power_data[power_data$Time >= '2007-02-01 00:00:00' &  power_data$Time < '2007-02-03 00:00:00',2:9]

