#Some preliminary code to work with Cory's affiliation data
#I don't actually know how you want to analyze this data yet, but I'm writing
#something so you can see how sharing r code on github works
#author: Jan Boyer
#inputs: Aff_R_20191213_01.csv           data that Cory sent me
#        Affiliation Trial Master 2.csv
#outputs:
#dependencies:

#packages used
#family of packages (dplyr, ggplot2) with lots of use for data wrangling and
#graphing. We used these packages a lot in the class
library(tidyverse)

# load data #######
#in an Rstudio project, rstudio assumes the project directory is the working
#directory. We abbreviate the project directory with a . and then only have to
#write the rest of the file path "./data/raw/filename.csv"

#This will work on any computer, as long as you are working in the Rstudio project
#read.csv("C:/users/jboyer/documents/filename.csv") won't work on another computer
#This is one reason why rstudio projects are great
aff1 <- read.csv("./data/raw/Aff_R_20191213_01.csv",
                 stringsAsFactors = FALSE)
aff.master <- read.csv("./data/raw/Affiliation Trial Master 2.csv",
                 stringsAsFactors = FALSE)


colnames(aff1) #see the column names
glimpse(aff1) #see an overview of dataframe, what class are columns?
#dates and times are currently character data, need to reclassify as date or time

#subset to only the number frames (I think this is the data Cory said he needs)
aff1 <- aff1 %>%
  filter(Frame >= 1) #filter to only rows where Frame is greater than 1

#Format dates and times
aff1 <- aff1 %>%
  mutate(Date = as.Date(Date, format = "%d-%b-%y"),
         datetime = as.POSIXct(paste(as.character(Date), Time)))

#save the dataframe
write.csv(aff1, "./data/clean/aff1.csv")

