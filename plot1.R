plot1 <- function(filename) {
    #load source
    if (sum(list.files("./") == "getFilteredData.R") == 0)
        stop("File is required, getFilteredData.R not found.")
    
    source("./getFilteredData.R")
    
    #load data
    data <- getFilteredData(filename, as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d"))
    
	png("./plot1.png", width=480, height=480)
	
	hist(data$Global_active_power,
        main="Global Active Power",
        xlab="Global Active Power (kilowatts)",
        ylab="Frequency",
        col="red"
    )
    
    rm(data)

    dev.off()
}