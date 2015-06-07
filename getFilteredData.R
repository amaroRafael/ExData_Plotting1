getFilteredData <- function(filename, dates) {
    #load library
    allPackages <- installed.packages()
    list <- allPackages[,1]
    
    if (!is.element("dplyr", list)) {
        install.packages("dplyr")
    }
    library(dplyr)
    
    rm(list)
    
    #load data
    data <- read.table(filename, , header=T, sep=";",na.strings="?")
    
    data$Date <- as.Date(data$Date, "%d/%m/%Y")
    
    data <- filter(data, Date %in% dates)
    data$date_time <- strptime(as.character(paste(data$Date, data$Time, sep=" ")), "%Y-%m-%d %H:%M:%S")
    
    data
}