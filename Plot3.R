

## Create Plot 3
png(filename='Plot3.png',width=480,height=480,units='px')
with(data, {
  plot(SubMetering1~DateTime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(SubMetering2~DateTime,col='Red')
  lines(SubMetering3~DateTime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
       c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"))

dev.off()