# when ^ is at the beginning of a pattern it represents the beginning of the string
# in the other cases it represents a negation
x = c("xyz","zxy","kxy","yzx", "xzy")
grep("^xy", x, value = T) # looks for strings beginning with x followed by y
grep("^[xy]", x, value = T) # looks for strings beginning with x or y
grep("^[^xy]", x, value = T) # looks for strings beginning with anything but x or y
