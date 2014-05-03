setwd("E:/Coursera/2014/Getting and Cleaning Data")
source("http://d396qusza40orc.cloudfront.net/rprog%2Fscripts%2Fsubmitscript3.R")
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)

outcome[,11]<-as.numeric(outcome[,11])
hist(outcome[,11])

best<-function(state,outcome){
  ## Read outcome data
  file<-read.csv("outcome-of-care-measures.csv", colClasses = "character")
  ## Check that state and outcome are valid
  if(!state %in% unique(file[,7])) stop("invalid state")
  if(!outcome %in% c("heart attack","heart failure","pneumonia")) stop("invalid outcome")
  ## Return hospital name in that state with lowest 30-day death rate
  if(outcome=="heart attack") n=11
  else if(outcome=="heart failure") n=17
  else n=23
  subdata=file[file[,7]==state,]
  result=subdata[which.min(as.numeric(subdata[,n])),2]
  if(length(result)>1) sort(result)
  else result
}