# Plots should use a consistent colour scheme for happiness so the legend
# only needs to be displayed once.  Currently there seems to be a bug in 
# scale_fill_brewer which is messing things up.

happy_fill <- list(
  aes(fill = happy), 
  scale_fill_brewer("Happiness", pal = "Blues", 
    limits = c("not too happy", "happy", "very happy")),
  opts(legend.position = "none"))