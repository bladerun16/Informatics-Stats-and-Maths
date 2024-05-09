# Plotting data with two numeric columns
rm(list = ls())
# data are in the file below
fn = "plot_function_data.csv"
df <- read.csv(fn)
plot(df)
# from plot we see that the column names are x and y

# wrarming up: try this
plot(c(1,2,3),c(4,2,4))
# and this
plot(c(1,2,3),c(4,2,4), type = "l")
# try this
plot(df, type = "l")
# what's wrong?

# try to generate a more meaningful plot
o_x<- order(df$x) # the index sequence that makes x sorted
df <- df[o_x,] # the rows are re-arranged in the sequence
              # of ascending x
plot(df, type = "l")

# If instead of a dataframe we have two vectors x and t 
# of the same lengty
# we can order both vectors according to the sequence of the 
# first one in this way
# x <- x[o_x] # reuse the same variables
# y <- y[o_x]
