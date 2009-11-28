library(productplots)

prodplot(happy, ~ happy, "hspline") + aes(fill = happy)
ggsave("plots/fact-happy.pdf", width = 4, height = 4)
prodplot(happy, ~ sex + happy, c("vspline", "hspline")) + aes(fill = sex)
ggsave("plots/fact-happy-sex.pdf", width = 4, height = 4)
prodplot(happy, ~ sex | happy, c("vspline", "hspline")) + aes(fill = sex)
ggsave("plots/fact-happy|sex.pdf", width = 4, height = 4)


prodplot(happy, ~ happy, "hbar") + aes(fill = happy)
ggsave("plots/fact-happy-2.pdf", width = 4, height = 4)
prodplot(happy, ~ sex + happy, c("vspline", "hbar")) + aes(fill = sex)
ggsave("plots/fact-happy-sex-2.pdf", width = 4, height = 4)
prodplot(happy, ~ sex | happy, c("vspline", "hbar")) + aes(fill = sex)
ggsave("plots/fact-happy|sex-2.pdf", width = 4, height = 4)
