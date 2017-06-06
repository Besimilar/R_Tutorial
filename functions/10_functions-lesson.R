my_sum <- function(a, b) {
  the_sum <- a + b
  return(the_sum)
}

fahr_to_kelvin <- function(temp) {
  kelvin <- ((temp - 32) * (5 / 9)) + 273.15
  return(kelvin)
}

# freezing point of water
# fahr_to_kelvin(32)

# boiling point of water
# fahr_to_kelvin(212)

# Challenge 1
kelvin_to_celsius <- function(temp) {
  celsius <- temp - 273.15
  return(celsius)
}

# Combining functions
fahr_to_celsius <- function(temp) {
  celsius <- kelvin_to_celsius(fahr_to_kelvin(temp))
  return(celsius)
}
# fahr_to_celsius(212)

# takes a dataset and multiplies the population column
# with the GDP per capita column
calcGDP <- function(dat) {
  gdp <- dat$pop * dat$gdpPercap
  return(gdp)
}

# calcGDP(head(gapminder))

# takes a dataset and multiplies the population column
# with the GDP per capita column
calcGDP <- function(dat, year = NULL, country = NULL) {
  if(!is.null(year)) {
    dat <- dat[dat$year %in% year, ]
  }
  if(!is.null(country)) {
    dat <- dat[dat$country %in% country, ]
  }
  gdp <- dat$pop * dat$gdpPercap
  
  new <- cbind(dat, gdp = gdp)
  return(new)
}

# Challenge 4
fence <- function(text, wrapper) {
  text <- c(wrapper, text, wrapper)
  paste(text, collapse = " ")
}

