# tidyr: transform your data regardless of original format
gapminder

# Getting started
install.packages("tidyr")
library("tidyr")
library("dplyr")
str(gapminder)

# From wide to long format with gather()
gap_wide <- read.csv("data/gapminder_wide.csv", stringsAsFactors = FALSE)
str(gap_wide)
tail(gap_wide)
gap_long <- gap_wide %>%
  gather(obstype_year, obs_values, starts_with("pop"),
         starts_with("lifeExp"), starts_with("gdpPercap"))
str(gap_long)
gap_long
unique(gap_long$obstype_year)
## not include
gap_long <- gap_wide %>% gather (obstrype_year, obs_values, -continent, -country)
gap_long
str(gap_long)
unique(gap_long$obstrype_year)
## split 
gap_long <- gap_long %>% 
  separate(obstype_year, into = c("obs_type", "year"), sep = "_")
str(gap_long)
gap_long$year <- as.integer(gap_long$year)
str(gap_long)

# Challenge 2
gap_long %>% group_by(continent, obs_type) %>%
  summarize(means = mean(obs_values))
gap_long

# From long to intermediate format with spread()
gap_normal <- gap_long %>% spread(obs_type, obs_values)
str(gap_normal)
gap_normal <- gap_normal[ , names(gapminder)]
str(gap_normal)
all.equal(gap_normal, gapminder)
gapminder$country <- as.character(gapminder$country)
gapminder$continent <- as.character(gapminder$continent)
str(gapminder)
all.equal(gap_normal, gapminder)
head(gapminder)
head(gap_normal)
## sort gap_normal
gap_normal <- gap_normal %>% arrange(country, continent, year)
all.equal(gap_normal, gapminder)

# Back to wide
## keep country and continent as ID variables and spread the obseravtions across the 3 metrics
## (pop, lifeExp, gdpPercap) and time (year).
str(gap_long)
gap_temp <- gap_long %>% unite(var_ID, continent, country, sep = "_")
str(gap_temp)
gap_temp <- gap_long %>%
  unite(ID_var, continent, country, sep = "_") %>%
  unite(var_names, obs_type, year, sep = "_")
str(gap_temp)
## spread()
gap_wide_new <- gap_long %>%
  unite(ID_var, continent, country, sep = "_") %>%
  unite(var_names, obs_type, year, sep = "_") %>%
  spread(var_names, obs_values)
str(gap_wide_new)
str(gap_wide)

# Challenge 3
gap_ludicrously_wide <- gap_long %>%
  unite(var_names, obs_type, year, country, sep = "_") %>%
  spread(var_names, obs_values)
str(gap_ludicrously_wide)

gap_wide_betterID <- separate(gap_wide_new, ID_var, c("continent", "country"), sep = "_")
str(gap_wide_betterID)
all.equal(gap_wide, gap_wide_betterID)
