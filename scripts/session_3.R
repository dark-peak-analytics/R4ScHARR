#=============
# R4ScHARR 
# Robert Smith, Paul Schneider & Sarah Bates
# Session 3 Script
#=============

#=============
# Check your R enviroment  -----
#=============

# check
ls()

# clear the clutter
rm(list = ls())

# re-check
ls()

#=============
# Importing data -----
#=============

# csv = comma separated values
## Local file path
dat <- read.csv("./data/df_framingham.csv")

## Downloading files from the internet
# dat <- read.csv("https://raw.githubusercontent.com/ScHARR-PHEDS/R4ScHARR/master/data/df_framingham.csv")


#====================#
# Get an overview of the data set ----
#====================#
str(dat)

# a common error: NA
mean(dat$sysBP)

# Inspect the first few rows of the data set
head(dat)

# --> NA values spotted!

#====================#
# Missing values  ----
#====================#
dat$sysBP

is.na( dat$sysBP)
sum( is.na( dat$sysBP ) ) 

# remove cases with missing values
dat <- dat[!is.na(dat$sysBP), ]
# dat <- dat[complete.cases(dat$sysBP), ]


#====================#
# Simple stats ----
#====================#

# average blood pressure
mean(dat$sysBP)
# standard deviation
sd(dat$sysBP)

# you can assign function outputs to objects
BP_mean <- mean(dat$sysBP)
BP_sd <- sd(dat$sysBP)

# and use these objects afterwards
BP_mean -  1.96 * BP_sd
BP_mean +  1.96 * BP_sd
# 
# quantile(dat$heartRate, probs = c(0.05, 0.95))

