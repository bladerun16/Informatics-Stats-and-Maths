# Sample data
n = 10000
top <- .Machine$integer.max
df <- data.frame(
  a = sample.int(top,n),
  b = sample.int(top,n)
)

# GCD function
gcd <- function(a, b) {
  if (b == 0) return(a)
  gcd(b, a %% b)
}

# Apply GCD row-wise
df$gcd <- mapply(gcd, df$a, df$b)

# Find the maximum GCD
max_gcd <- max(df$gcd)

# Filter rows with max GCD
df_max_gcd <- subset(df, gcd == max_gcd)

# View result
print(df_max_gcd)
