l(productplots)
library(xtable)

joint <- with(happy, prop.table(table(happy, sex)))
xtable(joint)

cond_happy <- with(happy, prop.table(table(happy, sex), 1))
marg_happy <- t(t(with(happy, prop.table(table(happy)))))
happy <- cbind(cond_happy, marg_happy)
xtable(happy)

cond_sex <- with(happy, prop.table(table(happy, sex), 2))
marg_sex <- t(with(happy, prop.table(table(sex))))
sex <- rbind(cond_sex, marg_sex)
xtable(sex)