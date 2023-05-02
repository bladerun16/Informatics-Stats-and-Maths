air.quality.last.week <- 
  c("good","fair","fair","sufficient",
    "fair","fair", "good")
print(air.quality.last.week)
air.quality.last.week.f <- 
  factor(
      c("good","fair","fair","sufficient"
        , "fair","fair", "good")
      , levels = c("bad", "poor", "sufficient"
                   , "fair", "good"),
    ordered = TRUE)
print(air.quality.last.week.f)
print(min(air.quality.last.week.f))