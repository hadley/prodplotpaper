fill_happy <- list(
  aes(fill = happy),
  opts(legend.position = "none"),
  scale_fill_manual(
    values = c("not too happy" = "#FC8D59", "pretty happy" = "#FFFFBF", "very happy" = "#91CF60", "NA" = "grey50"))
)
