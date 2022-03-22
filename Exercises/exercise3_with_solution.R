# Exercise - one group uses subset male and one female

# ------------------------------------
# MALE subset
# 1. check your enviroment
ls() # there will be a fake old object

# 2. clear old df 
rm(list = ls())

# 3. read in the data from a website 
dat <- read.csv("https://raw.githubusercontent.com/ScHARR-PHEDS/R4ScHARR/master/data/df_framingham.csv")
str(dat)

# 4. Inspect the first few rows of the dat data frame
head(dat)

# 5. how many NAs are there in sysBP?
sum(is.na(dat$sysBP))

# 6. remove all NAs and overwrite dat
dat <- dat[!is.na(dat$sysBP),]

# 7. Create a subset of dat, either containing only cases females, in that case name your new dataframe dat_female, 
# or only males, then call your new dataframe dat_male.
dat_male <- dat[dat$sex == "male",]

# 8. what is the median sys bp in the subsetted dataframe?
median(dat_male$sysBP)

# 9. What is the range (difference between highest and the lowest) of blood pressure values in your sample?
max(dat_male$sysBP) - min(dat_male$sysBP)

# 10. Create a histogram to view the disctribution of sysBP in your subsample.
hist(dat_male$sysBP)

# 11. Fit a linear regression to model the association between sysBP and age. 
# Call the model either fit_m (for males) or fit_f (for females). Then use summary() to inspect the details.
fit_m <- lm( sysBP ~ age,data = dat_male)
summary(fit_m)

# 12. Create a scatter plot for the relationship between age and systolic blood pressure in your subsample.
plot(dat_male$age, dat_male$sysBP)
abline(fit_m, col = "green", lwd = 3)

# 13. What is the predicted blood pressue of a 40 year old individual in your subsample?
fit_m$coefficients[1] + 40 * fit_m$coefficients[2] 



