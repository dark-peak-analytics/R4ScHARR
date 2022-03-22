# Exercise - one group uses subset male and one female

# ------------------------------------
# 1. Use ls() to check your global enviroment
# Info: When starting a new project, you should check your global environment (= the objects existing in your R session) 
# and make sure you don't have old, useless objects hanging around.
ls()

# 

# 2. Clear the enviroment using the rm() function and check if it has worked.
# Info:You can use rm either with varibale names (c("varname_1", "varname_2",...)), or, to remove all objects, 
# you can use ls() itself as an argument for the function.
rm(list = ls())
ls()
# 3. Load the raw data set into your enviroment and get an overview using the str() function
# Info: dat <- read.csv("URL")
dat <- read.csv("https://raw.githubusercontent.com/ScHARR-PHEDS/R4ScHARR/master/data/df_framingham.csv")

# 4. Inspect the first few rows of the dat data frame
# Info:tail(dat) shows you the last few rows of the data frame.

# 5. How many NA does dat$sysBP have?
# Info: is.na(vector) returns T/1 if vector is NA, and F/0 otherwise.


# 6. Remove all rows with NA from dat


# 7. Create a subset of dat, either containing only females cases, in the case name our new dataframe dat_female
#    or only males, then call your new dataframe dat_male.

# 8. what is the median blood pressure (sysBP) in the subsetted dataframe?
# Info: Analogous to mean(), there is a function in R called median()!


# 9. What is the range (difference between highest and the lowest) of blood pressure values in your sample?
# Info: You may want to use the functions max() and min() for this.


# 10. Plot a histogram of BP in males/females
# Info: If you want, you can try to use the hist(...) function with an additional style argument: xlab = "Systolic blood pressure".

# 11. Fit a linear regression to model the association between sysBP and age.
#     Call the model either fit_m (for males) or fit_f (for females). Then use summary(model) to show results


# 12. Create a scatter plot for the relationship between age and systolic blood pressure in your subsample
#     Info: Use age for the x-axis, and sysBP for the y-axis in the plot() function. And then use the fit_f/fit_m object in the abline() function.


# 13. What is the predicted blood pressue of a 40 year old individual in your subsample?
# Info: Beta regression coefficients can be retrieved from fit_m$coefficients/ fit_f$coefficients.
