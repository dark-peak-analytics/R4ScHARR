# ____RECAP EXERCISE -----

# 1. check the working environment, clear it if necessary
ls()
rm(list=ls())

# 2. load framingham data 
dat <- read.csv("./data/df_framingham.csv")
head(dat)

# 3. What percentage of participants has a systolic BP over 140?
# (hint: you can use nrow(...) on a data frame, or length(...) on a vector
sum(dat$sysBP > 140, na.rm = T) / length(dat$sysBP)
# OR
sum(dat$sysBP > 140, na.rm = T) / nrow(dat)

# 4. create a new column in dat which gives the age in months, instead of years
dat$month_age = dat$age * 12

# 5. what is the maximum value for the age in months?
max(dat$month_age)

# 6. create a data frame which only contains 
# male participants with a chronic heart disease (TenYearCHD) 
new_dat = dat[dat$sex == "male" & dat$TenYearCHD==1,]
# OR
new_dat1 = dat[dat$TenYearCHD==1,]
new_dat2 = new_dat1[new_dat1$sex == "male",]

# 7. create a scatter plot with age on the x, and BMI on the y axis
plot(x=dat$age, y=dat$BMI)

