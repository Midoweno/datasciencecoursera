library(readr)
library(readxl)

##This is the draft script
##directory<-"C:/Users/Tower 200/Downloads/rprog_data_specdata/specdata"
# don't need this line, fild.path() function finds it

pollutantmean<-function(directory,pollutant,id=1:332){
  listofpollutantvectors<-lapply(id,function(x){
    ## make sure the x is here, not id or else it will do 1:10 for x instead of 1 and iterate through
    df<-read.csv(file.path(directory,paste0(sprintf("%03d",x),".csv")))
    pollutantvector<-df[[pollutant]] ##df[[pollutant]] returns a vector anyway, so we can concise this down
    naremoved<-na.omit(pollutantvector)##na.omit(df[[pollutant]]) works too
  })
  OverallMean<-mean(unlist(listofpollutantvectors))
}
