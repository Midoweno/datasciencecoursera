corr<-function(directory,threshold=0){
  id<-1:332
  listofcorrelationsornull<-lapply(id,function(x){
    df<-read.csv(file.path(directory,paste0(sprintf("%03d",x),".csv")))
    df<-na.omit(df)
    if (nrow(df)>threshold){
      cor(df[["sulfate"]],df[["nitrate"]])
    }
    ## this creates a list of correlations or Null depending on threshold
  })
  result<-unlist(listofcorrelationsornull)
  if (length(result)==0)result<-numeric(0) ##This just ensures what is returned is a vector of 0
  result 
}