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
average_daily_consumption <- function(dates,readings){
  if (length(dates)!=length(readings) | length(dates)==0)
    return(NULL)
  adc <- vector(mode = "double")
  for (i in 2:length(dates)){
    adc[i-1] <- (readings[i]-readings[i-1])/as.integer(dates[i]-dates[i-1])
  } # for (i in 2:length((dates)) 
  return(adc)
} # average_daily_consumption - end

# vectorized version
average_daily_consumption_v <- function(dates,readings){
  if (length(dates)!=length(readings) | length(dates)==0)
    return(NULL)
  adc <- (readings[2:length(readings)]-readings[1:(length(readings)-1)])/
            as.integer(dates[2:length(readings)]-dates[1:(length(readings)-1)])
  return(adc)
} # average_daily_consumption_v - end


###########################
# test program
# fn <- "data/readings.csv"
# sep = ","
# header = TRUE
fn <- "data/readings_gas.csv"
sep = "\t"
header = FALSE
df <- read.csv(fn, header = header, sep = sep)
names(df) <- c("readingDates", "readings")
# print(average_daily_consumption(as.Date(df$readingDates),df$readings))
print(average_daily_consumption_v(as.Date(df$readingDates),df$readings))