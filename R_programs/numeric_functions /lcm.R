# LCM function using GCD
lcm <- function(a, b) {
  abs(a * b) / gcd(a, b)
}

# Compute LCM for each row
df$lcm <- mapply(lcm, df$a, df$b)

# View updated dataframe
print(df)
