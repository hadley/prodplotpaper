vr <- data.frame(trt = letters[1:4], .wt = c(0.5, 0.2, 0.2, 0.1))

prodplot(vr, ~ trt, "hbar")
ggsave("plots/part-hbar.pdf", width = 4, height = 4)

prodplot(vr, ~ trt, "hspine")
ggsave("plots/part-hspine.pdf", width = 4, height = 4)

prodplot(vr, ~ trt, "treemap")
ggsave("plots/part-treemap.pdf", width = 4, height = 4)


# 2d partition
prodplot(happy, ~ happy + finrela, c("vspine", "hspine")) + 
  aes(fill = finrela)
prodplot(happy, ~ happy + health, c("vspine", "hspine")) + 
  aes(fill = health)
prodplot(happy, ~ happy + marital, c("vspine", "hspine")) + 
  aes(fill = marital)

prodplot(happy, ~ happy + finrela + health, c("vspine", "fluct"), 
  colour = NA, na.rm = TRUE) + aes(fill = happy)
ggsave("plots/part-fluct.pdf", width = 6, height = 6)
prodplot(happy, ~ happy | finrela + health, c("vspine", "fluct"), 
  colour = NA, na.rm = TRUE) + aes(fill = happy)
ggsave("plots/part-fluct-cond.pdf", width = 6, height = 6)

