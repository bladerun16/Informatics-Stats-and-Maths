rm(list = ls())
# #################### #
# reverse_string_loop  #
# #################### #
# extract one character at a time using 
#    ***substr(input_str, start_pos, end_pos)***
# loops on characters from the last to the first 
# and add them to to a new string with ***paste0***
# Parameters:
# - input_str: string to revers
# Output:
# - output_str: reversed string
# Use: 
# - i: counter to scan the string
# Algo:
# - if the input string is empty return it
# - initialize output_str as a empty string
# - repeat varying i from the length of the string to 1
#   - extract the ith character of the imput string and add it 
#     to the end of output
# - return the output
reverse_string_loop <- function(input_str) {
  if (nchar(input_str) == 0)
    return(input_str)
  n <- nchar(input_str)
  output_str <- ""
  
  for (i in n:1) {
    output_str <- paste0(output_str, substr(input_str, i, i))
  }
  
  return(output_str)
} # reverse_string_loop - end




# #################### #
# reverse_string_vec   #
# #################### #
# use the function strsplit that splits a string into single
#   elements according to a separator caracter; using NULL as
#   separator it splits into a list of single characters
# the list is transformed in to a vector using [[1]] 
#   that works as "list extractor
# the vector is then reversed with appropriate indexing and
#   transformed to a string with paste0
# Parameters:
# - input_str: string to revers
# Output:
# - output_str: reversed string
# Use: 
# - i: counter to scan the string
# Algo:
# - if the input string is empty or has one character return it
# - generate the vector of characters of the list
# - reverse the vector with indexing and convert to string
# - return the output
reverse_string_vec <- function(s) {
  s_len <- nchar(s)
  if (s_len <= 1)
    return(s)
  s_split <- strsplit(s, NULL)[[1]]
  return(paste0(s_split[length(s_split):1]
               , collapse = "" 
                ))
} # reverse_string_vec - end

# Example usage
print(reverse_string_loop("hello"))  # Output: "olleh"

print(reverse_string_vec("hello"))  # Output: "olleh"
