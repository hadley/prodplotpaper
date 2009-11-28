vr <- data.frame(trt = letters[1:4], .wt = c(0.5, 0.2, 0.2, 0.1))

prodplot(vr, ~ trt, "hbar")
ggsave("plots/part-hbar.pdf", width = 4, height = 4)

prodplot(vr, ~ trt, "hspline")
ggsave("plots/part-hspline.pdf", width = 4, height = 4)

prodplot(vr, ~ trt, "treemap")
ggsave("plots/part-treemap.pdf", width = 4, height = 4)


# 2d partition
prodplot(happy, ~ happy + finrela, c("vspline", "hspline")) + 
  aes(fill = finrela)
prodplot(happy, ~ happy + health, c("vspline", "hspline")) + 
  aes(fill = health)
prodplot(happy, ~ happy + marital, c("vspline", "hspline")) + 
  aes(fill = marital)

prodplot(happy, ~ happy + finrela + health, c("vspline", "fluct"), 
  colour = NA, na.rm = TRUE) + aes(fill = happy)
ggsave("plots/part-fluct.pdf", width = 6, height = 6)
prodplot(happy, ~ happy | finrela + health, c("vspline", "fluct"), 
  colour = NA, na.rm = TRUE) + aes(fill = happy)
ggsave("plots/part-fluct-cond.pdf", width = 6, height = 6)

