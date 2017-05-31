# Load Data into R
cats <- read.csv(file = "data/feline-data.csv")
cats

# View Data
cats$weight
typeof(cats$weight)
cats$coat
typeof(cats$coat)

## Say we discovered that the scale weighs two kg light:
cats$weight + 2
paste("My cat is", cats$coat)

# Data Type
typeof(cats$weight)
typeof(1)
typeof(3.14)
typeof(1L)
typeof(1+1i)
typeof(TRUE)
typeof('banana')
typeof("banana")

# Use data in same types
file.show("data/feline-data_v2.csv")
cats <- read.csv(file="data/feline-data_v2.csv")
cats
cats$weight
cats$weight + 2
typeof(cats$weight)
class(cats)

cats <- read.csv(file = "data/feline-data.csv")

# Vectors and Type Coercion
?vector
my_vector <- vector(length = 3)
my_vector
str(my_vector)

another_vector <- vector(mode='character', length=3)
another_vector
str(another_vector)

?str
str(cats$weight)

combine_vector <- c(2,6,3)
combine_vector
quiz_vector <- c(2,6,'3')
quiz_vector
str(quiz_vector)

coercion_vector <- c('a', TRUE)
coercion_vector
another_coercion_vector <- c(0, TRUE)
another_coercion_vector

# Coercion
character_vector_example <- c('0', '2', '4')
character_vector_example
character_coerced_to_numeric <- as.numeric(character_vector_example)
character_coerced_to_numeric
numeric_coerced_to_logical <- as.logical(character_coerced_to_numeric)
numeric_coerced_to_logical

cats$likes_string
cats$likes_string <- as.logical(cats$likes_string)
cats$likes_string

# c() to append things to an existing vector
ab_vector <- c('a', 'b')
ab_vector
combine_example <- c(ab_vector, 'SWC')
combine_example

mySeries <- 1:10
mySeries
seq(10)
seq(1,10, by=0.1)
str(seq(1,10, by=0.1))

sequence_example <- seq(10)
head(sequence_example, n=2)
tail(sequence_example, n=4)
length(sequence_example)
class(sequence_example)

sequence_example
str(sequence_example)
typeof(sequence_example)

# Give names to elements of your vector
my_example <- 5:8
names(my_example) <- c("a", "b", "c", "d")
my_example

# Challenge 1
multiVector <- 1:26
multiVector
multiVector <- multiVector * 2
multiVector
names(multiVector) <- c(LETTERS)
names(multiVector) <- LETTERS
multiVector

# Data Frames
str(cats$weight)
str(cats$likes_string)
str(cats$coat)
## Another important data structure: factor
coats <- c('tabby', 'tortoiseshell', 'tortoiseshell', 'black', 'tabby')
coats
str(coats)

CATegories <- factor(coats)
CATegories
class(CATegories)
str(CATegories)
typeof(coats)
typeof(CATegories)

# Challenge 2 (3 ways)
?read.csv
cats2 <- read.csv(file = "data/feline-data.csv", as.is = c(TRUE,FALSE,FALSE))
str(cats$coat)
str(cats2$coat)
cats <- read.csv(file = "data/feline-data.csv", stringsAsFactors = FALSE)
str(cats$coat)
cats <- read.csv(file = "data/feline-data.csv", colClasses = c("character", NA, NA))
str(cats$coat)

# Specifying your factor
mydata <- c("case", "control", "control", "case")
mydata
factor_ordering_example <- factor(mydata, levels = c("control", "case"))
factor_ordering_example
str(factor_ordering_example)

# Lists
list_example <- list(1, "a", TRUE, 1+4i, 2)
list_example

another_list <- list(title = "Numbers", numbers = 1:10, data = TRUE)
another_list
another_list$numbers

## View data in details
cats <- read.csv(file = "data/feline-data.csv")
cats$likes_string <- as.logical(cats$likes_string)
typeof(cats)
cats
cats$coat
cats[,1]
typeof(cats[,1])
str(cats[,1])
cats[1,]
typeof(cats[1,])
str(cats[1,])

# Challenge 3
cats[1] # return list
typeof(cats[1])
typeof(cats[,1])
typeof(cats$coat)
cats[[1]] # return content(item) of a list
typeof(cats[[1]])
cats$coat # return item of a list
cats["coat"] # return list
cats[1,1]
typeof(cats[1,1])
cats[1,]
typeof(cats[1,])

# Matrices
matrix_example <- matrix(0, ncol = 6, nrow = 3)
matrix_example
class(matrix_example)
typeof(matrix_example)
str(matrix_example)
dim(matrix_example)
nrow(matrix_example)
ncol(matrix_example)

# Challenge 4
length(matrix_example)

# Challenge 5
new_matrix <- matrix(1:50, ncol = 5, nrow = 10)
new_matrix
?matrix
new_matrix <- matrix(1:50, ncol = 5, nrow = 10, byrow = TRUE)
new_matrix

# Challenge 6
new_list <- list(data_types = c('integer', 'doble'), data_structure = c('list', 'matrix'))
new_list
dataTypes <- c('double', 'complex', 'integer', 'character', 'logical')
dataStructures <- c('data.frame', 'vector', 'factor', 'list', 'matrix')
answer <- list(dataTypes, dataStructures)
answer

# Challenge 7
matrix(c(4, 1, 9, 5, 10, 7), nrow = 3)
matrix(c(4, 9, 10, 1, 5, 7), ncol = 2, byrow = TRUE)
matrix(c(4, 9, 10, 1, 5, 7), nrow = 2)
matrix(c(4, 1, 9, 5, 10, 7), ncol = 2, byrow = TRUE)
