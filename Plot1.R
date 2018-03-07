

#First Plot
png(filename='Plot1.png', width=480, height=480, units='px')
hist(data$GlobalActivePower, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
dev.off()