rm(list = ls())
# Lab 14 merging data files
#
# A set of sensor stations produces a file each with date and time of events 
#     (all of the same type).
# Each file has the name of the station, plus the suffix ".csv", all the
#     files are stored in a given directory
# Read the files and merge them in a single file, adding a column with the 
#     station name
# - Filter the rows whose observations are inside a given time span
# - consider only the months of the dates
# - produce a report of the counts of events by month and station
# 
# uses:
# - dataRelPath: path of the directory with the data files
# - fileNames: vector of the names of the files in the directory
# - labels: vector of the labels derived from the filenames
# - myData: dataframe with the merged data
# - myDataAdd: dataframe from individual file
# 
# Algo:
# set the working directory
# get the filenames with the appropriate library function
# generate labels vector from filenames, stripping ".csv"
# initialize the empty myData
# repeat varying i over all the positions of fileNames
#   read fileName[i] into myDataAdd
#   add column "label" initialized with labels[i] to myDataAdd
#   append myDataAdd to myData
# set startDate and endDate for filtering
# filter myData
# convert the dates into the months of the dates
# transform the months into factors ordered and with the appropriate labels
# produce the report with the function table()
# visualize the report
# 
setwd("~/Dropbox/Didattica/Informatics/0_R/R-lab")
# setwd("M:/Sartori/Informatics-R-Lab)
dataRelPath <- "lab14-data"
setwd(dataRelPath)
fileNames <- list.files(pattern = "*.csv")
# strip the extension from filenames
labels <- gsub(".csv$", "", fileNames)
# create empty data frame
myData <- data.frame()
for (i in seq_along(fileNames)) {
  # load the data from i-th file into a temporary data frame
  myDataAdd <- read.csv(fileNames[i], stringsAsFactors = F)
  # add the label column
  myDataAdd$label <- labels[i]
  # add the temporary data frame to the final one
  myData <- rbind(myData, myDataAdd)
}
startDate <- ISOdate(2016, 1, 1)
endDate <- ISOdate(2016,12,31)
myData <- myData[startDate <= myData$dt & myData$dt <= endDate,]
#myData <- myData[order(myData$dt),]
# next is necessary to use english month names, instead of 
# the localised month names of your computer
Sys.setlocale("LC_TIME", "C")
# add a new column with months
myData$month <- months(as.Date(myData$dt))
# transform months into factors
myData$month <- factor(myData$month
                    , ordered = T # the factor is ordered
                    , levels = month.name # the proper ordering of months
                    , labels = month.abb # use abbreviated months for output
                    )
# generate a table with absolute frequencies using 
# label and month columns
# columns are reordered as month-label (3,2)
# in this way, the table will have months in rows
myDataTable <- table(myData[,c(3,2)])
print(myDataTable)
#barplot(myDataTable)
#barplot((t(myDataTable)))
barplot((t(myDataTable))
       , beside = T
       , legend.text = T # colnames(myDataTable)
       , main = "Frequencies of events by month and station"
       , args.legend=list(
             x = ncol(myDataTable) -10
           , y = max(myDataTable)
         , bty = "n"
           )
       )

setwd("..")
