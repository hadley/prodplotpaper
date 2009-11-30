library(productplots)

prodplot(happy, ~ happy, "hspine") + aes(fill = happy)
ggsave("plots/fact-happy.pdf", width = 4, height = 4)
prodplot(happy, ~ sex + happy, c("vspine", "hspine")) + aes(fill = sex)
ggsave("plots/fact-happy-sex.pdf", width = 4, height = 4)
prodplot(happy, ~ sex | happy, c("vspine", "hspine")) + aes(fill = sex)
ggsave("plots/fact-happy|sex.pdf", width = 4, height = 4)


prodplot(happy, ~ happy, "hbar") + aes(fill = happy)
ggsave("plots/fact-happy-2.pdf", width = 4, height = 4)
prodplot(happy, ~ sex + happy, c("vspine", "hbar")) + aes(fill = sex)
ggsave("plots/fact-happy-sex-2.pdf", width = 4, height = 4)
prodplot(happy, ~ sex | happy, c("vspine", "hbar")) + aes(fill = sex)
ggsave("plots/fact-happy|sex-2.pdf", width = 4, height = 4)
