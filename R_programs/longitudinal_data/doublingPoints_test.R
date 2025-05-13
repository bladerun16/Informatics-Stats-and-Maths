####################################
# test program
rm(list = ls())
source("doublingPoints.R")
fn <- "data/readings.csv"
df <- read.csv(fn)
print(doublingPoints(df$readings))
