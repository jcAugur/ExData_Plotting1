
#set my working directory
setwd("D:/Documents-Big/R DataScience/Course 4/Week 1")

#Libraries 
library(data.table)
library(lubridate)
library(dplyr)

# make sure the sources data folder exists
if (!file.exists('source data')) {
  dir.create('source data')
}

if (!file.exists('source data/power_consumption.txt')) {
  # download the zip file and unzip
  file.url<-'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
  download.file(file.url,destfile='source data/power_consumption.zip')
  unzip('source data/power_consumption.zip',exdir='source data',overwrite=TRUE)
}



loadData <- function() {
  read.table('source data/household_power_consumption.txt', sep=';', header=TRUE) %>%
    mutate(Date = as.Date(Date, '%d/%m/%Y')) %>%
    mutate(Time = as.POSIXct(strptime(paste(Date, ' ', Time), '%Y-%m-%d %H:%M:%S'))) %>%
    filter(Time >= strftime('2007-02-01 00:00:00'), Time < strftime('2007-02-03 00:00:00')) %>%
    tbl_df
}
data<-loadData()

#Clean the data

#set the column names
colNewNames<-c('Date','DateTime','GlobalActivePower','GlobalReactivePower','Voltage','GlobalIntensity',
        'SubMetering1','SubMetering2','SubMetering3')
colnames(data)<-colNewNames
data$GlobalActivePower

cols = c(3:7) 
data[,cols] = apply(data[,cols], 2, function(x) as.numeric(as.character(x)))

#First Plot
png(filename='Plot1.png', width=480, height=480, units='px')
hist(data$GlobalActivePower, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
dev.off()

