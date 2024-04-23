# coding: utf-8

# # Manipulating Strings in R
# _Claudio Sartori - University of Bologna - Department of Computer Science and Engineering_  
# Partly inspired by Gaston Sanchez: Handling and Processing Strings in R
# ## What is a string?
# * A vector of characters
#  * a character is an ASCII value
# * Has a number of dedicated functions, different from those of standard vectors
# * Strings can be the basis for any repeating objects
#  * Vector of strings
#  * Matrix of strings
#  * Data frame column of strings
#  * List of strings
#  
# ## What to do with strings?
# * remove a given character in the names of your variables
# * replace a given character in your data
# * convert labels to upper case (or lower case)
# * struggling with xml (or html) files
# * modifying text files in excel changing labels, categories, one cell at a time, or doing one thousand copy-paste operations
# * split unformatted text into paragraphs, sentences, words
# * get rid of punctuation and special characters
# * ...

# ## A toy example

# In[1]:


# predefined dataset
head(USArrests)


# In[2]:


head(rownames(USArrests))


# Which state names have maximum length?

# In[3]:


states <- rownames(USArrests)
statesChars <- nchar(states)
states[which(statesChars==max(statesChars))]


# Select the states with a "k" in the name

# In[4]:


grep(pattern = "k", x = states)


# It gave only the index values. Let's try to obtain the values

# In[5]:


grep(pattern = "k", x = states, value = TRUE)


# What about Kansas?

# In[6]:


grep(pattern = "k", x = states, value = TRUE, ignore.case = TRUE)


# Do you prefer all uppercase?

# In[7]:


head(toupper(states))


# ### Some statistics

# In[8]:


hist(nchar(states), main = "Histogram", xlab = "Number of characters in the US state names")


# In[9]:


positions_a = gregexpr(pattern = "a", text = states, ignore.case = TRUE)
print(head(positions_a))


# `gregexpr` returns for each input element the list of positions where the pattern appears. The `unlist` command *flattens* the list to a vector. 

# In[10]:


positions_a <- unlist(unlist(positions_a))
print(positions_a)


# If you inspect positions a you’ll see that it contains some negative numbers -1. This means there are no "a" in that name. 
# 
# We should count only the number of positive values.

# In[11]:


length(positions_a[which(positions_a!=-1)])


# Now we can do the count for all the vowels

# In[12]:


# calculate number of vowels in each name
substr_count <- function(pattern, text, ignore.case = TRUE){
    positions <- unlist(gregexpr(pattern = pattern, text = text, ignore.case = ignore.case))
    return(length(positions[which(positions!=-1)]))
}
vowels <- c("a", "e", "i", "o", "u")
names(vowels) <- vowels
num_vowels <- vector(mode = "integer", length = length(vowels))


# In[13]:


for (j in seq_along(vowels)){
    num_vowels[j] <- substr_count(pattern = vowels[j], text = states, ignore.case = TRUE)
}


# In[14]:


num_vowels


# In[15]:


#dev.new(width = 5, height = 5)
library(repr)
options(repr.barplot.width=1, repr.barplot.height=1)
barplot(num_vowels, main = "Number of vowels in USA States names",
       border = NA, ylim = c(0,80))


# ## Character Strings in R

# In[16]:


cs <- 'a character string using single quotes'
cat(cs)


# In[17]:


cs <- "a character string using double quotes"
cat(cs)


# In[18]:


cs <- "a character string including 'quoted' text"
cat(cs)


# In[19]:


empty_str <- ""
# cat simply display the content, in this case is nothing
cat(empty_str)


# In[20]:


# print formats output and shows expression type, in this case string
print(empty_str)


# Create empty character vector

# In[21]:


cv <- character(0)


# In[22]:


print(cv)


# Test if an expression is a string

# In[23]:


is.character(3)


# In[24]:


is.character("3")


# Converts to string

# In[25]:


as.character("45")


# A *mixed type* vector is converted to string

# In[26]:


mv <- c('1',2,3L,FALSE)
typeof(mv)


# In[27]:


print(mv)


# ## Getting text into R

# ### Reading tables
# The first argument can be either a relative pathname, an absolute pathname or an url

# | function   | description                                 |
# |:-----------|:------------------------------------------- |
# |`read.table()`| read a file in table format |
# |`read.csv()`  | read a text file with fields separated by some separator character (e.g. ",") |
# |`read.fwf()`   | read fixed width format files: assumes that the fields use the same number of characters in each row without assuming a separator   

# In[28]:


abc <- "http://www.abc.net.au/local/data/public/stations/abc-local-radio.csv"
radio <- read.table(abc, header = TRUE, sep = ",")


# In[29]:


dim(radio)


# In[30]:


typeof(radio)


# In[31]:


head(radio)


# `read.csv` is the same as `read.table` but with defaults  `header = TRUE, sep = ","` 

# In[32]:


radio <- read.csv(abc)
dim(radio)


# In[33]:


typeof(radio)


# In[34]:


head(radio)


# In[35]:


typeof(radio$Town)


# In[36]:


length(radio$Town)
length(unique(radio$Town))


# The string columns have been converted to *factors*, that is all the different values are converted to integers and the original values are automatically retrieved for display purposes. 
# 
# This is only useful when the number of distinct values is relatively small, with respect to the number of rows.
# 
# In this case, it is better to avoid this

# In[37]:


radio <- read.csv(abc, stringsAsFactors = FALSE)
typeof(radio$Town)


# Inspect the structure of the data frame. 
# 
# `vec.len` limits the number of examples of the column contents

# In[38]:


str(radio, vec.len = 1)


# ## String Manipulation Functions
# ### The versatile `paste()` function
# Takes one or more R objects, converts them to characters and then concatenates them, producing a single string
# 
# `paste(..., sep = " ", collapse = NULL)`

# In[39]:


PI = paste("The life of", pi)
print(PI)


# In[40]:


PI = paste("The life of", pi, sep = ":")
print(PI)


# In[41]:


day = 14
month = 5
year = 2018
cat(paste(c(day,month,year), collapse = "-"))


# `sep` separates the arguments to be pasted
# 
# `collapse` when the argument is a vector separates the vector elements

# In[42]:


cities = c("Bologna", "Firenze", "Roma", "Venezia")
city_codes = c("BO", "FI", "RM", "VE")
cat(paste(cities, city_codes, sep = ":", collapse = "\n"))


# ### Printing functions
# 
# |*name*       | *description* |
# |:------------|:------------|
# | `print()`   | generic printing |
# | `noquote()` | printing without quotes |
# | `cat()`     | simple concatenation and output |
# |`format()`   | output with conversions |
# |`toString()` | convert to string       |
# |`sprintf()`  | C style printing        |

# #### `cat` parameters
# `file` output to text file  
# `sep`  separation character

# In[43]:


cat("q", file="q.txt")


# #### `format` parameters
# `width`       minimum width of the string  
# `trim`        if set to TRUE no padding with spaces  
# `justify`     `"left", "right", "centre", "none"`  
# `digits`      for numbers, number of digits in the output
# `nsmall`      for numbers, number of digits to the right of the decimal place  
# `scientific`  `TRUE` for scientific notation

# In[44]:


format(13.7)


# In[45]:


format(3.1416)


# In[46]:


format(13.7, digits = 2)


# In[47]:


format(13.7, nsmall = 2)


# In[48]:


format(13.7, scientific = TRUE)


# ## Basic string manipulations
# 
# |*name*       | *description* |
# |:------------|:------------|
# | `nchar()`   | count characters |
# | `tolower()` | convert to lower case |
# | `toupper()` | convert to upper case |
# | `casefold()`| if `upper = "TRUE"` converts to upper, otherwise to lower |
# | `chartr()`  | character translation       |
# | `abbreviate()`| generate abbreviations    |
# | `substring()`   | substring extract or replace, start, stop  |
# | `substr()`      | similar to `substring()` but less robust |
# 

# In[49]:


chartr("ab", "AB", "ab ovo absit")


# In[50]:


x <- c("say", "may", "can", "funny")
substring(x, 2, 2) <- '*'
x


# In[51]:


substring("ABCDEF", 1:6)


# In[52]:


substr("ABCDEF", 1, 1) 


# ## Regular Expressions
# A regular expression (regex or regexp for short) is a special text string for describing a search pattern.  
# You can think of regular expressions as wildcards on steroids.  
# You are probably familiar with wildcard notations such as \*.txt to find all text files in a file manager.  
# The regex equivalent is `^.*\.txt$`.  [Reference for regular expressions](http://www.regular-expressions.info)  
# __Regular expressions__ are an extremely powerful tool for pattern matching and text manipulation
# 
# A regex is in general a combination of alphanumeric characters and special characters.  
# Regex can be combined by means of operators, as happens for expressions. The basic operators are
# * concatenation  
# * logical OR  
# * repetition  
# * grouping  
# 
# ### The `grep` function
# 
# `grep(pattern, x, value = FALSE, invert = FALSE, ...)`
# 
# - `pattern` is a *regular expression*
# - `x` is the string (or a vector of strings)
# - `value` controls if the ouput is the index of the matching elements, or the elements
# - `invert` inverts the matching logic

# In[53]:


a <- c("abcabaacde", "bac", "accccb", "bc")


# Matches `b` followed by zero or more `a` then `c`

# In[54]:


grep(pattern = "ba*c", x = a, value = TRUE)


# Matches `b` followed by one or more `a` then `c`

# In[55]:


grep(pattern = "ba+c", x = a, value = TRUE)


# Matches `b` followed by two `a` then `c`

# In[56]:


grep(pattern = "ba{2}c", x = a, value = TRUE)


# The `regexpr` function gives, for each target, the number of times the pattern is found
# 
# Matches `b` followed by zero or more `a` then `c`

# In[57]:


regexpr("ba*c", a)


# The `gsub` function substitutes a pattern with a replacement

# In[58]:


test <- "123aBc45"


# Substitutes _non alphabetic characters_ with a _space_
# 
# Explanation of pattern
# - `[]` encloses sequences of alternative matching characters
# - `^` is the negation or anchors the beginning of a string, depending on the context
# - `a-z` `A-Z` are the lowercase and uppercase alphabetic characters, respectively

# In[59]:


gsub("^[a-zA-Z]", " ", test)


# In[60]:


strings <- c("The cat is under the table"
             , "the cat is under the table"
             , "the pen is above the table")


# Matches `The`.
# 
# here `^` anchors the sequence to the _beginning of the string_
# 
# Observe the double meaning of `^`

# In[61]:


print(gsub(pattern = "^The"
           , replacement = "A"
           , x = strings
           , ignore.case = TRUE))


# In[62]:


print(gsub(pattern = "The"
           , replacement = "A"
           , x = strings
           , ignore.case = TRUE))


# In[63]:


print(gsub(pattern = "the"
           , replacement = "a"
           , x = strings
           , ignore.case = TRUE))


# In[64]:


print(gsub(pattern = "under"
           , replacement = "above"
           , x = strings
           , ignore.case = TRUE))


# In[65]:


# when ^ is at the beginning of a pattern it represents the beginning of the string
# in the other cases it represents a negation
x = c("xyz","zxy","kxy","yzx", "xzy")
grep("^xy", x, value = T) # looks for strings beginning with x followed by y


# In[66]:


grep("^[xy]", x, value = T) # looks for strings beginning with x or y


# In[67]:


grep("^[^xy]", x, value = T) # looks for strings beginning with anything but x or y


# ## Example of *data cleaning* using regular expressions
# Download a raw text file which has *some structure* and transform it into a `csv` file

# ### Reading raw text
# If there is no structure in data we may want to import text *as is*
# 
# `readLines()` reads a file and outputs a character vector with one element for each line of the file or url

# In[68]:


top100_url <- "http://www.textfiles.com/music/ktop100.txt"
top100 <- readLines(top100_url)
head(top100)


# In[69]:


length(top100)


# In[70]:


top100[11:15]


# #### Concatenation
# Concatenate characters to match

# In[71]:


# concatenate "1" and "0"
# with value = FALSE (the default) generate the indexes of the rows matching the pattern
grep("10", top100, value = TRUE)


# ### Logical OR

# In[72]:


grep("10|20", top100, value = TRUE, )


# Two or more times the character `1`

# In[73]:


grep("1{2,}", top100, value = TRUE)


# Chech if there is any `;` in the data

# In[74]:


grep(";", top100, value = TRUE)


# ### Eliminate rows which do not start with `<digits>.<space>`
# explanation:  
# `^`&emsp; anchors the beginning of string  
# `[0-9]`&emsp;  matches any of the ten digits  
# `+`&emsp;  allow one or more of the previous match, which is, in this case, any digit  
# `\`&emsp;  allows that next character will be interpreted as it is in the string that will be passed to the regex interpreter  
# `\`&emsp;  it is the backslash needed to escape the following regex special character  
# `.`&emsp;  character being escaped in order to be matched
# 
# 

# In[75]:


top100_clean <- grep("^[0-9]+\\. ", top100, value = TRUE)
length(top100_clean)


# In[76]:


tail(top100_clean)


# In[77]:


# just to check try to eliminate numbers
top100_nonumbers <- sub("^[0-9]+\\. ", "", x = top100_clean)


# In[78]:


# check if all the lines have two or more spaces to separate the groupName and the singleName 
length(top100_clean) == length(grep("  ", top100_clean, value = TRUE))


# In[79]:


cat(paste(top100_clean, "\n"))


# In[80]:


# six pair of rows have duplicate numbers and the note (tie): eliminate the note
top100_clean_0 <- sub("( +\\(tie\\))", "", x = top100_clean)


# In[81]:


# in the pattern, () include a matching pattern group
#   it is: beginning of string, one or more digits
# in the replacement, \\1 means the first matching pattern group
#   it is kept in the replacement, then the semicolon is added
top100_1 <- sub(pattern = "(^[0-9]+)\\. ", replacement = "\\1;", x = top100_clean)
# below an alternative solution, less robust, since it is not tied to the beginning of the string
# top100_1 <- sub("\\. ", ";", x = top100_clean_0)
tail(top100_1)


# In[82]:


top100_2 <- sub(" {2,}", ";", x = top100_1)
tail(top100_2)


# In[83]:


write(top100_2, file = "top100.csv")
top100.df <- read.csv("top100.csv"
                      , header = FALSE
                      , stringsAsFactors = FALSE
                      , sep = ";", col.names = c("Position", "Group", "Single")
                     )


# In[84]:


head(top100.df)

