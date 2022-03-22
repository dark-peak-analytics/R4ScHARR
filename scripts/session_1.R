#=============#
# R4ScHARR 
# Robert Smith, Paul Schneider & Sarah Bates
# Session 1 Script
#=============#

rm(list = ls())

#=====================#
# Basic operations ----
#=====================#

# add 1 to 1. 
1 + 1
# divide 12 by 4
12/4
# times 3 by 7
3*7
# 10 to the power 3
10^3
# root isn't a basic operation so we will look at this later.

# order of operations:
5*6+2
5*(6+2)

#=====================#
# Objects ----
#=====================#

# create an object x which is 3
x <-  3
# create an object y which is 5
y <-  5
# add x and y
x + y
# overwrite x so it now equals 4.
x <-  4
# add x and y again, now the result is 9, not 7.
x + y
# create another object z which is equal to x + y at this time.
z <- x + y
z

#========================#
# Manipulate Objects  ----
#========================#

a <- 10
a
# add one to a. A is now 11.
a <- a + 1 
a 
# create an object called b which is 5 less than a
b <- a - 5
b
# change a to be 5 less than it was originally
a <- a - 5
a-b
# a and b are equal!!


#=====================#
# See our Objects  ----
#=====================#

# prints the objects in the environment
ls()

#=====================#
# Removing Objects ----
#=====================#


# sometimes we may want to remove an object.
rm(a)
# multiple objects at once
rm(x,y)
# remove all objects
rm(list=ls())

#=====================#
#    Evaluations   ----
#=====================#


# simple evaluations
# 4 is greater than 2
4 > 2
# 4 is greater than 5
4 > 5
# 4 is equal to 3, note double == for an evaluation
4 == 3
# 4 is not equal to 3, note != is not equal to.
4 != 3
# the character x is equal to the character x.
"dog" == "dog"
"dog" == "cat"
# the output from an evaluation can be stored as an object, x. This object can be subject to operations & manipulations.
b <- 4<2
b


