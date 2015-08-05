pollutantmean <- function(directory, pollutant, id = 1:332) {
        #' pollutantmean calculates the mean of a sulfate or nitrate) 
        #' across a specified list of monitors.
        #' The function 'pollutantmean' takes three arguments: 
        #' directory', 'pollutant', and 'id'. 
        #' #Given a vector monitor ID numbers, 'pollutantmean' 
        #' reads that monitors'" particulate matter data from the
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
        dat = numeric()
        #load all the files in specdata directory in a list file_list
        files_list <- list.files(directory, full.names = TRUE)
        #all_pollutant_files <- lapply(files_list, read.csv)
        for (i in id) {
                #read id(files) into a new list variable data_read that the 
                #user has input to calculate the mean on for a partuclar pollutant
                data_read <- lapply(files_list[i], read.csv)
                #bind all the rows of the slelected files in a new data frame variable called 'data'
                data <- do.call(rbind, data_read)
                # Create a new variable dat of type numeric vector that will store the 
                # amount of input "pollutant" for the particular monitor(file)
                dat <- c(dat, data[[pollutant]])
        }
        #return the mean of the selected monitor and pollutnat list after removing the NA values
        return(mean(dat, na.rm = TRUE))
}
