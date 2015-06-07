plot2 <- function(filename) {
    #load source
    if (sum(list.files("./") == "getFilteredData.R") == 0)
        stop("File is required, getFilteredData.R not found.")
    
    source("./getFilteredData.R")
    
    #load data
    data <- getFilteredData(filename, as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d"))
    
    png("./plot2.png", width=480, height=480)
    
    plot(data$date_time, data$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")
    
    rm(data)
    
    dev.off()
}