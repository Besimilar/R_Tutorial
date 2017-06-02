# if 
# sample a random number from a Poisson distribution
# with a mean (lambda) of 8
?rpois()
x <- rpois(1, lambda = 8)
if (x >= 10) {
  print("x is greater than or equal to 10")
}
x

set.seed(10)
x <- rpois(1, lambda = 8)
if (x>=10) {
  print("x is greater than or equal to 10")
} else if (x > 5){
  print ("x is greater than 5")
} else {
  print("x is less than 5")
}
x

# Challenge 1
head(gapminder)
if (any(gapminder$year == 2002)) {
  print("2002")
}
if (any(gapminder$year == 2012)) {
  print("2012")
}
gapminder[(gapminder$year == 2002), ]
gapminder[(gapminder$year == 2012), ]

# Repeating operations
# for()
for (i in 1:10) {
  print(i)
}
for (i in 1:5) {
  for (j in c('a', 'b', 'c', 'd', 'e')) {
    print(paste(i,j))
  }
}
## save to objects
output_vector <- c()
for (i in 1:5) {
  for(j in c('a', 'b', 'c', 'd', 'e')) {
    temp_output <- paste(i,j)
    output_vector <- c(output_vector, temp_output)
  }
}
output_vector
## don't grow your results
## a better way to define your empty output object
output_matrix <- matrix(nrow=5, ncol=5)
output_matrix
j_vector <- c('a', 'b', 'c', 'd', 'e')
for (i in 1:5) {
  for (j in 1:5) {
    temp_j_value <- j_vector[j]
    temp_output <- paste(i, temp_j_value)
    output_matrix[i,j] <- temp_output
  }
}
output_matrix
output_vector2 <- as.vector(output_matrix)
output_vector2

# While loops
z <- 1
while(z > 0.1) {
  z <- runif(1)
  print(z)
}

# Challenge 2
all.equal(output_vector2, output_vector)
output_matrix <- matrix(nrow=5, ncol=5)
output_matrix
j_vector <- c('a', 'b', 'c', 'd', 'e')
for (i in 1:5) {
  for (j in 1:5) {
    temp_j_value <- j_vector[j]
    temp_output <- paste(i, temp_j_value)
    output_matrix[j,i] <- temp_output
  }
}
output_matrix
output_vector2 <- as.vector(output_matrix)
all.equal(output_vector2, output_vector)
output_matrix
t(output_matrix)

# Challenge 3
head(gapminder)
unique(gapminder$continent)
levels(gapminder$continent)
for( iContinent in unique(gapminder$continent)) {
  tmp <- mean(subset(gapminder, continent == iContinent)$lifeExp)
  cat("Average Life Expectancy in", iContinent, "is", tmp, "\n")
  rm(tmp)
}
threshold <- 50
for( iContinent in unique(gapminder$continent)) {
  tmp <- mean(gapminder[gapminder$continent == iContinent, ]$lifeExp)
  if (tmp > threshold) {
    cat("Average Life Expectancy in", iContinent, "is", tmp, "greater than", threshold, "\n")
  } else {
    cat("Average Life Expectancy in", iContinent, "is", tmp, "less than", threshold, "\n")
  }
  rm(tmp)
}

# Challenge 4
unique(gapminder$country)
for (iCountry in unique(gapminder$country)) {
  
  tmp <- mean(subset(gapminder, country == iCountry)$lifeExp)
  if (tmp < 50) {
    cat(iCountry, ": ", tmp, "is less than 50 \n")
  } else if (tmp >=50 && tmp <70) {
    cat(iCountry, ": ", tmp, "is bettween 50 and 70 \n")
  } else {
    cat(iCountry, ": ", tmp, "is greater than 70 \n")
  }
  
  rm(tmp)
}

# Challenge 5
head(gapminder)
unique(gapminder$country)
grep("^B", unique(gapminder$country))
grep("B", unique(gapminder$country))
grep("b", unique(gapminder$country))
grep("^B", unique(gapminder$country), value = TRUE)
candidateCountries <- grep("^B", unique(gapminder$country), value = TRUE)
candidateCountries
for (iCountry in candidateCountries) {
  tmp <- mean(subset(gapminder, country == iCountry)$lifeExp)
  
  if (tmp < 50) {
    cat(iCountry, ":", tmp, "less than 50 \n")
    
    # Plot
    with(
      subset(gapminder, country==iCountry),
      plot(
        year, lifeExp,
        type = 'o',
        main = paste("Life Epectancy in ", iCountry),
        ylab = "LifeExp",
        xlab = "Year"
        )
      )
  }
  
  rm(tmp) 
}
