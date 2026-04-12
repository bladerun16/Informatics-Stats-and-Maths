rm(list = ls())
A <- as.double(readline("Insert number :"))
B <- as.double(readline(paste("Insert number not less than ", A, " : ")))
C <- as.double(readline(paste("Insert number not less than ", B, " : ")))
if (A > B | B > C) {
  print("Wrong sequence")
} else {
  if (A + B < C) {
    print("It isn't a triangle")
  } else {
    if (A == C) {
      print("It is equilateral")
    } else
      if (A == B || B == C) {
        print("It is isosceles")
      } else {
        print("It is scalene")
      }
  }
}
