pollutantmean <- function(directory, pollutant, id = 1:332) {
        #' pollutantmean calculates the mean of a sulfate or nitrate) 
        #' across a specified list of monitors.
        #' The function 'pollutantmean' takes three arguments: 
        #' directory', 'pollutant', and 'id'. 
        #' #Given a vector monitor ID numbers, 'pollutantmean' 
        #' reads that monitors' particulate matter data from the
        #' directory specified in the 'directory' argument and 
        #' returns the mean of the pollutant across all of the monitors, 
        #' ignoring any missing values coded as NA. 
        
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        ## NOTE: Do not round the result!
        
        data = numeric()
        for (i in id) {
                data_read = read.csv(paste(directory, "/", formatC(i, width = 3, flag = "0"), 
                                         ".csv", sep = ""))
                data = c(data, data_read[[pollutant]])
        }
        return(mean(data, na.rm = TRUE))
}