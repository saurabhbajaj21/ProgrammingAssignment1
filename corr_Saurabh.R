corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        ## Return a numeric vector of correlations
        ## NOTE: Do not round the result!
        
        df = complete(directory)
        ids = df[df["nobs"] > threshold, ]$id
        corrr = numeric()
        for (i in ids) {
                
                data_read <- lapply(files_list[ids], read.csv)
                #bind all the rows of the slelected files in a new data frame variable called 'data'
                data <- do.call(rbind, data_read)
                # Create a new variable dat of type numeric vector that will store the 
                # amount of input "pollutant" for the particular monitor(file)
                dff = data[complete.cases(data), ]
                corrr = c(corrr, cor(dff$sulfate, dff$nitrate))
        }
        return(corrr)
}