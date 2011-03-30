l(productplots)
source("colour.r")

prodplot(happy, ~ happy + marital | sex, na.rm = T, 
  set_offset(c("vspine", "hspine", "hspine"), c(0, 0.01, 0.02))) + 
  fill_happy  + 
  scale_x_continuous(breaks = NA) + 
  scale_y_continuous(breaks = NA)
ggsave("plots/sex-marital-happy.pdf", width = 6, height = 4)

df <- prodcalc(happy, ~ happy + marital | sex, na.rm = T, set_offset(c("vspine", "hspine", "hspine"), c(0, 0.01, 0.02)), cascade = 0.1)

ggplot(df, aes(xmin = l, xmax = r, ymin = b, ymax = t, order = level)) + 
  geom_rect(aes(colour = level, size = -level), fill = alpha("white", 0.9)) +
  xlab(NULL) + ylab(NULL) + 
  scale_colour_gradient("Level", low = "black", high = "grey60", breaks = 1:3) + 
  scale_size(to = c(1, 2)) +
  opts(legend.position = "none") + 
  scale_x_continuous(breaks = NA) + 
  scale_y_continuous(breaks = NA)
ggsave("plots/cascade.pdf", width = 6, height = 4)
