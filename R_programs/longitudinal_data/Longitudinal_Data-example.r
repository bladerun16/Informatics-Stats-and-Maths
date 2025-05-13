####### Exercise with longitudinal data
# Longitudinal data, sometimes referred to as panel data, 
# track the same sample at different points in time. 

# ## Given a series of reading dates and readings of some 
# measure find the dates where the measurement is doubled 
# with respect to the previous doubling point
# 
# Given a dataframe `measures` with columns `readingDates` 
# containing dates and `readings` containing doubles, 
# such that `readingDates[i]>readingDates[i-1]` 
# for all `i` from `2` to the number of rows, 
# find the vector of indexes of the doubling points `dp` such that:
# - `dp[1] is 1`
# - `j` is the smallest integer such that 
# `readings[dp[j]] >= 2 * readings[dp[j-1]` for all `j > 1`

# First of all, check the data file with a text editor and observe:
# 
# - separator between fields (can be comma, semicolon, tab, ...)
# - decimal point in decimal numbers (can be dot, comma, ...)
# - text data (if text contains the same character as the separator it can be a problem)
# - date formats
# 

# In[1]:
# file.path joins two strings as component of a pathname
# using this we make the r program "portable", it can be executed in different
# operating systems without any change
rm(list = ls())
data_folder = "data"
fn <- "readings.csv"
df <- read.csv(file.path(data_folder,fn))

# Transform date expressed in characters into proper dates

# In[2]:


df$readingDates <- as.Date(df$readingDates, format = "%Y-%m-%d")

# In[3]:


plot(df$readingDates, df$readings, type = "b")



# In[4]:


# the file with the function definition must be available in the current directory
source("doublingPoints.R")

# Find the doubling points using the function previously developed

# In[5]:


doubling <- doublingPoints(df$readings)
df$readingDates[doubling]

# In[6]:


diff(df$readingDates[doubling], difference = 1)

# In[7]:


print(paste("The mean doubling time is", mean(diff(df$readingDates[doubling], difference = 1))))

