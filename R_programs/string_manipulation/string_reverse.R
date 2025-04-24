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
  if (lenght(input_str) == 0)
    return(input_str)
  n <- nchar(input_str)
  output_str <- ""
  
  for (i in n:1) {
    output_str <- paste0(output_str, substr(input_str, i, i))
  }
  
  return(output_str)
} # reverse_string_loop - end

# Example usage
reverse_string_loop("hello")  # Output: "olleh"
