setwd("E:/Coursera/2014/Getting and Cleaning Data")
source("http://d396qusza40orc.cloudfront.net/rprog%2Fscripts%2Fsubmitscript3.R")

rankhospital<-function(state,outcome,num="best"){
  ## Read outcome data
  file<-read.csv("outcome-of-care-measures.csv", colClasses = "character")
  ## Check that state and outcome are valid
  if(!state %in% unique(file[,7])) stop("invalid state")
  if(!outcome %in% c("heart attack","heart failure","pneumonia")) stop("invalid outcome")
  ## Return hospital name in that state with the given rank 30-day death rate
  if(outcome=="heart attack") n=11
  else if(outcome=="heart failure") n=17
  else n=23
  subdata=file[file[,7]==state,]
  subdata[,n]=as.numeric(subdata[,n])
  subdata=subdata[!is.na(subdata[,n]),]
  r=num
  if(num=="best") r=1
  if(num=="worst") r=max(order(subdata[,n]))
  if(num>nrow(subdata)) NA
  
  subdata[order(subdata[,n],subdata[,2]),][r,2]
  
}