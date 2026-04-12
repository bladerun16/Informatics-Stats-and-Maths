rm(list = ls())
# use A, B, C for triangle sides
#     t: temporary store for swap
# input A, B and C
# if A>B swap A and B
# if C<A then A<-C B<-A C<-B
# if A+B < C
#    Output it isn't a triangle
# else
#    if A equal to C
#       Output it is equilateral
#    else
#       if A = B or B = C
#          Output it is isosceles
#       else
#          Output it is scalene
# input
A <- as.double(readline("Insert number :"))
B <- as.double(readline("Insert number :"))
if (B < A) {
  # swap A and B
  t <- A
  A <- B
  B <- t
}
# now A<=B
C <- as.double(readline("Insert number :"))
if (C < A) {
  # triple swap A<-C B<-A C<-B
  t <- C
  C <- B
  B <- A
  A <- t
} else
  if (C < B) {
    # swap B and C
    t <- C
    C <- B
    B <- t
  }
# now A<=B and B<=C
# output triangle sides
cat(A,B,C)
if (A + B < C) {
  cat(" isn't a triangle")
} else if (A == C) {
  cat(" is equilateral")
} else if (A == B || B == C) {
  cat(" is isosceles")
} else
  cat(" is scalene")
