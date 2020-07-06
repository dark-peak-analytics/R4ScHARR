#=============
# R4ScHARR 
# Robert Smith & Paul Schneider
# Session 3 Script
#=============

rm(list = ls())

#====================#
# Keeping Track of progress in R ----
#====================#

getwd()      # this line of code sets the working directory.
paste("RRRRR")  # this line of code pastes RRRRR.
#paste("RRRR") # this line doesn't

#====================#
# Setting Working Directory ----
#====================#

getwd()

filename = "C:/Users/Robert/Google Drive/Teaching/R Course/Intro_to_R"
setwd(filename)
getwd()

#====================#
# Importing Data ----
#====================#

### CSV (Comma-seperated values)

# car_Data <- read.csv(file = "car_Data.csv", header = TRUE)
# if you couldn't get that to work don't worry, this is an example dataset from base R.
car_Data <- mtcars

### Downloading files from the internet

# load the readr package, if this is not installed then install it.
#install.packages("readr")
library(readr)
#use the function read_csv
car_Data <- read_csv("https://raw.githubusercontent.com/RobertASmith/Intro_to_R/master/car_Data.csv", header = TRUE)

#====================#
# Summarising Data ----
#====================#

# head data with default 6 rows
head(car_Data)

# head data with 10 rows
head(car_Data, n = 10)

# summarise the data,
summary(car_Data)
# summarise single variable
summary(car_Data$mpg)

temp <- summary(car_Data$mpg)
Median  <- temp['Median']
Range   <- temp['Max.'] - temp['Min.']

#====================#
# Plotting Data ----
#====================#


plot(x = car_Data$disp, y = car_Data$mpg)
#notice we can remove arguments and still get same result
plot(car_Data$disp, car_Data$mpg)

plot(x = car_Data$disp, y = car_Data$mpg, 
     type = "p", 
     xlab = "Displacement", 
     ylab = "Miles per Gallon",
     main = "MPG vs Engine Displacement")

hist1 <- hist(car_Data$mpg)
#We can alter the 'bins' by specifying the additional argument 'breaks = ' in the hist function
hist(car_Data$mpg, breaks = c(10,12.5,15,17.5,20,22.5,25,27.5,30,32.5,35))
#a neater way of doing the same as above is to use seq
hist(car_Data$mpg, breaks = seq(10,35, by = 2.5))
#we can again edit the title etc by adding extra arguments
hist(car_Data$mpg, 
     breaks = seq(10,35, by = 2.5),
     xlab = "Miles per gallon",
     main = "Histogram of Miles per Gallon")







