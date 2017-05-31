# How to use source(): run all code in an R file
help()
a <- 0
b <- 1

# Function
# use Tab to auto-complete
# use ? to see help documents
exp(.5)
?exp()

# Comparison
1 == 1
1.2 == 1.2
all.equal(1.278, 1.2)
all.equal(1.278, 1.278)
?all.equal

# Vectorization
1:5
2^(1:5)
x <- 1:5
2^x

# Manage Environment
ls()
x <- 5
rm(x)
rm(list = ls())

# Packages
installed.packages()

# Challenge 3
mass <- 47.5
age <- 122
mass <- mass * 2.3 
age <- age - 20
mass > age

# Challenge 4
rm(age)
rm(mass)
rm(mass, age)

# Challenge 5
install.packages("ggplot2")
install.packages("plyr")
install.packages("gapminder")
