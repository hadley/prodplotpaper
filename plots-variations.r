library(productplots)
source("colour.r")

happy$age_i <- cut_interval(happy$age, length = 10)
happy$year_i <- cut_interval(happy$year, length = 5)

# Weighting ------------------------------------------------------------------

happy2 <- transform(happy, .wt = wtssall)


# prodplot(happy, ~ sex, "hbar") + fill_sex
# prodplot(happy2, ~ sex, "hbar") + fill_sex
# prodplot(happy, ~ finrela + health, "fluct")
# prodplot(happy2, ~ finrela + health, "fluct")

prodplot(happy, ~ sex + age_i, set_offset(c("vspine", "hbar")), subset = .(level == 2), na.rm = TRUE) + fill_sex
ggsave("plots/wt-count.pdf", width = 6, height = 4)

prodplot(happy2, ~ sex + age_i, set_offset(c("vspine", "hbar")), subset = .(level == 2), na.rm = TRUE) + fill_sex
ggsave("plots/wt-wtssall.pdf", width = 6, height = 4)


# Continuous data ------------------------------------------------------------

prodplot(happy, ~ age_i, set_offset("hbar"))

prodplot(happy, ~ happy + age_i, c(vspine, set_offset("hspine")), 
  subset = .(level == 2)) + fill_happy
ggsave("plots/cont-hspine.pdf", width = 6, height = 4)

prodplot(happy, ~ happy + age_i, c(vspine, set_offset("hbar")), 
  subset = .(level == 2)) + fill_happy
ggsave("plots/cont-hbar.pdf", width = 6, height = 4)

prodplot(happy, ~ age_i + year_i, "fluct")
prodplot(happy, ~ age_i | year_i, c("hspine", "vspine"), 
  subset = .(level == 2))
