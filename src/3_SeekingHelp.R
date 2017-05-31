# Speical Operators
?"+"

# Getting help on packages
vignette()
vignette("moveline")

# Getting help from peers
?dput
sessionInfo()

# How to use dput() and dget()
mean <- 5
dput(mean, "foo")
mean2 <- 6
dput(mean2, "foo")
bar <- dget("foo")

baz <- function(x) {
  # Subtract from one
  1-x
}
dput(baz)
dput(baz, control = "useSource")

# Challenge 1
?c
a <- c(1, 2, 3)
c('d', 'e', 'f')
c(1, 2, 'f')

# Challenge 2
?paste

## When passing a single vector, paste0 and paste work like as.character.
paste0(1:12)
paste(1:12)        # same
as.character(1:12) # same

## If you pass several vectors to paste0, they are concatenated in a
## vectorized way.
(nth <- paste0(1:12, c("st", "nd", "rd", rep("th", 9))))

## paste works the same, but separates each input with a space.
## Notice that the recycling rules make every input as long as the longest input.
paste(month.abb, "is the", nth, "month of the year.")
paste(month.abb, letters)

## You can change the separator by passing a sep argument
## which can be multiple characters.
paste(month.abb, "is the", nth, "month of the year.", sep = "_*_")

## To collapse the output into a single string, pass a collapse argument.
paste0(nth, collapse = ", ")

## For inputs of length 1, use the sep argument rather than collapse
paste("1st", "2nd", "3rd")
paste("1st", "2nd", "3rd", collapse = ", ") # probably not what you wanted
paste("1st", "2nd", "3rd", sep = ", ")

## You can combine the sep and collapse arguments together.
paste(month.abb, nth, sep = ": ", collapse = "; ")

## Using paste() in combination with strwrap() can be useful
## for dealing with long strings.
(title <- paste(strwrap(
  "Stopping distance of cars (ft) vs. speed (mph) from Ezekiel (1930)",
  width = 30), collapse = "\n"))
plot(dist ~ speed, cars, main = title)

# Challenge 3 
??csv
