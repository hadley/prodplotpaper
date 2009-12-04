library(productplots)
source("colour.r")

happy2 <- transform(happy, .wt = wtssall)

# prodplot(happy, ~ sex, "hbar") + fill_sex
# prodplot(happy2, ~ sex, "hbar") + fill_sex
# prodplot(happy, ~ finrela + health, "fluct")
# prodplot(happy2, ~ finrela + health, "fluct")

prodplot(happy, ~ sex  + age, set_offset(c("vspine", "hbar")), na.rm = TRUE) + fill_sex
ggsave("plots/wt-count.pdf", width = 6, height = 4)

prodplot(happy2, ~ sex + age, set_offset(c("vspine", "hbar")), na.rm = TRUE) + fill_sex
ggsave("plots/wt-wtssall.pdf", width = 6, height = 4)
