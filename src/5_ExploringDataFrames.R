# Adding columns and rows in data frame
## Add columns
cats
age <- c(2,3,55,12)
cats <- cbind(cats, age)
cats
age <- c(4,5,8)
cats <- cbind(cats, age)
cats
## Add rows
newRow <- list("tortoiseshell", 3.3, TRUE, 9)
cats <- rbind(cats, newRow)
cats
cats3 <- rbind(cats2, newRow)
cats3
## Add levels to factors
levels(cats$coat)
cats$coat
cats2$coat
levels(cats$coat) <- c(levels(cats$coat), 'tortoiseshell')
cats <- rbind(cats, list("tortoiseshell", 3.3, TRUE, 9))
cats
str(cats)
str(cats2)
str(cats3)
## Alternatively change a factor column to a character vector
cats$coat <- as.character(cats$coat)
str(cats)

# Removing rows
cats4 <- cats[-4,]
cats4
cats[c(-4,-5),]
## drop all rows with NA values
na.omit(cats)
cats <- na.omit(cats)
cats

# Appending to a data frame
cats <- rbind(cats, cats)
cats
rownames(cats) <- NULL
cats

# Challenge 1
df <- data.frame(first_name = c("David", "Rebecca"), 
                 last_name = c("Hu", "Yuan"),
                 luck_number = c(7, 16),
                 stringsAsFactors = FALSE)
df
df <- rbind(df, list("Wei", "Hu", 3))
df
df <- cbind(df, answer=c(TRUE, FALSE, FALSE))
df

# Realistic example
gapminder <- read.csv("data/gapminder-FiveYearData.csv")
str(gapminder)
typeof(gapminder$year)
typeof(gapminder$country)
length(gapminder)
typeof(gapminder)
nrow(gapminder)
ncol(gapminder)
dim(gapminder)
rownames(gapminder)
colnames(gapminder)
head(gapminder)

# Challenge 3
str(gapminder)
