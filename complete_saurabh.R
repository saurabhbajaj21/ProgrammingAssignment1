complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
        #nobs is a numeric data type to store the no. of observations
        nobs = numeric()
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
                nobs <- c(nobs, sum(complete.cases(data)))
        } 
        return(data.frame(id, nobs))
}