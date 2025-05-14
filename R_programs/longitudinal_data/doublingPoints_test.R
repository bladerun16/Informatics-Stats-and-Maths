####################################
# test program
rm(list = ls())
source("doublingPoints.R")
fn <- "data/readings.csv"
df <- read.csv(fn)
print(doublingPoints(df$readings))

# Doubling point
# the first reading is a doubling point
# next doubling point is next element whose value is not smaller 
# than the last doubling point