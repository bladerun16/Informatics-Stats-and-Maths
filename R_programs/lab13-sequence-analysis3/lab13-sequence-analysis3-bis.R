rm(list = ls())
# find the first element with minimal distance from reference 
# and the first element with the second minimal distance from reference
# 
# s : vector
# r : reference
# 
# minS <- first element of s
# minD <- distance of minS from r 
# repeat varying i from 2 to end of s
#    compute the vector of distances d between s and r
# find the minimum of d and set the first position where it appears
# find the minimum of the distances that are bigger than the minimum
# 