l(productplots)
source("colour.r")

prodplot(happy, ~ happy + marital | sex, na.rm = T, 
  set_offset(c("vspine", "hspine", "hspine"), c(0, 0.01, 0.02))) + fill_happy
ggsave("plots/sex-marital-happy.pdf", width = 6, height = 4)

df <- prodcalc(happy, ~ happy + marital | sex, na.rm = T, set_offset(c("vspine", "hspine", "hspine"), c(0, 0.01, 0.02)), cascade = 0.1)

ggplot(df, aes(xmin = xmin, xmax = xmax, ymin = ymin, ymax = ymax, order = level)) + 
  geom_rect(aes(colour = level, size = -level), fill = alpha("white", 0.9)) +
  xlab(NULL) + ylab(NULL) + 
  scale_colour_gradient("Level", low = "black", high = "grey60", breaks = 1:3) + 
  scale_size(to = c(1, 2)) +
  opts(legend.position = "none")
ggsave("plots/cascade.pdf", width = 6, height = 4)
