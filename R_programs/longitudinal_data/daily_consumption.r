# #######################
# Task
# Given a file with dates of reading and measure
# return a vector of average daily consumptions
# Parameters
# - dates: dates of reading
# - readings
# Return
# - adc: vector of average daily consumption
# Algorithm
# - check if the two vectors have the same length and contain data,
#   if not return null
# - initialize a double empty vector adc
# - repeat varying i on all from 2 to the length of the data
# -   - compute the ratio between 
#         the difference of elements i and i-1 in readings
#         and the difference of elements i and i-1 in dates
#     - store the ratio at the end of adc
# - return adc
rm(list = ls())
# install.packages("readxl")
library(readxl)

# ########################### #
# average_daily_consumption   #
# ########################### #
# given two vectors of increasing dates and increasing readings 
# of some consumption produce the daily consumption in each
# period as the ratio of the difference between two consecutive readings
# and the difference of two consecutive dates
# Parameters:
# - dates: vector of dates (increasing)
# - readings: vector of readings (increasing), same length as dates
# Uses:
# - adc: vector of average daily consumptions; its length is 
#   the number of elements of the input vector minus 1 
# - i: index
# Returns:
# - adc
# Algo:
# - check validity of input vectors
# - create the vector adc
# - repeat for i varying from 2 to the length of the input vectors
#   - add to the i-th position of adc the ratio between differences of 
#     readings in i and i-1 and the difference of omologous dates
average_daily_consumption <- function(dates,readings){
  if (length(dates)!=length(readings) | length(dates)==0)
    return(NULL)
  adc <- vector(mode = "double", length = length(readings)-1)
  for (i in 2:length(dates)){
    adc[i-1] <- (readings[i]-readings[i-1])/as.integer(dates[i]-dates[i-1])
  } # for (i in 2:length((dates)) 
  return(adc)
} # average_daily_consumption - end

# ########################### #
# average_daily_consumption_v   #
# ########################### #
# vectorized version
# method uses subsetting with indexes 
# from 2 to the length of the input vectors for the positives
# and from 1 to the length-1 for the negatives
# 
average_daily_consumption_v <- function(dates,readings){
  if (length(dates)!=length(readings) | length(dates)==0)
    return(NULL)
  adc <- (readings[2:length(readings)]-readings[1:(length(readings)-1)])/
            as.integer(dates[2:length(readings)]-dates[1:(length(readings)-1)])
  return(adc)
} # average_daily_consumption_v - end


###########################
# examine the input file to understand the structure and the data types
# >>> check date format
# test program
# fn <- "data/readings.csv"
# sep = ","
# header = TRUE
fn <- "data/readings.xlsx"
# ########################
# reading csv
# sep = "\t"
# header = FALSE
# df <- read.csv(fn, header = header, sep = sep)
# names(df) <- c("readingDates", "readings") # assign names
# reading csv - end
# #######################
# reading excel
df <- read_excel(fn)
names(df) <- c("readingDates", "readings", "to_ignore") # rename
# check the format of readingDates
# if "string" it must be converted, if "POSIX..." it's already a date
class(df$readingDates)
print(df)
# adc <- average_daily_consumption(as.Date(df$readingDates,format = "%d/%m/%y"),df$readings)
adc <- average_daily_consumption(df$readingDates,df$readings)
plot(adc, axes=FALSE, xlab="", ylab="Average consumption", type = "b")
title(main = "Average daily consumption by Reading Dates")
axis(2)
axis(1, at=seq_along(adc),labels=df$readingDates[-1], las=2)
box() # adds a box around the plot


