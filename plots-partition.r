l(productplots)
fill_happy <- list(
  aes(fill = happy),
  opts(legend.position = "none"),
  scale_fill_manual(
    values = c("not too happy" = "#FC8D59", "pretty happy" = "#FFFFBF", "very happy" = "#91CF60", "NA" = "grey50"))
)

prodplot(happy, ~ happy, "hbar", colour = "grey50", na.rm = TRUE) + fill_happy
ggsave("plots/part-hbar.pdf", width = 4, height = 4)

prodplot(happy, ~ happy, "hspine", na.rm = TRUE) + fill_happy
ggsave("plots/part-hspine.pdf", width = 4, height = 4)

prodplot(happy, ~ happy, "treemap", na.rm = TRUE) + fill_happy
ggsave("plots/part-treemap.pdf", width = 4, height = 4)

# 2d partition

# Find combinations with most zeros
comb <- subset(expand.grid(x = 2:9, y = 2:9), x > y)
comb$x <- names(happy)[comb$x]
comb$y <- names(happy)[comb$y]
subset(mdply(comb, function(x, y) {
  sum(table(happy[[x]], happy[[y]]) == 0)
}), V1 > 0)



happy$decade <- cut(happy$age, seq(10, 90, by = 10))
prodplot(happy, ~  decade + marital, "fluct", na.rm = T) + 
  aes(fill = marital)
ggsave("plots/part-fluct.pdf", width = 6, height = 6)
prodplot(happy, ~ . | year + health, "fluct") + 
  aes(fill = health)
ggsave("plots/part-fluct-cond.pdf", width = 6, height = 6)


# nd partition

prodplot(happy, ~ happy + finrela, c("vspine", "hspine")) + 
  aes(fill = finrela)
prodplot(happy, ~ happy + health, c("vspine", "hspine")) + 
  aes(fill = health)
prodplot(happy, ~ happy + marital, c("vspine", "hspine")) + 
  aes(fill = marital)

prodplot(happy, ~ happy + finrela + health, c("vspine", "fluct"), 
  colour = NA, na.rm = TRUE) + fill_happy
ggsave("plots/part-nd-1.pdf", width = 6, height = 6)

prodplot(happy, ~ happy | finrela + health, c("vspine", "fluct"), 
  colour = NA, na.rm = TRUE) + fill_happy
ggsave("plots/part-nd-2.pdf", width = 6, height = 6)
