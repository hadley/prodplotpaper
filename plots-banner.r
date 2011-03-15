l(productplots)
source("colour.r")

no_axes <- list(scale_x_continuous(breaks = NA), scale_y_continuous(breaks = NA))

prodplot(happy, ~ happy + marital, c("vspine", "hspine"), na.rm = TRUE) + fill_marital + no_axes
ggsave("plots/banner-1.pdf", width = 4, height = 4)

prodplot(happy, ~ marital + happy, c("tile", "tile"), na.rm = TRUE) + fill_marital + no_axes
ggsave("plots/banner-2.pdf", width = 4, height = 4)

prodplot(happy, ~ marital + happy, c("hbar", "vbar"), na.rm = TRUE) + fill_marital + no_axes
ggsave("plots/banner-3.pdf", width = 4, height = 4)

prodplot(happy, ~ marital + happy, c("hbar", "hbar"), na.rm = TRUE) + fill_marital + no_axes
ggsave("plots/banner-4.pdf", width = 4, height = 4)

prodplot(happy, ~ marital + happy, c("hspine", "vbar"), na.rm = TRUE) + fill_marital + no_axes
ggsave("plots/banner-5.pdf", width = 4, height = 4)

prodplot(happy, ~ marital + happy, c("fluct"), na.rm = TRUE) + fill_marital + no_axes
ggsave("plots/banner-6.pdf", width = 4, height = 4)
