# ##################################
# subsetting vectors and dataframes
# ##################################
# 
rm(list=ls())
x <- c(2.1, 4.2, 3.3, 5.4)
# some elements
x[c(3, 1)]

# ===================
# elements in sorted order
x[order(x)]

# ===================
# replicated indexes yeld replicated elements
x[c(1, 1)]

# ===================
# Real numbers are silently truncated to integers
x[c(2.1, 2.9)]

# ===================
# Negative integers omit elements at the specified positions:
x[-c(3, 1)]

# ===================
# You can’t mix positive and negative integers in a single subset:
#x[c(-1, 2)]
#> Error in x[c(-1, 2)]: only 0's may be mixed with negative subscripts

# ===================
# Logical vectors select elements where the corresponding logical value is TRUE
# This is probably the most useful type of subsetting 
# because you write the expression that creates the logical vector
x[c(TRUE, TRUE, FALSE, FALSE)]
x[x > 3]

# ===================
# If the logical vector is shorter than the vector being subsetted, 
# it will be recycled to be the same length.
x[c(TRUE, FALSE)]
# Equivalent to
x[c(TRUE, FALSE, TRUE, FALSE)]
# this last option is dangerous, better not rely on it
#

# ===================
# A missing value in the index always yields a missing value in the output:
x[c(TRUE, TRUE, NA, FALSE)]

# ===================
# "Nothing" returns the original vector
x[]

# ===================
# data frames
df <- data.frame(x = 1:3, y = 3:1, z = letters[1:3])

df[df$x == 2, ]
df[c(1, 3), ]

# ===================
# There are two ways to select columns from a data frame
# Like a list:
df[c("x", "z")]
# Like a matrix
df[, c("x", "z")]

# =========================
# fix errors
mtcars[mtcars$cyl == 4, ]
mtcars[-1, ]
mtcars[,-1]
mtcars[mtcars$cyl <= 5,"cyl"]
mtcars[(mtcars$cyl == 4) | (mtcars$cyl == 6),"cyl"]
colnames(mtcars)
# the column names of mtcars
# the row names of mtcars
# the mean of mpg in mtcars
# the row names for cars with mpg exceeding the mean mpg 
#     more than 30%

# ===============================
# analyse sequences
closingX <- data.frame(day = 1:8, closing = c(13,12,15,14,16,17,19,18))
# find in which days the closing price was greater than the
# closing price of the day before
# 
# repeat for all the days d from second to the last
#   if closing price of day d is greater than closign price of day d-1
#     output the day
for (d in 2:nrow(closingX) ){
  if (closingX$closing[d] > closingX$closing[d-1]){
    print(closingX$day[d])
  }
}
# 
# 
# ### Vectorised version
# we need to compare the sequence with a shifted version of itself
# let's call them 
# - today (ignore the first day)
# - yesterday (ignore the last day)
today <- closingX$closing[-1]
yesterday <- closingX$closing[-nrow(closingX)]
# create a boolean vector to select
# - the first day cannot be selected
# - create a boolean vector comparing today with yesterday
selector <- c(F,today > yesterday)
# show the selection with one column
closingX[selector,"day"]  
# show all the columns
closingX[selector,]

# ========================
##########################
mtcars
# mtcars[-1:4, ]
mtcars[mtcars$cyl == 4, ]

#mtcars[-1:4, ]
mtcars[1:4]
# exclude first column
mtcars[-1]
# exclude first row
mtcars[-1,]
#
# mtcars[mtcars$cyl <= 5]
mtcars[mtcars$cyl <= 5,]
mtcars[(mtcars$cyl == 4) | (mtcars$cyl == 6), ]

nrow(mtcars[mtcars$cyl == 4 | 6, ])
nrow(mtcars[(mtcars$cyl == 4) | (mtcars$cyl == 6), ])

mtcars[mtcars$gear == 5 & mtcars$cyl == 4, ]
