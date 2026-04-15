# generate vector of pivots
# Variables
# - m - matrix nr*nc
# - i, j - indexes on rows and columns
# - pc - vector of the indexes where we find pivots, length is the number of columns
# initialize pc to nr values equal to nc+1
# repeat varying i from 1 to the number of rows
#   repeat varying j from 1 to the number of columns
#     if element i,j of matrix is not zero store j in position i of pc
# return pc