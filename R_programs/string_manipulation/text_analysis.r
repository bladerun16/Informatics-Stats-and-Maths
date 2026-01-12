#!/usr/bin/env python
# coding: utf-8

# # Text analysis
# Extract from a normal text, such as a book chapter, the _most frequent_ and _significant_ words, then plots them in a _wordcloud_, according to the frequencies.  
# This is the workflow:
# 
# 1. Load text
# 2. Clean removing non-alphabetic characters
# 3. Reduce all characters to lowercase
# 4. Split lines into words
# 5. Remove empty words
# 6. Compute frequencies of words and store them into a dataframe
# 7. Sort by descending frequency
# 8. Download the list of stopwords
# 9. Exclude stopwords from the dataframe
# 10. Produce a word-cloud with the most frequent words
# 
# The statements preceded by the comment `# control` are added to check if the transformations proceed as desired

# ### Load text

# In[1]:


rm(list = ls())
#file_ref <- "https://www.gutenberg.org/files/2701/old/moby10b.txt"
file_ref="moby_dick_ch01.txt"
text_lines <- readLines(file_ref)


# In[2]:


# control
print(text_lines[1])


# In[3]:


# control
length(text_lines)


# ### Clean removing non-alphabetic characters

# In[4]:

# gsub = global substitution <pattern> <substitution> <data>
# "^" stands for 'negation' 'a-z' stands for all lowercase letters
text_clean0 <- gsub("[^a-zA-Z]", " ", text_lines)
# control
text_clean0[1]


# ### Reduce all characters to lowercase

# In[5]:


text_clean <- tolower(text_clean0)
# control
text_clean[1]


# ### Split lines into words
# `strsplit` function split the first _argument_ according to the _separator_ in the second argument

# In[6]:


# control - test before doing the actual transformation
strsplit(text_clean[1], " ")


# In[7]:


# strsplit produces a list - unlist flatten the list
# control - test before doing the actual transformation
unlist(strsplit(text_clean[1], " "))


# In[8]:


words0 <- unlist(strsplit(text_clean, " "))
# control
head(words0)


# ### Remove empty words

# In[9]:

# words0 != "" is true for all non-empty words
words <- words0[words0 != ""]
# control
head(words)


# ### Compute frequencies of words and store them into a dataframe
# The `table` function uses the cross-classifying factors to build 
# a contingency table of the counts at each combination of factor levels.
# 
# In this case there is only one factor, the word itself, 
# and a one-dimensional contingency table is produced

# In[10]:

words_tb <- as.data.frame(table(words))
# control
head(words_tb)


# ### Sort by descending frequency
# 
# The `order` function produces the index permutation which sorts a 
# vector in ascending order.
# 
# To obtain the descending order it is sufficient to change the sign of frequencies

# In[11]:


words_tb <- words_tb[order(-words_tb$Freq),]
# control
head(words_tb)


# In[12]:


# control
nrow(words_tb)


# ### Download the list of stopwords
# Stopwords are the words in a langage whose frequency is so big
# to make them too common to allow any insight on the text

# In[13]:


# stopwords_file_ref <- "https://raw.githubusercontent.com/stopwords-iso/stopwords-en/master/stopwords-en.txt"
stopwords_file_ref <- "stopwords-en.txt"
stopwords <- readLines(stopwords_file_ref)
# control
head(stopwords)


# ### Exclude stopwords from the dataframe
# 
# The `setdiff` function computes the set difference where sets are represented as vectors
# is.element(<target>,<check>) 
#      generates a true for each element of target that is conained in check
#      false if it is not contained
# In[14]:


words_non_stop <- setdiff(words_tb$words, stopwords)
words_non_stop_tb <- 
  words_tb[is.element(words_tb$words, words_non_stop), ]
# control
head(words_non_stop_tb)


# In[15]:


# control
nrow(words_non_stop_tb)


# ### Produce a word-cloud with the most frequent words

# In[16]:


# uncomment line below if the wordcloud package was never installed
# then comment it again
# install.packages("wordcloud")


# In[17]:


# require(wordcloud2)
# library(RColorBrewer)


# In[18]:


# will display only words with frequency not less than threshold
# freqThreshold <- 2
# # control
# cat("There are", sum(words_non_stop_tb$Freq>=freqThreshold),
#     "words with frequency not less than", freqThreshold)


# In[19]:


# Control
words_non_stop_tb[words_non_stop_tb$Freq>=freqThreshold,]


# In[20]:

# wordcloud makes a figure with all the elements of first argument
# the font size is proportional to second argument
wordcloud(
      words_non_stop_tb$words[words_non_stop_tb$Freq>=freqThreshold]
    , words_non_stop_tb$Freq[words_non_stop_tb$Freq>=freqThreshold]
    , scale=c(8,.4)
          )


# In[ ]:




