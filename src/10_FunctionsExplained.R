# load functions
source("functions/10_functions-lesson.R")

# load data
gapminder <- read.csv("data/gapminder-FiveYearData.csv")

head(calcGDP(gapminder, year = 2007))

calcGDP(gapminder, country="China")

calcGDP(gapminder, year = 2007, country = "Australia")

# Challenge 3
calcGDP(dat = gapminder, year = c(1952, 1987), country = "New Zealand")
calcGDP(dat = gapminder, year = 1952, country = "New Zealand")

# Challenge 4
best_practice <- c("Write", "programs", "for", "people", "not", "computers")
paste(best_practice, collapse = " ")
fence(best_practice, "***")

