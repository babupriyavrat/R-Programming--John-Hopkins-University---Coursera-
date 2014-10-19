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
  
  
  # create a empty vector 
  result <- c()
  # find all files in the specdata folder
  files <- as.character( list.files("./specdata/") )
  #set the directory 'specdata'
  setwd("./specdata")
  #loop the id vector to read relevant files
  j<-1
  for(i in id) {
    #read the csv files
    csv_data <- read.csv(files[i], header=TRUE, sep=",")
    #omit all the rows with value 'NA'
    #user can alternatively use complete.cases()
    result[j]<-nrow(na.omit(csv_data))
    j<-j+1
  }
  #map the id to counts of rows in each file which are complete.
  result2 <- data.frame(id = id, nobs = result)
  setwd("../")  
  #set the result
  return(result2)
} 