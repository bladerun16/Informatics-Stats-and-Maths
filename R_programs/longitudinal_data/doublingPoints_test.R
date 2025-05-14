####################################
# test program
rm(list = ls())
source("doublingPoints.R")
fn <- "data/readings.csv"
df <- read.csv(fn)
df$readingDates <- as.Date(df$readingDates)

dp <- doublingPoints(df$readings)

plot(df$readingDates,df$readings
     , type = "b"
     , main ="Doubling points in solid red"
     , xlab = "Reading Dates"
     , ylab = "Readings"
     )
points(df$readingDates[dp],df$readings[dp], col = "red", pch = 16)

