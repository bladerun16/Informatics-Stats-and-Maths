rm(list = ls())
# Integer division
# works for positive integer divisor
# repeatedly subtracts the divisor from dividend 
#    and stops when the remainder is smaller than
#    the divisor

# Uses
# dnd - dividend
# dsr - divisor
# rmn - remainders
# r   - ratios

# Algorithm
# - input dnd and dsr
# - rmn <- dnd
# - r <- 0
# - repeat if rmn >= dsr
#   - rmn <- rmn - dsr
#   - r <- r+1
# - output r and rmn

dnd <- as.integer(readline("Insert non negative dividend    "))
dsr <- as.integer(readline("Insert positive integer divisor "))
r <- 0
rmn <- dnd
while (rmn >= dsr){
  rmn <- rmn - dsr
  r <- r+1
}
cat(dnd, " / ", dsr, " = ", r, " remainder ", rmn)