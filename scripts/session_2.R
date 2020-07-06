#=============
# R4ScHARR 
# Robert Smith & Paul Schneider
# Session 2 Script
#=============

rm(list = ls())

#====================#
# Object Classes ----
#====================#

# numeric
height <- c(1.38,1.45,1.21,1.56)
height
# numeric
weight <- c(31,35,28,40)
weight
class(weight)
# character
first_name <- c("Alice","Bob","Harry","Jane")
first_name
#first_name + 1 # error
# factor
sex <- factor(x = c("F","M","M","F"))
sex
# logical
tall <- height > 1.5

#=====================#
# Operations on different data structures

#Adding:
c(1,2,3) + 1
c(1,2,3) + c(1,2,3)
#multiplication
heightft <- height*3.28
# concatenating
c(height,weight)
# concatenating to string
c(height,weight,first_name)


## Basic object Types

# data frame- columns are variables, rows are observations.
df <- data.frame(height,weight,first_name,sex)
df
# we can select a single variable within the dataframe using the dollar sign.
df$height
# We can add a new variable easily, in this case based on other variables within the dataframe.
df$bmi <- df$weight / df$height^2 
df


## Subsetting

# Our data-frame contains the height, weight, first name and bmi of 4 individuals.
df
#To subset a data frame we can use square brackets i.e df[row,column]
#Selecting a column(s)
df$height
df[,"height"]
df[,1]
df[,1:3]
df[,c(1,3)]
#selecting a row(s)
df[1,]
#We might also want to select observations (rows) based on the characteristics of the data
#E.g. we might want to only look at the data for people who are taller than 1.75m
#create a logical variable called min_height which contains T/F for each individual being over 175cm.
min_height <- df$height >= 1.75
min_height
# Subset the data to include only those observations (rows) for which height > 175cm (using min_height).
df.at_least_175 <- df[min_height,]
df.at_least_175
#People smaller than 1.75m
# Subset the data to include only those who are not above min-height of 175cm.
smaller <- df$height < 1.75
df[smaller,]
df[!min_height,]


