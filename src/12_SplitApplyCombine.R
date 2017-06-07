# calculate the mean GDP per continent
withGDP <- calcGDP(gapminder)
head(withGDP)
mean(withGDP[withGDP$continent == "Africa", "gdp"])
mean(withGDP[withGDP$continent == "Americas", "gdp"])
mean(withGDP[withGDP$continent == "Asia", "gdp"])

# plyr package
library("plyr")

# quickly calculate the mean GDP per continent
ddply(
  .data = calcGDP(gapminder),
  .variables = "continent",
  .fun = function(x) mean(x$gdp)
)
## dlply
dlply(
  .data = calcGDP(gapminder),
  .variables = "continent",
  .fun = function(x) mean(x$gdp)
)
## group columns
ddply(
  .data = calcGDP(gapminder),
  .variables = c("continent", "year"),
  .fun = function(x) mean(x$gdp)
)
## daply
daply(
  .data = calcGDP(gapminder),
  .variables = c("continent", "year"),
  .fun = function(x) mean(x$gdp)
)
str(daply(
  .data = calcGDP(gapminder),
  .variables = c("continent", "year"),
  .fun = function(x) mean(x$gdp)
))

# replace for loop
d_ply(
  .data = gapminder,
  .variables = "continent",
  .fun = function(x) {
    meanGDPperCap <- mean(x$gdpPercap)
    print(paste(
      "The mean GDP per capita for", unique(x$continent),
      "is", format(meanGDPperCap, big.mark=",")
    ))
  }
)

# Challenge 1
ddply(
  .data = gapminder,
  .variables = "continent",
  .fun = function(x) {
    mean(x$lifeExp)
  }
)

# Challenge 2
?ddply
avg_lifeExp_CY <- ddply(
  .data = gapminder[gapminder$year %in% c(1952, 2007), ],
  .variables = c("continent", "year"),
  .fun = function(x) {
    mean(x$lifeExp)
  }
)
avg_lifeExp_CY

# Challenge 3
str(avg_lifeExp_CY)
ddply(
  .data = avg_lifeExp_CY,
  .variables = "continent",
  .fun = function(x) {
     # max(x$V1) - min(x$V1)
     # x[x$year == 2007, "V1"] - x[x$year == 1952, "V1"]
     x[x$year == 2007, 3] - x[x$year == 1952, 3]
  }
)

# Challenge 4
ddply(
  .data = gapminder,
  .variables = "continent",
  .fun = function(dataGroup) {
    mean(dataGroup$lifeExp)
  }
)

