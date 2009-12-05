library(productplots)
source("colour.r")

prodplot(happy, ~ happy, "hspine", na.rm = TRUE) + fill_happy
ggsave("plots/fact-happy.pdf", width = 4, height = 4)
prodplot(happy, ~ sex + happy, c("vspine", "hspine"), na.rm = TRUE) + fill_sex
ggsave("plots/fact-happy-sex.pdf", width = 4, height = 4)
prodplot(happy, ~ sex | happy, c("vspine", "hspine"), na.rm = TRUE) + fill_sex
ggsave("plots/fact-happy|sex.pdf", width = 4, height = 4)


prodplot(happy, ~ happy, "hbar", na.rm = TRUE) + fill_happy
ggsave("plots/fact-happy-2.pdf", width = 4, height = 4)
prodplot(happy, ~ sex + happy, c("vspine", "hbar"), na.rm = TRUE) + fill_sex
ggsave("plots/fact-happy-sex-2.pdf", width = 4, height = 4)
prodplot(happy, ~ sex | happy, c("vspine", "hbar"), na.rm = TRUE) + fill_sex
ggsave("plots/fact-happy|sex-2.pdf", width = 4, height = 4)
