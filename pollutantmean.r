pollutantmean <- function(directory, pollutant = "sulfate", id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  
  # create a empty vector 
  allCsvData <- c()
  # find all files in the specdata folder
  files <- as.character( list.files("./specdata/") )
  #set the directory 'specdata'
  setwd("./specdata/")
  #loop the id vector to read relevant files
  for(i in id) {
    csv_data <- read.csv(files[i], header=TRUE, sep=",")
    #push only those data with is not NA
    allCsvData <- c(allCsvData,  csv_data[!is.na(csv_data[, pollutant]), pollutant])
  }
  #return to previous directory
  setwd("../")
  # add the mean of result
  return(round(mean(allCsvData), 3)) 
}