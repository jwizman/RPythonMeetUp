#R/Python Meetup
##Meeting 2: Viewing Variables and Descriptive Statistics

##Import Data

#using basic data set
titanic <- read.csv (file="/Users/LadybirdII/Library/Mobile Documents/com~apple~CloudDocs/SMH Files/RPythonMeetUp/20200430_DescStats/titanic.csv", header=TRUE)

#to see what we're looking at
library(dplyr)
glimpse(titanic)

##Types of Variables in R

  #vectors can be numerical (doubles or integers), character, or logical (and factors, sorta)
  #matrices must have the same mode and same length; filed by column by default
  #data frames are like matrices but can have variables of mixed modes
  #factors store nominal values as a 'vector of integers' i.e. behind every factor is a number; 
    #factors can be ordered for ordinal variables

##Descriptive Statistics/Viewing Variables

#########Discrete Variables#######

#Base R
#frequency tables
  table(titanic$Sex, useNA="always")
  table(titanic$Sex, titanic$Pclass, useNA="always")
#proportion table
  prop.table(table(titanic$Sex, useNA="always"))
#cross-tabbed proportion table
  #% by cell 
  prop.table(table(titanic$Sex, titanic$Pclass)) #10% of all passengers are 1st class females
  #% by row
  prop.table(table(titanic$Sex, titanic$Pclass), 1) #45% of women were 3rd class passengers
  #% by column
  prop.table(table(titanic$Sex, titanic$Pclass), 2) #41% of 2nd class passengers were women

#Packages
#summarytools
  library(summarytools) #note: I can't run this for some reason
  freq(titanic$Sex) #frequency table
    freq(titanic$Siblings.Spouses.Aboard, order = "freq", rows = 1:2) #not amazing example but shows freq table for top 2 occurences
    print(ctable(x = titanic$Sex, y = titanic$Pclass, prop = "r"), #cross tab with percentage and frequencies
          method = "render")
#Cross Table function through gmodels  
  library(gmodels)
  CrossTable(titanic$Sex, titanic$Pclass, format="SAS")
  
###########IR variables#############
#summary statistics
  range(titanic$Fare)
  sd(titanic$Fare)
  summary(titanic$Fare)
  summary(titanic)
#choose-your-own bin size
  quantile(titanic$Age, seq(0,1,0.1))
    #seq(start, end, bin size)


#Subsetting with logical operators; for IR and Discrete variables
table(titanic$Sex)
  table(subset(titanic, Age < 18)$Sex)
  table(subset(titanic, (Age < 18) | (Age > 60))$Sex)

  table(subset(titanic, Sex = "female" & Age < 18)$Pclass)
  

  
  
  
  
  
#Formatting in Base R

#Formatting with dplyr/tidyr