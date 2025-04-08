# #################### #
# is_palindrome        #
# #################### #
# loops on characters from the first to the one before the middle
# if the caracters in positions specular to the middle are different
# return false, if no difference is found return true 
# Parameters:
# - input_str: string to revers
# Output:
# - TRUE or FALSE
# Use: 
# - i: counter to scan the string
# Algo:
# - if the input string is empty or has length 1 return TRUE
# - repeat varying i from 1 to the integer division of the length by 2
#   - if the ith character is different from the one in position
#     n - i + 1
#     - return FALSE
# - return TRUE, because no difference has been found during the loop
is_palindrome <- function(input_str) {
  n <- nchar(input_str)
  
  for (i in 1:(n %/% 2)) {
    if (substr(input_str, i, i) != substr(input_str, n - i + 1, n - i + 1)) {
      return(FALSE)
    }
  }
  
  return(TRUE)
} # is_palindrome - end

# Example usage
test = "racecar"
cat("Palindrome ",test,is_palindrome(test),"\n") # Output: TRUE
test = "abracadabra"
test="q"
cat("Palindrome ",test,is_palindrome(test),"\n")  # Output: TRUE
