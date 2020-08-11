# Exercise - one group uses subset male and one female

# ------------------------------------
# MALE subset
# 1. check your enviroment
ls() # there will be a fake old object

# 2. clear old df 
rm(list = ls())

# 3. read in the data from a website 
dat <- read.csv("https://raw.githubusercontent.com/ScHARR-PHEDS/R4ScHARR/master/data/df_framingham.csv")


# 4. get an overview using the str functiom
str(dat)

# 5. look at the first few rows
head(dat)

# 6. how many NAs are there in sysBP?
sum(is.na(dat$sysBP))

# 7. remove all NAs and overwrite dat
dat <- dat[!is.na(dat$sysBP),]

# 8. subset dat by sex
dat_male <- dat[dat$sex == "male",]

# 9. what is the median sys bp in the subsetted dataframe?
median(dat_male$sysBP)

# 8. what is the maximum BP?
max(dat_male$sysBP)

# 10. what is the total range of BP values, i.e. the difference between the highest and the lowest?
max(dat_male$sysBP) - min(dat_male$sysBP)

# 11. plot a histogram of BP in males/females
hist(dat_male$sysBP)

# 12. plot the relationship between age and BP
plot(dat_male$age, dat_male$sysBP)

# 13. fit a linear regression model and assign it to an object called fit_m,
# and use summary(model) to show results
fit_m <- lm( sysBP ~ age,data = dat_male)
summary(fit_m)

# 14. add regression line to plot
plot(dat_male$age, dat_male$sysBP)
abline(fit_m, col = "green", lwd = 3)

# 15. what is the predicted BP in a 40 year old? 
fit_m$coefficients[1] + 40 * fit_m$coefficients[2] 



