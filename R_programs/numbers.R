### Show the pre-defined numeric constants available in R ###
.Machine$double.eps    # the smallest positive floating-point number x such that 1 + x != 1. 
.Machine$double.neg.eps    # a small positive floating-point number x such that 1 - x != 1. It equals base^neg.ulp.digits if base is 2 or round is 0; otherwise, it is (base^neg.ulp.digits) / 2. As neg.ulp.digits is bounded below by -(digits + 3), neg.eps may not be the smallest number that can alter 1 by subtraction.
.Machine$double.xmin    # the smallest non-vanishing normalized floating-point power of the radix, i.e., base^min.exp.
.Machine$double.xmax    # the largest finite floating-point number. Typically, it is equal to (1 - neg.eps) * base^max.exp, but on some machines it is only the second, or perhaps third, largest number, being too small by 1 or 2 units in the last digit of the significand.
.Machine$double.base    # the radix for the floating-point representation
.Machine$double.digits    # the number of base digits in the floating-point significand
.Machine$double.rounding    # the rounding action. 
#  0 if floating-point addition chops; 
#  1 if floating-point addition rounds, but not in the IEEE style; 
#  2 if floating-point addition rounds in the IEEE style; 
#  3 if floating-point addition chops, and there is partial underflow; 
#  4 if floating-point addition rounds, but not in the IEEE style, and there is partial underflow; 
#  5 if floating-point addition rounds in the IEEE style, and there is partial underflow
.Machine$double.guard    # the number of guard digits for multiplication with truncating arithmetic. It is 1 if floating-point arithmetic truncates and more than digits base base digits participate in the post-normalization shift of the floating-point significand in multiplication, and 0 otherwise.
.Machine$double.ulp.digits    # the largest negative integer i such that 1 + base^i != 1, except that it is bounded below by -(digits + 3).
.Machine$double.neg.ulp.digits    # the largest negative integer i such that 1 - base^i != 1, except that it is bounded below by -(digits + 3).
.Machine$double.exponent    # the number of bits (decimal places if base is 10) reserved for the representation of the exponent (including the bias or sign) of a floating-point number
.Machine$double.min.exp    # the largest in magnitude negative integer i such that base ^ i is positive and normalized.
.Machine$double.max.exp    # the smallest positive power of base that overflows.
.Machine$integer.max    # the largest integer which can be represented.

print(.Machine$integer.max)
typeof(.Machine$integer.max)
print(.Machine$integer.max+1)
typeof(.Machine$integer.max+1)

with(
  .Machine,{
    print(integer.max)
    typeof(integer.max)
    print(double.xmax)
  }
  )

print(.Machine$double.xmax)
print(.Machine$double.xmax+1)
print(.Machine$double.xmax*2)
print(.Machine$double.xmin)
print(.Machine$double.xmin/2)
print(.Machine$double.xmin/(2^100))
typeof(.Machine$double.xmin/34)
