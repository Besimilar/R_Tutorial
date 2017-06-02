x <- c(5.4, 6.2, 7.1, 4.8, 7.5)
names(x) <- c('a', 'b', 'c', 'd', 'e')
x

# Accessing elements using their indices
x[1]
x[c(1,3)]
x[1:4]
x[c(1,1,3)]
x[6]
x[0] ## in R, the 1st element is 1

# Skipping and removing elements
x[-2]
x[c(-1,-5)]
x[-c(1,5)]
x[-(1:3)] ## must be put into a bracket because of operation order
x <- x[-4]
x

# Challenge 1
x <- c(5.4, 6.2, 7.1, 4.8, 7.5)
names(x) <- c('a', 'b', 'c', 'd', 'e')
x
x[c(-1,-5)]
x[-c(1,5)]
x[2:4]
x[c('b','c','d')]

# Subsetting by names
x[c('a', 'c')]
x[-which(names(x) == 'a')]
names(x) == 'a'
which(names(x) == "a")
## skipping multiple named indices, but use a different comparison operator
x[-which(names(x) %in% c('a','c'))] ## %in% goes through each element of its left argument

# Challenge 2
x <- c(5.4, 6.2, 7.1, 4.8, 7.5)
names(x) <- c('a', 'b', 'c', 'd', 'e')
x
x[-which(names(x) == 'g')]
names(x) == 'g'
which(names(x) == 'g')
str(x)

# Non-unique names
## Columns can have the same name but row names must be unique
x <- 1:3
names(x) <- c('a', 'a', 'a')
x
x['a'] ## only returns the first value
x[which(names(x) == 'a')]

# Getting help for operators
?"%in%"
names(x) == c('a', 'c')  
x
names(x) %in% c('a', 'c')
names(x) == c('a', 'c', 'a')
names(x) == c('a', 'c', 'a','e')

# Subsetting through other logical operations
x
x[c(TRUE, TRUE, FALSE, FALSE)]
x[c(TRUE, TRUE, FALSE, FALSE, FALSE)]
x[c(TRUE, FALSE)] # recycled to the length of the vector we're subsetting
x[x>7]
x[x<4]
## Combining logical conditions
TRUE & c(TRUE, FALSE, TRUE)
TRUE && c(TRUE, FALSE, TRUE) ## only look at the first element of each vector and ignore the remaining elements
all(c(TRUE, FALSE, FALSE))
any(c(TRUE, FALSE, FALSE))

# Challenge 3
x <- c(5.4, 6.2, 7.1, 4.8, 7.5)
names(x) <- c('a', 'b', 'c', 'd', 'e')
x
x[x<7 & x>4]

# Handling special values
is.na(x)
is.nan(x)
is.infinite(x)
is.finite(x)
na.omit(x) # filter out all missing values from a vector

# Factor subsetting 
f <- factor(c("a", "a", "b", "c", "c", "d"))
str(f)
typeof(f)
f[f=="a"]
f[f %in% c("e","c", "b")]
f[1:3]
f[-3]

# Matrix subsetting
set.seed(1)
m <- matrix(rnorm(6*4), ncol=4, nrow=6)
m
m[3:4, c(3,1)]
m[, c(3,4)]
str(m[, c(3,4)])
m[3,]
str(m[3,])
m[3, , drop=FALSE] ## keep the output as a matrix
## Higher dimensional arrays
m
m[5] ## matrices are laid out in column-major format by default
m[10]
matrix(1:6, nrow=2, ncol=3)
matrix(1:6, nrow=2, ncol=3, byrow=TRUE)

# Challenge 4
m <- matrix(1:18, nrow=3, ncol=6)
m
m[2,4,2,5]
m[2:5]
m[4:5, 2]
m[2, c(4,5)]

# List subsetting
xlist <- list(a="Software Carpentry", b=1:6, data = head(iris))
xlist
xlist[1] # [] will always return a list
typeof(xlist[1])
str(xlist[1])
xlist[1:2]
xlist[[1]] # [[]] will extract individual elements of a list
str(xlist[[1]])
xlist[[1:2]] # you can't extract more than on element at once
xlist[[-1]] # nor use it to skip elements
xlist[["a"]]
xlist[["data"]]
xlist$data # $ function is a shorhand way for extracting elements by name

# Challenge 5
xlist[[2]]
which(xlist[[2]] == 2) 
xlist[[2]][2]
xlist$b[2]
xlist[['b']][2]
xlist[2]

# Challenge 6
gapminder <- read.csv("data/gapminder-FiveYearData.csv")
mod <- aov(pop ~ lifeExp, data=gapminder)
mod
attributes(xlist)
attributes(mod)
mod$df.residual
mod$residuals
mod$rank
?aov
?"~"

#Data frames
gapminder[3] ## [] with one argument will act the same as for lists
str(gapminder)
typeof(gapminder)
head(gapminder[3])
head(gapminder[["lifeExp"]])
head(gapminder$year)

typeof(gapminder[3])
str(gapminder[3])

gapminder[1:3, ] ## with two arguments, [] behaves the same way as the matrices
gapminder[3,] ## subset a single row: data frame
str(gapminder[3,]) 
gapminder[1:6,3] ## subset a single column: a vector
str(gapminder[1:6,3])
gapminder[1:6,3, drop=FALSE]

# Challenge 7
head(gapminder)
gapminder[gapminder$year == 1957,]
gapminder[,-(1:4)]
gapminder[gapminder$lifeExp >80,]
gapminder[c(1,4,5)]
gapminder[gapminder$year %in% c(2002,2007), ]

# Challenge 8
head(gapminder[1:6])
gapminder_small <- gapminder[c(1:9,19:23),]
gapminder_small
