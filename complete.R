##For directory, you need to set it outside of the "specdata" because file.path finds
# the folder WITHIN the other folder, not looking for the NAME of it itself. It will
# will for it in your current working directory relatively

#setwd("C:/Users/Tower 200/Downloads/rprog_data_specdata")

library(readr)
library(readxl)

##this line underneath is for directly sourcing the code
##source("C:/Users/Tower 200/Documents/Coursera/datasciencecoursera/complete.R")
##Honestly with source on save we don't even need this, just check if off and hit source on save


complete<-function(directory,id=1:332){
  mylist<-lapply(id,function(x){
    ## make sure the x is here, not id or else it will do 1:10 for x instead of 1 and iterate through
    df<-read.csv(file.path(directory,paste0(sprintf("%03d",x),".csv")))
    ##Idea is remove all rows with na values, then use nrow() to return
    ##<-c(x,nrow(df)) Doesn't work we need to return a df
    ##Now we have a df returned w/o na values for whatever csv file id was
    ##BELOW LEFT OFF, WE NEED TO CHANGE IT SO INSTEAD OF LIST OF DF RETURNED, IT RETURNS 1 DF WITH ALL THE INFO WE NEEDED, SO FIND A WAY TO STORE IT IN THE SAME DATAFRAME
    NumberofCompleted<-nrow(na.omit(df))
    ##This creates number of completed, which we will then put into our dataframe.
    data.frame(id=x,nobs=NumberofCompleted)
  })
  do.call(rbind,mylist)
  
## So listofdf object returns a list of df w/o NA values
  
}