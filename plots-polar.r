# Polar coordinates
l(productplots)
source("colour.r")

shade <- c(fill_sex, list(
  opts(legend.position = "none", 
    axis.text.x = theme_blank(),
    axis.text.y = theme_blank(),
    axis.ticks = theme_blank()
  ), 
  xlab(NULL),
  ylab(NULL)
))

polar_x <- list(coord_polar(), aes(xmin = sqrt(l), xmax = sqrt(r)))
polar_y <- list(coord_polar("y"), aes(ymin = sqrt(b), ymax = sqrt(t)))

prodplot(happy, ~ sex + happy, set_offset(c("vspine", "hspine")), na.rm = T) + shade
ggsave("plots/hs-vs-cartesian.pdf", width = 4, height = 4)
last_plot() + polar_x
ggsave("plots/hs-vs-polar.pdf", width = 4, height = 4)
last_plot() + polar_y
ggsave("plots/hs-vs-polar-2.pdf", width = 4, height = 4)

prodplot(happy, ~ sex + happy, set_offset(c("hbar", "hbar")), na.rm = T) + shade
ggsave("plots/hb-vb-cartesian.pdf", width = 4, height = 4)
last_plot() + polar_x
ggsave("plots/hb-vb-polar.pdf", width = 4, height = 4)
last_plot() + polar_y
ggsave("plots/hb-vb-polar-2.pdf", width = 4, height = 4)

prodplot(happy, ~ sex + happy, divider = set_offset(c("hspine", "hspine")), na.rm = T) + shade
ggsave("plots/hs-hs-cartesian.pdf", width = 4, height = 4)
last_plot() + polar_x
ggsave("plots/hs-hs-polar.pdf", width = 4, height = 4)
last_plot() + polar_y
ggsave("plots/hs-hs-polar-2.pdf", width = 4, height = 4)

prodplot(happy, ~ sex + happy, divider = set_offset(c("vspine", "hbar")), na.rm = T) + shade
ggsave("plots/hb-vs-cartesian.pdf", width = 4, height = 4)
last_plot() + polar_x
ggsave("plots/hb-vs-polar.pdf", width = 4, height = 4)
last_plot() + polar_y
ggsave("plots/hb-vs-polar-2.pdf", width = 4, height = 4)
