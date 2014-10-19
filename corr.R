corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
   # find all files in the specdata folder
  files <- as.character( list.files("./specdata/") )
  #set the direcoctory 'specdata'
  setwd("./specdata")
   # create a empty vector 
  corr_vector <- c()
  j <-1
  for(i in 1:332) {
    csv_data <- read.csv(files[i], header=TRUE, sep=",")
    naremoved <- na.omit(csv_data)
    if (nrow(naremoved)>threshold){
    corr_vector[j]<- cor(naremoved$sulfate, naremoved$nitrate, use="complete.obs")
    j <-j+1
    }
  }
  setwd("../") 
  result<-corr_vector
  return(result)
}

