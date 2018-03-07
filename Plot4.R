

## Create Plot 4
png(filename='Plot4.png',width=480,height=480,units='px')

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
  plot(GlobalActivePower~DateTime, 
       type="l", 
       ylab="Global Active Power (kilowatts)", 
       xlab="")
  
  plot(Voltage~DateTime, 
       type="l", 
       ylab="Voltage (volt)", 
       xlab="")
  
  plot(SubMetering1~DateTime, 
       type="l", 
       ylab="Global Active Power (kilowatts)", 
       xlab="")
  lines(SubMetering2~DateTime,col='Red')
  lines(SubMetering3~DateTime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), 
        lty=1, 
        lwd=2, 
        bty="n",
        legend=c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"))
  
  plot(GlobalReactivePower~DateTime, 
       type="l", 
       ylab="Global Rective Power (kilowatts)",
       xlab="")
})

dev.off()