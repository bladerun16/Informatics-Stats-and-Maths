max_divisor <- function(n) {
  # Exclude n itself, check divisors from n/2 down to 1
  for (i in seq(floor(n / 2), 1)) {
    if (n %% i == 0) {
      return(i)
    }
  }
}


all_divisors <- function(n) {
  which(n %% 1:n == 0)
}

all_divisors(sample.int(.Machine$integer.max,1))

