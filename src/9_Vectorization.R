gapminder <- read.csv("data/gapminder-FiveYearData.csv")
gapminder2 <- read.csv("data/gapminder-FiveYearData.csv")
library(ggplot2)

x <- 1:4
x * 2

y <- 6:9
x + y

# Challenge 1
head(gapminder)
str(gapminder)
popPerMillion <- gapminder$pop / 1e6
popPerMillion
gapminder <- cbind(gapminder, popPerMillion)
head(gapminder)
tail(gapminder)
## or
gapminder <- cbind(gapminder, popPerMillion)
head(gapminder)
gapminder <- gapminder[ , -7]
head(gapminder[["popPerMillion"]])
head(gapminder)
gapminder
all.equal(gapminder2, gapminder)
gapminder$pop_millions <- gapminder$pop / 1e6
head(gapminder)

# Challenge 2
ggplot(data = gapminder, aes(x = year, y = pop_millions)) +
  geom_point()
select_country <- gapminder[gapminder$country %in% c("China", "India", "Indonesia"), ]
head(select_country)
ggplot(data = select_country, aes(x = year, y = pop_millions)) +
  geom_line(aes(color = country))
?geom_point

# Comparison operators
x > 2
a <- x > 3
a
str(a)

# Functions
x <- 1:4
log(x)

# Matrix Multiplication
m <- matrix(1:12, nrow = 3, ncol = 4)
m
m * -1
m
m2 <- matrix(1, nrow = 4, ncol =1)
m2
m %*% m2
matrix(1:4, nrow = 1) %*% matrix(1:4, ncol = 1)

# Challenge 3
m
m ^ -1
m * c(1, 0, -1)
m > c(0, 20)
m * c(1, 0, -1, 2)

# Challenge 4
num <- 1:100
ans <- sum(1/(num^2))
ans
ans <- sum(1/(1:1e4)^2)
ans
## Method
inverse_sum_of_squares <- function(n) {
  sum(1/(1:n)^2)
}
inverse_sum_of_squares(100)
