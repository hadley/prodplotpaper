theme_set(theme_grey(16))

fill_happy <- list(
  aes(fill = happy),
  opts(legend.position = "none"),
  scale_fill_manual(values = c(
    "not too happy" = "#FC8D59", 
    "pretty happy" = "#FFFFBF", 
    "very happy" = "#91CF60", 
    "NA" = "grey50")))

fill_sex <- list(
  aes(fill = sex),
  opts(legend.position = "none"),
  scale_fill_manual(values = c(
    "male" = "#67A9CF", 
    "female" = "#EF8A62", 
    "NA" = "grey50")))

fill_marital <- list(
  aes(fill = marital),
  opts(legend.position = "none"),
  scale_fill_manual(values = c(
    "married" = "#F1EEF6", 
    "never married" = "#BDC9E1", 
    "divorced" = "#74A9CF", 
    "widowed" = "#2B8CBE", 
    "separated" = "#045A8D", 
    "NA" = "grey50")))

fill_health <- list(
  aes(fill = health),
  opts(legend.position = "none"),
  scale_fill_manual(
    values = c(
      "poor" = "#EDF8E9", 
      "fair" = "#BAE4B3", 
      "good" = "#74C476", 
      "excellent" = "#238B45", 
      "NA" = "grey50"))
)
