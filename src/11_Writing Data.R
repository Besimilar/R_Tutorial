# saving plots
ggsave("My_most_recent_plot.pdf")

# Save multiple plots (pdf, jpeg, png)
pdf("Life_Exp_vs_time.pdf", width = 12, height = 4)
ggplot(data = gapminder, aes(x = year, y = lifeExp, color = continent)) +
  geom_line()
ggplot(data = gapminder, aes(x = year, y = lifeExp, color = continent)) +
  facet_wrap(~ continent) + geom_line()
ggplot(data = gapminder, aes(x = year, y = lifeExp, color = continent)) +
  facet_grid(~ continent) + geom_point()
## make sure to turn off the pdf device
dev.off() 

pdf("Life_Exp_vs_time.pdf", width = 24, height = 12)
ggplot(data = gapminder, aes(x = year, y = lifeExp, colour = country)) +
  geom_line()
## make sure to turn off the pdf device
dev.off()

?pdf
?facet_grid


# Challenge 1
pdf("Life_Exp_vs_time.pdf", width = 12, height = 4)
ggplot(data = gapminder, aes(x = year, y = lifeExp, color = continent)) +
  geom_line()
ggplot(data = gapminder, aes(x = year, y = lifeExp, color = continent)) +
  facet_wrap(~ continent) + geom_line()
ggplot(data = gapminder, aes(x = year, y = lifeExp, color = continent)) +
  facet_grid(~ continent) + geom_point()
## make sure to turn off the pdf device
dev.off() 

# Writing Data
aust_subset <- gapminder[gapminder$country == "Australia", ]
write.table(aust_subset,
  file = "cleaned-data/gapminder-aus.csv",
  sep = ","
  )
?write.table
write.table(
  gapminder[gapminder$country == "Australia", ],
  file = "cleaned-data/gapminder-aus.csv",
  sep = ",", quote = FALSE, row.names = FALSE
)
aust_gapminder <- read.csv("cleaned-data/gapminder-aus.csv")
aust_gapminder
str(aust_gapminder)

# Challenge 2
write.table(
  gapminder[gapminder$year >= 1990, ],
  file = "cleaned-data/gapminder-1990.csv",
  sep = ",", quote = FALSE, row.names = FALSE
)
