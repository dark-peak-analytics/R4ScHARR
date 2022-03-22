#=============#
# R4ScHARR 
# Robert Smith, Paul Schneider & Sarah Bates
# Session 4 Script
#=============#

#=============#
# Check your R environment  -----
#=============#

# check
ls()

# clear the clutter
rm(list = ls())

# re-check
ls()

#=============#
# Importing data -----
#=============#

# csv = comma separated values
## Local file path
dat <- read.csv("./data/df_framingham.csv")

## Downloading files from the internet
# dat <- read.csv("https://raw.githubusercontent.com/ScHARR-PHEDS/R4ScHARR/master/data/df_framingham.csv")

#====================#
# Plotting your data: the histogram ----
#====================#

hist(dat$sysBP, breaks = 25)
# add a line indicating the mean
abline(v = BP_mean, col = "blue",lwd = 3)   # Why does this not work?

# Let's try again...
BP_mean <- mean(dat$sysBP,na.rm = T)
abline(v = BP_mean, col = "blue",lwd = 3)

#====================#
# Plotting your data: the scatter plot ----
#====================#
plot(x = dat$age, y = dat$sysBP)


#====================#
# Linear regression ----
#====================#

# fit a model
fit.1 = lm(sysBP ~ age, data = dat)
# show summary results
summary(fit.1)
# compute 95% confidence intervalls
confint(fit.1)


# We can now add the regression line to the scatter plot
# plot(x = dat$age, y = dat$sysBP)
abline(fit.1, col = "red", lwd = 5)

# extract model coefficients
fit.1$coefficients
# Use coefficients to make predictions
fit.1$coefficients[1] + 50 * fit.1$coefficients[2]
# or use the 'predict' function for this:
 predict(fit.1, newdata = data.frame(age=40))


# --------------------- #
# Exercise 3 - Prelude ----
# --------------------- #

# Number of males and females in the data set
table(dat$sex)

# Bloodpressure by sex
## using a boxplot 
boxplot(dat$sysBP ~ dat$sex)
# no difference?

mean(dat$sysBP[dat$sex=="female"],na.rm = T)
mean(dat$sysBP[dat$sex=="male"], na.rm = T)
# indeed it seems, no difference
t.test(x = dat$sysBP[dat$sex=="female"], y = dat$sysBP[dat$sex=="male"])

# multivariate regression
fit.multi = lm(sysBP ~ age + sex, data = dat)
summary(fit.multi)

# regressions seems to confirm this: 
# no difference in blood pressure between males and females?


# However, this is actually not what we would expect, as the literature on this topic
# is very clear in that there are significant differences in the diagnosis of
# blood pressure between males and females

# It's your job now to find out what is going on.
# Divide into 2 teams: one uses a male-only data set, the other a females-only dataset
# repeat the analysis for the subgroup and compare results






# ----------------------#
# Exercise 3 - SOLUTION -----
# ----------------------#

# Any questions/problems?

# Ask for answers to questions 3.11 and 3.12

# Any ideas what is going on here?

# Show:

## subgroup regressions
fit_f <- lm(sysBP ~ age , data = dat[dat$sex == "female",])
summary(fit_f)

fit_m <- lm(sysBP ~ age , data = dat[dat$sex == "male",])
summary(fit_m)

## plot with subgroup lines
plot(dat$age,dat$sysBP)
abline(fit_f, col = "orange",lwd = 3) # females
abline(fit_m, col = "magenta",lwd = 3) # males

# Interaction!
# need an interaction term
fit.int = lm(sysBP ~ age * sex, data = dat)
summary(fit.int) # sig.

# --> explore your data before running analysis!
# use plots, subsets, and summary stats to get a feel for the
# variables you are dealing with.
