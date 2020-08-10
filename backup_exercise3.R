# Exercise - one group uses subset male and one female

# ------------------------------------
# 1. check you enviroment
ls()

# 2. clear old df 
rm(list = ls())

# 3. read in the data from a website 
# dat <- read.csv("URL")
dat <- read.csv("https://raw.githubusercontent.com/ScHARR-PHEDS/R4ScHARR/master/data/df_framingham.csv")


# 4. get an overview of the dataframe using the str functiom

# 5. look at the first few rows using the head function


# 6. how many NAs are there in sysBP?


# 7. remove all NAs and overwrite dat


# 8. subset dat by sex - either select males or females


# 9. what is the median sys bp in the subsetted dataframe?


# 8. what is the maximum BP?


# 10. what is the total range of BP values, i.e. the difference between the highest and the lowest?


# 11. plot a histogram of BP in males/females


# 12. plot the relationship between age and BP


# 13. fit a linear regression model and assign it to an object called fit_m,
# and use summary(model) to show results


# 14. add regression line to plot


# 15. what is the predicted BP in a 40 year old? 
