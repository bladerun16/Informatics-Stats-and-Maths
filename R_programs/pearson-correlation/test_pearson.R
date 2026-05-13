rm(list = ls())
source("gen-corr.R")
# source("pearson-correlation-full.R")
# source("pearson-correlation-partial-optim.R")
source("pearson-correlation-vectorized.R")
# =======================================
# Generate test data

n <- 1000
c <- -0.5
x_y <- gen_corr(n, c)
x <- x_y$x
y <- x_y$y
correlation <- x_y$correlation # correlation of generated data

# =====================================
# Test the correlation function with the synthetic data

c <- pearson(x,y)

if (is.character(c)){
  print(c)
  stop("Correlation not computed.")
}

# Produce a scatterplot of x and y
plot(x, y,
     main = paste("Computed correlation with 'pearson' = ", c),
     xlab = "x",
     ylab = "y",
     pch = 19)

cat(paste("Comparison of the computed value with the result of the native function: ",cor(x,y) == c),"\n")
