# Polar coordinates

h <- read.csv("../happy.csv")
setwd("../code"); source("divide.r"); setwd("../paper")

shade <- list(
  aes(fill = sex),
  opts(legend.position = "none", 
    axis.text.x = theme_blank(),
    axis.text.y = theme_blank()
  ), 
  xlab(NULL),
  ylab(NULL),
  scale_y_sqrt()
)

prodplot(h, ~ happy + sex) + shade
ggsave("plots/hs-vs-cartesian.pdf", width = 4, height = 4)
last_plot() + coord_polar()
ggsave("plots/hs-vs-polar.pdf", width = 4, height = 4)

prodplot(h, ~ happy + sex, divider = nested()) + shade
ggsave("plots/hb-vb-cartesian.pdf", width = 4, height = 4)
last_plot() + coord_polar()
ggsave("plots/hb-vb-polar.pdf", width = 4, height = 4)

prodplot(h, ~ happy + sex, divider = list(hspline, hspline)) + shade
ggsave("plots/hs-hs-cartesian.pdf", width = 4, height = 4)
last_plot() + coord_polar()
ggsave("plots/hs-hs-polar.pdf", width = 4, height = 4)

prodplot(h, ~ happy + sex, divider = stacked()) + shade
ggsave("plots/hb-vs-cartesian.pdf", width = 4, height = 4)
last_plot() + coord_polar()
ggsave("plots/hb-vs-polar.pdf", width = 4, height = 4)
