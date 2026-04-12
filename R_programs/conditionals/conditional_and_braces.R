# return the absolute value of x by change of sign
x <- as.double(readline("Insert number "))
# Wrong !!!!
if (x < 0) 
  print("Changing sign of x")
  x <- -x
print(paste("Absolute value of the input", x))

# Right!!!
if (x < 0) {
  print("Changing sign of x")
  x <- -x
}
print(paste("Absolute value of the input", x))
