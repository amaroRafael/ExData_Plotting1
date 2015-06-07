plot4 <- function(filename) {
    #load source
    if (sum(list.files("./") == "getFilteredData.R") == 0)
        stop("File is required, getFilteredData.R not found.")
    
    source("./getFilteredData.R")
    
    #load data
    data <- getFilteredData(filename, as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d"))
    
    png("./plot4.png", width=480, height=480)
    
    par(mfrow=c(2,2))
    par('mar'=c(5.1,4.1,1.1,1.1))
    
    #p1
    plot(data$date_time,data$Global_active_power,type='l',xlab="", ylab="GLobal Active Power")
    
    #p2
    plot(data$date_time,data$Voltage,type='l',xlab='datetime',ylab='Voltage')
    
    #p3
    plot(data$date_time,data$Sub_metering_1, type='l', xlab='', ylab='Energy sub metering')
    points(data$date_time,data$Sub_metering_2, type='l', col='red')
    points(data$date_time,data$Sub_metering_3, type='l', col='blue')
    legend("topright", legend=c('Sub_metering_1', 'Sub_metering_2','Sub_metering_3'), col=c('black','red','blue'),lty=1,bty="n")
    
    #p4
    plot(data$date_time,data$Global_reactive_power,type='l',xlab='datetime', ylab='Global_reactive_power')    
    
    rm(data)
    
    dev.off()
}