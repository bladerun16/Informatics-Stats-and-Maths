# What kind of triangle - Assume A<=B and B<=C
# Solution without curly braces
# It is possible because the sequences are all made by a single statement
# ***else*** must be in the same line of the statement to be executed when 
# the condition is true (in this case "reformat code" does not work)
A <- as.double(readline("Insert number :"))
B <- as.double(readline(paste("Insert number not less than ", A, " : ")))
C <- as.double(readline(paste("Insert number not less than ", B, " : ")))
if (A + B < C)
  print("It isn't a triangle") else
  # it is a triangle
  if (A == C)
    print("It is equilateral") else
  # it is not equilateral
    if (A == B || B == C)
      print("It is isosceles") else
    # it is not isosceles
      print("It is scalene")
