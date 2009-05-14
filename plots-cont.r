h <- read.csv("../happy.csv")
setwd("../code"); source("divide.r"); setwd("../paper")

qplot(age, year, data = h)
ggsave("plots/age-year.pdf", width = 4, height = 4)

h$age_b <- round_any(h$age, 5)
h$year_b <- round_any(h$year, 5)

prodplot(h, ~ year_b + age_b) + aes(fill = age_b)
prodplot(h, ~  age_b, ~ year_b) + aes(fill = age_b)
prodplot(h, ~  age_b, ~ year_b, divider = list(hspline, vbar)) + aes(fill = age_b)

prodplot(h, ~  age_b, divider = list(vbar)) + aes(fill = age_b)