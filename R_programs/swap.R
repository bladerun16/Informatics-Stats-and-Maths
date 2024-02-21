A <- as.double(readline("A "))
B <- as.double(readline("B "))

if (B<A) {
  t <- A
  A <- B
  B <- t
}
