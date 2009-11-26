h <- read.csv(file.path(PATH, "happy.csv"))
h$degree <- factor(h$degree, 
  levels = c("lt high school","high school","junior college", "bachelor",
             "graduate"))

# Mosaic plot of happiness and education
prodplot(h, ~ degree + happy)
# = 
prodplot(h, ~ degree | happy) 
# * 
prodplot(h, ~ happy)

# Mosiac plot of happiness, conditional on education
prodplot(h, ~ happy + degree)
# = 
prodplot(h, ~ happy | degree)
# * 
prodplot(h, ~ degree)

# Add some colour
prodplot(h, ~ happy | degree) + aes(fill = happy)
prodplot(h, ~ happy | degree) + aes(fill = degree)
prodplot(h, ~ happy | degree) + aes(fill = .wt)
prodplot(h, ~ happy | degree) + aes(fill = factor(level))

# Use stacked bars instead of mosaic plot
prodplot(h, ~ degree + happy, divider = stacked())
prodplot(h, ~ happy, ~ degree, divider = stacked())

# Use nested bars instead of mosaic plot
prodplot(h, ~ degree + happy, divider = nested())
prodplot(h, ~ happy, ~ degree, divider = nested())

prodplot(h, ~ degree + happy, ~ sex)
prodplot(h, ~ degree + happy, ~ sex, divider = ddecker())
