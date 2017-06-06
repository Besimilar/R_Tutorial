# 3 Main plotting systems: the base plotting system, the lattice package, the ggplot2 package
getwd()
setwd("~/Documents/R/R_Tutorial/")
gapminder <- read.csv("data/gapminder-FiveYearData.csv")

# ggplot2
library("ggplot2")
head(gapminder)
## This function lets R know that we’re creating a new plot, 
## and any of the arguments we give the ggplot function are the global options for the plot: they apply to all layers on the plot.
ggplot(data = gapminder, aes(x = gdpPercap, y=lifeExp))
ggplot(data = gapminder, aes(x = gdpPercap, y=lifeExp)) + 
  geom_point() ## we want to visually represent the relationship between x and y as a scatterplot of points

# Challenge 1
str(gapminder)
names(gapminder)
attributes(gapminder)
ggplot(data = gapminder, aes(x = year, y=lifeExp)) +
  geom_point()

# Challenge 2
ggplot(data = gapminder, aes(x = year, y = lifeExp, color = continent)) + 
  geom_point()

## Instead of adding a geom_point layer, we’ve added a geom_line layer. 
## We’ve added the by aesthetic, which tells ggplot to draw a line for each country.
ggplot(data = gapminder, aes(x = year, y = lifeExp, by=country, color = continent)) + 
  geom_line()

ggplot(data = gapminder, aes(x=year, y=lifeExp, by=country, color=continent)) +
  geom_line() + geom_point()

ggplot(data = gapminder, aes(x=year, y=lifeExp, by=country)) +
  geom_line(aes(color=continent)) + geom_point()

### Setting an aesthetic to a value instead of a mapping
ggplot(data = gapminder, aes(x=year, y=lifeExp, by=country)) +
  geom_line(color="blue") + geom_point()
## Aesthetic mappings describe how variables in the data are mapped to visual properties (aesthetics) of geoms.
?aes

# Challenge 3
ggplot(data = gapminder, aes(x=year, y=lifeExp, by=country)) +
  geom_point() + geom_line(aes(color=continent))

# Transformations and statistics
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp, color=continent)) +
  geom_point()
## We can also modify the transparency of the points, 
## using the alpha function, which is especially helpful when you have a large amount of data which is very clustered.
## Change the scale of units on the x axis using the scale functions.
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(alpha = 0.5) + scale_x_log10()

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(alpha = continent))+ scale_x_log10()

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point() + scale_x_log10() + geom_smooth(method="lm") ## loess smooth (local regression)
?geom_smooth
## make the line thicker
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) + 
  geom_point() + scale_x_log10() + geom_smooth(method = "lm", size = 1.5)

# Challenge 4a
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(size = 3, color = "orange") + scale_x_log10() +
  geom_smooth(method = "lm", size = 1.5)
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(color = continent)) + scale_x_log10() +
  geom_smooth(method = "lm", size = 1.5)
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(color = "red") + scale_x_log10() +
  geom_smooth(method = "lm", size = 1.5)

# Challenge 4b
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(color = continent, shape = continent)) +
  scale_x_log10() +
  geom_smooth(method = "lm", size = 1.5)
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp, color = continent)) +
  geom_point(shape = 17) +
  scale_x_log10() +
  geom_smooth(method = "lm", size = 1.5)
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp, color = continent)) +
  geom_point(aes(shape = continent)) +
  scale_x_log10() +
  geom_smooth(method = "lm", size = 1.5)

# Multi-panel figures
# split data out over multiple panels by adding a layer of facet panels.
gapminder$country
starts.with <- substr(gapminder$country, start = 1, stop = 1)
az.countries <- gapminder[starts.with %in% c("A", "Z"), ]
typeof(starts.with %in% c("A", "Z"))
str(starts.with %in% c("A", "Z"))
ggplot(data = az.countries, aes(x = year, y = lifeExp, color = continent)) +
  geom_line() + facet_wrap( ~ country) ## it took a formula as its argument, denoted by "~"
unique(az.countries$country)
str(gapminder) 

# Modifying next
## The theme layer controls the axis text, and overall text size
## The scales layer controls legend title
ggplot(data = az.countries, aes(x = year, y = lifeExp, color = continent)) +
  geom_line() + facet_wrap(~ country) +
  xlab("Year") + ylab("Life expectancy") + ggtitle("Figure 1") +
  scale_colour_discrete(name = "Continent") +
  theme(axis.text.x = element_blank(), axis.ticks.x = element_blank())

# Challenge 5
ggplot(data = gapminder, aes(x = gdpPercap, fill = continent)) + 
  geom_density(alpha = 0.6) + facet_wrap(~ year) + scale_x_log10()

gapminder[gapminder$gdpPercap > 60000, ]
gapminder$gdpPercap > 60000
