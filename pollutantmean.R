##this line underneath is for directly sourcing the code
##source("C:/Users/Tower 200/Documents/Coursera/datasciencecoursera/pollutantmeandraft.R")

##DRAFT SCRIPT WITH NOTES
# Before running, setwd("C:/Users/Tower 200/Downloads/rprog_data_specdata")
## don't need this line, file.path() function finds it
##For directory, you need to set it outside of the "specdata" because file.path finds
# the folder WITHIN the other folder, not looking for the NAME of it itself. It will
# will for it in your current working directory relatively

library(readr)
library(readxl)

##this line underneath is for directly sourcing the code
##source("C:/Users/Tower 200/Documents/Coursera/datasciencecoursera/pollutantmean.R")

pollutantmean<-function(directory,pollutant,id=1:332){
  listofpollutantvectors<-lapply(id,function(x){
    ## make sure the x is here, not id or else it will do 1:10 for x instead of 1 and iterate through
    df<-read.csv(file.path(directory,paste0(sprintf("%03d",x),".csv")))
    pollutantvector<-df[[pollutant]] ##df[[pollutant]] returns a vector anyway, so we can concise this down
    naremoved<-na.omit(pollutantvector)##na.omit(df[[pollutant]]) works too
  })
  OverallMean<-mean(unlist(listofpollutantvectors))
  OverallMean
  ##Also doing mean(unlist(listofpollutantvectors)) works completely fine without 
  ##the extra OverallMean variable
}
