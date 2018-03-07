


png(filename='Plot2.png',width=480,height=480,units='px')
plot(data$DateTime,data$GlobalActivePower,
     ylab='Global Active Power (kilowatts)', 
     xlab='', 
     type='l')
dev.off()





