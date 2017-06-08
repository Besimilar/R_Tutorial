# dplyr package
install.packages("dplyr")
library("dplyr")

# Using select()
year_country_gdp <- select(gapminder, year, country, gdpPercap)
year_country_gdp
str(year_country_gdp)

# pipes grammar %>%
year_country_gdp <- gapminder %>% select(year, country, gdpPercap)
year_country_gdp

# Using filter()
year_country_gdp_euro <- gapminder %>%
  filter(continent == "Europe") %>%
  select(year, country, gdpPercap)
str(year_country_gdp_euro)

# Challenge 1
lifeExp_country_year_africa <- gapminder %>%
  filter(continent == "Africa") %>%
  select(year, country, lifeExp)
lifeExp_country_year_africa
nrow(lifeExp_country_year_africa)

# Using group_by() and summarize()
str(gapminder)
str(gapminder %>% group_by(continent))
gapminder_group <- gapminder %>% group_by(continent)

# Using summarize
gdp_bycontinents <- gapminder %>%
  group_by(continent) %>%
  summarize(mean_gdpPercap = mean(gdpPercap))
gdp_bycontinents

# Challenge 2
lifeExp_bycontinents <- gapminder %>%
  group_by(continent) %>%
  summarize(mean_lifeExp = mean(lifeExp))
lifeExp_bycontinents
lifeExp_bycountry <- gapminder %>%
  group_by(country) %>%
  summarize(mean_lifeExp = mean(lifeExp))
lifeExp_bycountry
lifeExp_bycountry %>% 
  filter(mean_lifeExp == min(mean_lifeExp) | mean_lifeExp == max(mean_lifeExp))
## arrange() 
lifeExp_bycountry %>%
  arrange(mean_lifeExp) %>%
  head(1)
lifeExp_bycountry %>%
  arrange(desc(mean_lifeExp)) %>%
  head(1)

# Multiple groups and variables
gdp_bycontinents_byyear <- gapminder %>%
  group_by(continent, year) %>%
  summarize(mean_gdpPercap = mean(gdpPercap))
gdp_bycontinents_byyear
gdp_pop_bycontinents_byyear <- gapminder %>%
  group_by(continent, year) %>%
  summarize(mean_gdpPercap = mean(gdpPercap),
            sd_gdpPercap = sd(gdpPercap),
            mean_pop = mean(pop),
            sd_pop = sd(pop)
            )
gdp_pop_bycontinents_byyear

# count() and n()
gapminder %>% 
  filter(year == 2002) %>%
  count(continent, sort = TRUE)
## standard error of life expectency per continent
?sd()
gapminder %>% 
  group_by(continent) %>%
  summarize(se_pop = sd(lifeExp)/sqrt(n()))

# Using mutate()
# create new variables prior to or even after summarizing information 
gdp_pop_bycontinents_byyear <- gapminder %>%
  mutate(gdp_billion = gdpPercap * pop / 10 ^ 9) %>%
  group_by(continent, year) %>%
  summarize(mean_gdpPercap = mean(gdpPercap),
            sd_gdpPercap = sd(gdpPercap),
            mean_pop = mean(pop),
            sd_pop = sd(pop),
            mean_gdp_billion = mean(gdp_billion),
            sd_gdp_billion = sd(gdp_billion)
            )
gdp_pop_bycontinents_byyear

# Connect mutate with logical filtering: ifelse
# a fast and powerful way of discarding certain data (even though the overall dimension of the data.frame will not
# change) or for updating values depending on this given condition
## keep all data but "filtering" after a certain condition
## calculate GDP only for people with a life expectation above 25
gapminder %>%
  arrange(lifeExp) %>%
  head(6)
gdp_pop_bycontinents_byyear_above25 <- gapminder %>%
  mutate(gdp_billion = ifelse(lifeExp > 25, gdpPercap * pop / 10 ^ 9, NA)) %>%
  group_by(continent, year) %>%
  summarize(mean_gdpPercap = mean(gdpPercap),
            sd_gdpPercap = sd(gdpPercap),
            mean_pop = mean(pop),
            sd_pop = sd(pop),
            mean_gdp_billion = mean(gdp_billion),
            sd_gdp_billion = sd(gdp_billion))
gdp_pop_bycontinents_byyear_above25

# Combining dplyr and ggplot2
# Get the start letter of each country
starts.with <- substr(gapminder$country, start = 1, stop = 1)
starts.with
# Filter countries that start with "A" or "Z"
az.countries <- gapminder[starts.with %in% c("A", "Z"), ]
az.countries
# Make the plot 
ggplot(data = az.countries, aes(x = year, y = lifeExp, color = continent)) +
  geom_line() + facet_wrap( ~ country)
## using dplyr
gapminder %>%
  # get the start letter of each country
  mutate(startsWith = substr(country, start = 1, stop = 1)) %>%
  # Filter countries that start with "A" or "Z"
  filter(startsWith %in% c("A", "Z")) %>%
  # Make the plot 
  ggplot(aes(x = year, y = lifeExp, color = continent)) +
  geom_line() + 
  facet_wrap( ~ country)
gapminder %>%
  # Filter countries that start with "A" or "Z"
  filter(substr(country, start = 1, stop = 1) %in% c("A", "Z")) %>%
  # Make the plot 
  ggplot(aes(x = year, y = lifeExp, color = continent)) +
  geom_line() + 
  facet_wrap( ~ country)

# Advanced Challenge
lifeExp_2countries_bycontinents <- gapminder %>%
  filter(year == 2002) %>%
  group_by(continent) %>%
  sample_n(2) %>%
  summarize(mean_lifeExp = mean(lifeExp)) %>%
  arrange(desc(mean_lifeExp))
lifeExp_2countries_bycontinents
gapminder %>%
  filter(year == 2002, continent == "Oceania")
