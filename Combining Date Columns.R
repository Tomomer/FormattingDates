#How to combine two date columns with different formats

#Step 1) Importing data and load the necessary packages
setwd("C:/Users/tsuwa/Desktop")
df<-read.csv("Date3.csv")#Do not open csv file in Excel- it'll mess up the formate of your date columns 
library(lubridate)
library(dplyr)

#Step 2) standardize the format of two date columns, "CollDate" and "AccDate"####
#Note: Only complete dates will be formatted. Incomplete dates will be "NA"
df$CollDate2 <- ymd(df$CollDate)
df$AccDate2 <- dmy(df$AccDate) #can handle different formas as long as the order is date/month/year
str(df)#Notice that the structure of ColDate and AccDate is Factor whereas for CollDate2 and AccDate2 it is Date

#Step 3) Creating a new  column, "NewDate", which is a combination of CollDate2 and AccDate2####
#https://stackoverflow.com/questions/41668795/using-mutate-with-dates-gives-numerical-values
df<-df %>% 
  mutate(NewDate=if_else(is.na(CollDate2),AccDate2,CollDate2)) #if CollDate2 is empty, fill with AccDate2. Otherwise, fill with CollDate2
str(df)#looks good!
#Now NewDate is formatted consistently and it's a combination of CollDate2 and AccDate2