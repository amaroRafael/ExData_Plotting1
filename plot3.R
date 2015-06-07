plot3 <- function(filename) {
    #load source
    if (sum(list.files("./") == "getFilteredData.R") == 0)
        stop("File is required, getFilteredData.R not found.")
    
    source("./getFilteredData.R")
    
    #load data
    data <- getFilteredData(filename, as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d"))
    
    png("./plot3.png", width=480, height=480)
    
    plot(data$date_time,data$Sub_metering_1, type='l', xlab='', ylab='Energy sub metering')
    points(data$date_time,data$Sub_metering_2, type='l', col='red')
    points(data$date_time,data$Sub_metering_3, type='l', col='blue')
    legend("topright", legend=c('Sub_metering_1', 'Sub_metering_2','Sub_metering_3'), col=c('black','red','blue'),lty=1, cex=0.7)    

    rm(data)
    
    dev.off()
}