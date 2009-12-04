l(productplots)
source("colour.r")

# 1d partitions --------------------------------------------------------------

prodplot(happy, ~ happy, "hbar", colour = "grey50", na.rm = TRUE) + fill_happy
ggsave("plots/part-hbar.pdf", width = 4, height = 4)

prodplot(happy, ~ happy, "hspine", na.rm = TRUE) + fill_happy
ggsave("plots/part-hspine.pdf", width = 4, height = 4)

prodplot(happy, ~ happy, "treemap", na.rm = TRUE) + fill_happy
ggsave("plots/part-treemap.pdf", width = 4, height = 4)

# 2d partitions --------------------------------------------------------------

# Find combinations with most zeros
# comb <- subset(expand.grid(x = 2:9, y = 2:9), x > y)
# comb$x <- names(happy)[comb$x]
# comb$y <- names(happy)[comb$y]
# subset(mdply(comb, function(x, y) {
#   sum(table(happy[[x]], happy[[y]]) == 0)
# }), V1 > 0)


# age & marital status
happy$decade <- cut(happy$age, seq(10, 90, by = 10))
prodplot(happy, ~  decade + marital, "fluct", na.rm = T) + fill_marital
ggsave("plots/part-fluct.pdf", width = 6, height = 6)

# year & health
prodplot(happy, ~ . | year + health, "fluct", na.rm = TRUE) + fill_health
ggsave("plots/part-fluct-cond.pdf", width = 6, height = 6)


# nd partitions --------------------------------------------------------------

# show partitioning process
df <- prodcalc(happy, ~ happy + sex + marital, na.rm = TRUE, 
  set_offset(c("vspine", "hspine", "hspine"), c(0, 0, 0.01)))

draw(subset(df, level == 1)) + fill_marital
ggsave("plots/part-comb-1.pdf", width = 6, height = 6)

draw(subset(df, level == 2)) + fill_sex
ggsave("plots/part-comb-2.pdf", width = 6, height = 6)

draw(subset(df, level == 3)) + fill_happy
ggsave("plots/part-comb-3.pdf", width = 6, height = 6)


# alternative displays of marital status & age
prodplot(happy, ~ marital + decade, set_offset(c("vspine", "hspine"), c(0, 0.02)), na.rm = T) + fill_marital
ggsave("plots/part-marital-1.pdf", width = 6, height = 6)

prodplot(happy, ~ decade + marital, set_offset(c("hbar", "vspine"), c(0, 0.02)), na.rm = T) + fill_marital
ggsave("plots/part-marital-2.pdf", width = 6, height = 6)

prodplot(happy, ~ happy + finrela, c("vspine", "hspine")) + 
  aes(fill = finrela)
prodplot(happy, ~ happy + health, c("vspine", "hspine")) + 
  aes(fill = health)
prodplot(happy, ~ happy + marital, c("vspine", "hspine")) + 
  aes(fill = marital)

# fluctuation & equal bin size
prodplot(happy, ~ happy + finrela + health, c("vspine", "fluct"), 
  colour = NA, na.rm = TRUE) + fill_happy
ggsave("plots/part-fluctuation.pdf", width = 6, height = 6)

prodplot(happy, ~ happy | finrela + health, c("vspine", "fluct"), 
  colour = NA, na.rm = TRUE) + fill_happy
ggsave("plots/part-equal-area.pdf", width = 6, height = 6)
