setwd("E:/Coursera/2014/Getting and Cleaning Data")
source("http://d396qusza40orc.cloudfront.net/rprog%2Fscripts%2Fsubmitscript3.R")

rankall<-function(outcome, num="best"){
  ## Read outcome data
  file<-read.csv("outcome-of-care-measures.csv", colClasses = "character")
  ## Check that state and outcome are valid
  if(!outcome %in% c("heart attack","heart failure","pneumonia")) stop("invalid outcome")
  ## For each state, find the hospital of the given rank
  if(outcome=="heart attack") n=11
  else if(outcome=="heart failure") n=17
  else n=23
  r=num
  if(num=="best") r=1  
  
  state<-unique(file[,7])
  result<-numeric()
  for(i in state){
    subdata<-file[file[,7]==i,]
    subdata[,n]=as.numeric(subdata[,n])
    subdata=subdata[!is.na(subdata[,n]),]
    if(num=="worst") r=nrow(subdata)
    if(num>nrow(subdata)) hospital=NA
    hospital=subdata[order(subdata[,n],subdata[,2]),][r,2]
    result<-rbind(result,c(hospital,i))
  }
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name  
  result<-data.frame(result)
  names(result)<-c("hospital","state")
  result[order(result[,2]),]
  
}