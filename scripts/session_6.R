#=============
# R4ScHARR 
# Robert Smith, Paul Schneider & Sarah Bates
# Session 6 Script
#============= 


#====================#
#  For loops ----
#====================#

# For loops can be used to repeat the same action multiple times without lots of 
# lines of code. This is a simple function to print list of numbers
for(i in 1:10) {                                           
  
  print(i)                                               
}

# It's useful to when applying a function to all rows or columns of a dataset

# recreate simple data frame used previously

height <- c(1.38,1.45,1.21,1.56) # combine is used to create the vector.
weight <- c(45,42,43,50)
first_name <- c("Alice","Bob","Harry","Jane")
sex <- factor(x = c("F","M","M","F"))
df <- data.frame(height,weight,first_name,sex)
df$bmi <- df$weight / df$height^2 

# use the for loop to report each persons height
for (i in 1:nrow(df)) {
  
  # print combination of the value in column 3 (first name) with the value in column 1 (height)
  print(paste0(df[i,3], " is ",df[i,1], "m tall"))
  
}

# use the for loop to change the variable name (column)

for(i in 1:ncol(df)) {          
  
  # change the name of each column to var followed by the column number
  colnames(df)[i] <- paste0("Var_", i)              
}







#====================#
# 4.2 Custom functions ----
#====================#

# Creating a custom function can be really useful - reduces lines of code and makes work
# easily reproducible, clearer and more organised

# The structure of a function is:

#  function_name <- function(arg1, arg2, ... ){
#   statements
#    return(object)
# }

# Here's a simple example 

f_simple <- function(x,y,z){
  
  value = x + y - z
  
  return(value)
  
}

# to see the details of the function you can just run the name
f_simple

# to run the function, add the argument in brackets

f_simple(1,2,3)
f_simple(6,5,12)


