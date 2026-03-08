# the three numbers must be in non-decreasing order
a <- 3
b <- 4
c <- 5
if (a + b < c) {
  print("it is not a triangle")
} else { # it is a triangle
  if (a == c) {
    print("it is equilateral")
  } else { # it is not equilateral
    if (a == b | b == c) { # it is isosceles
      print("it is isosceles")
    } else { # it is scalene
      print("it is scalene")
    } # it is not equilateral
  }  # it is a triangle
}