library(productplots)
source("colour.r")

# Weighting ------------------------------------------------------------------

happy2 <- transform(happy, .wt = wtssall)

# prodplot(happy, ~ sex, "hbar") + fill_sex
# prodplot(happy2, ~ sex, "hbar") + fill_sex
# prodplot(happy, ~ finrela + health, "fluct")
# prodplot(happy2, ~ finrela + health, "fluct")

prodplot(happy, ~ sex  + age, set_offset(c("vspine", "hbar")), na.rm = TRUE) +
  fill_sex
ggsave("plots/wt-count.pdf", width = 6, height = 4)

prodplot(happy2, ~ sex + age, set_offset(c("vspine", "hbar")), na.rm = TRUE) +
 fill_sex
ggsave("plots/wt-wtssall.pdf", width = 6, height = 4)


# Continuous data ------------------------------------------------------------

happy$age_n <- cut_number(happy$age, 10)
happy$age_i <- cut_interval(happy$age, 10)

prodplot(happy, ~ age_n, set_offset("hbar"))
prodplot(happy, ~ age_i, set_offset("hbar"))

prodplot(happy, ~ age_n, set_offset("hspine"))
prodplot(happy, ~ age_i, set_offset("hspine"))