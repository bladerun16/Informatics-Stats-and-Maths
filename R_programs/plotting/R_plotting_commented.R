rm(list = ls())

# ==============================================================================
# Data Visualization in R
# Base R plotting and ggplot2
# ==============================================================================
# It first shows the base R plotting style,
# then introduces ggplot2, emphasizing the Grammar of Graphics:
#
#   data + aesthetics + geometries + statistics + scales + coordinates + facets + themes
#
# In ggplot2, a plot is built in layers. Each layer can add a visual element,
# such as points, lines, smooth curves, labels, or summaries.
# ==============================================================================


# ------------------------------------------------------------------------------
# Load example data
# ------------------------------------------------------------------------------
# mtcars is a built-in R dataset with measurements for 32 cars.
# Useful variables include:
#   mpg  = miles per gallon
#   wt   = car weight, in 1000 lbs
#   hp   = horsepower
#   cyl  = number of cylinders
#   gear = number of forward gears
# ------------------------------------------------------------------------------
data(mtcars)


# ------------------------------------------------------------------------------
# Base R Plot
# ------------------------------------------------------------------------------
# Base R graphics are usually procedural: we first create a plot, then add
# elements to the existing graphics page using additional functions.
# ------------------------------------------------------------------------------
x <- mtcars$wt
y <- mtcars$mpg

plot(x, y,
     main = "MPG vs Weight",        # plot title
     xlab = "Weight",               # x-axis label
     ylab = "Miles per Gallon",      # y-axis label
     col = "blue",                  # point color
     pch = 19)                      # plotting symbol: 19 = solid circle

# abline() is a low-level plotting function: it adds to the current plot rather
# than creating a new one. Here it adds a linear regression line.
abline(lm(y ~ x), col = "red")


# ------------------------------------------------------------------------------
# ggplot2
# ------------------------------------------------------------------------------
# ggplot2 is based on the Grammar of Graphics. Instead of directly drawing step
# by step, we describe how variables should be mapped to visual properties.
#
# Key terms:
#   ggplot()   starts the plot and defines the dataset
#   aes()      maps variables to visual aesthetics such as x, y, color, size
#   geom_*()   defines the type of graphical object, such as points or lines
#   labs()     changes titles, subtitles, captions, and axis labels
#   theme_*()  changes non-data appearance, such as background and grid lines
#   facet_*()  splits one plot into multiple panels
# ------------------------------------------------------------------------------
library(ggplot2)


# ------------------------------------------------------------------------------
# 1. Basic scatterplot
# ------------------------------------------------------------------------------
# ggplot(mtcars, aes(x = wt, y = mpg)) initializes the plot:
#   - mtcars is the data frame
#   - aes(x = wt, y = mpg) maps variables to axes
#
# geom_point() adds a point layer. Each row in mtcars becomes one point.
# ------------------------------------------------------------------------------
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point()


# ------------------------------------------------------------------------------
# 2. Aesthetic mapping
# ------------------------------------------------------------------------------
# Aesthetic mapping means connecting a variable in the data to a visual property.
# Here, color = factor(cyl) maps the number of cylinders to point color.
#
# Important distinction:
#   aes(color = factor(cyl)) maps a variable to color and creates a legend.
#   color = "blue" outside aes() sets all points to the same fixed color.
#
# factor(cyl) tells ggplot2 to treat cylinders as categories, not as a continuous
# numeric scale.
# ------------------------------------------------------------------------------
ggplot(mtcars, aes(wt, mpg, color = factor(cyl))) +
  geom_point()


# Same idea, but with more explicit labels.
# labs(color = "Cylinders") changes the legend title.
ggplot(mtcars, aes(x = wt, y = mpg, color = factor(cyl))) +
  geom_point(size = 3) +
  labs(title = "Fuel efficiency decreases as car weight increases",
       subtitle = "Cars are colored by number of cylinders",
       x = "Weight (1000 lbs)",
       y = "Miles per gallon",
       color = "Cylinders") +
  theme_minimal()


# ------------------------------------------------------------------------------
# 3. Setting aesthetics instead of mapping them
# ------------------------------------------------------------------------------
# In this example, color is outside aes(), so it is not linked to a variable.
# All points are simply drawn in the same color.
# ------------------------------------------------------------------------------
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point(color = "blue", size = 3)


# ------------------------------------------------------------------------------
# 4. Boxplot
# ------------------------------------------------------------------------------
# geom_boxplot() summarizes the distribution of mpg within each cylinder group.
#
# factor(cyl) is used because boxplots require groups on the x-axis. If cyl were
# treated as numeric, ggplot2 would interpret it as a continuous variable.
# ------------------------------------------------------------------------------
ggplot(mtcars, aes(x = factor(cyl), y = mpg)) +
  geom_boxplot() +
  labs(title = "MPG distribution by cylinder count",
       x = "Number of cylinders",
       y = "Miles per gallon") +
  theme_minimal()


# ------------------------------------------------------------------------------
# 5. Layers with regression
# ------------------------------------------------------------------------------
# ggplot2 plots are built by adding layers with +.
#
# geom_point() draws the observed data.
# geom_smooth(method = "lm") adds a fitted linear model line.
#
# By default, geom_smooth() also shows a confidence interval around the fitted
# line. Use se = FALSE to hide it.
# ------------------------------------------------------------------------------
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  geom_smooth(method = "lm") +
  labs(title = "Linear relationship between weight and MPG",
       x = "Weight (1000 lbs)",
       y = "Miles per gallon") +
  theme_minimal()


# Version without confidence interval.
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  theme_minimal()


# ------------------------------------------------------------------------------
# 6. Faceting
# ------------------------------------------------------------------------------
# Faceting creates small multiples: the same plot is repeated for subsets of the
# data. facet_wrap(~ cyl) creates one panel for each value of cyl.
#
# This is useful when comparing patterns across groups without manually creating
# multiple separate plots.
# ------------------------------------------------------------------------------
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  facet_wrap(~ cyl) +
  labs(title = "MPG vs weight, split by cylinder count",
       x = "Weight (1000 lbs)",
       y = "Miles per gallon") +
  theme_minimal()


# ------------------------------------------------------------------------------
# 7. Histograms and binning
# ------------------------------------------------------------------------------
# geom_histogram() visualizes the distribution of one numeric variable.
# binwidth controls the width of the intervals used to count observations.
#
# Choosing binwidth is an analytical decision: too wide hides detail, too narrow
# may overemphasize noise.
# ------------------------------------------------------------------------------
ggplot(mtcars, aes(x = mpg)) +
  geom_histogram(binwidth = 3, color = "white") +
  labs(title = "Distribution of fuel efficiency",
       x = "Miles per gallon",
       y = "Number of cars") +
  theme_minimal()


# ------------------------------------------------------------------------------
# 8. Scales
# ------------------------------------------------------------------------------
# Scales control how data values are translated into visual properties.
# For example, scale_x_continuous() can change axis breaks, and
# scale_color_brewer() can change a categorical color palette.
# ------------------------------------------------------------------------------
ggplot(mtcars, aes(x = wt, y = mpg, color = factor(cyl))) +
  geom_point(size = 3) +
  scale_x_continuous(breaks = seq(2, 6, by = 1)) +
  scale_color_brewer(palette = "Set1") +
  labs(title = "Customized scales",
       x = "Weight (1000 lbs)",
       y = "Miles per gallon",
       color = "Cylinders") +
  theme_minimal()


# ------------------------------------------------------------------------------
# 9. Themes
# ------------------------------------------------------------------------------
# Themes control non-data elements of a plot: background, grid lines, fonts,
# legend position, margins, and more.
#
# Common complete themes include:
#   theme_minimal()
#   theme_bw()
#   theme_classic()
#   theme_light()
# ------------------------------------------------------------------------------
ggplot(mtcars, aes(x = wt, y = mpg, color = factor(cyl))) +
  geom_point(size = 3) +
  labs(title = "Theme example",
       x = "Weight (1000 lbs)",
       y = "Miles per gallon",
       color = "Cylinders") +
  theme_bw() +
  theme(legend.position = "bottom")


# ------------------------------------------------------------------------------
# 10. Saving plots
# ------------------------------------------------------------------------------
# ggsave() saves the most recently printed ggplot object by default.
#
# Better practice: assign the plot to an object, then pass it explicitly to
# ggsave(). This avoids accidentally saving the wrong plot.
# ------------------------------------------------------------------------------
p <- ggplot(mtcars, aes(x = wt, y = mpg, color = factor(cyl))) +
  geom_point(size = 3) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Fuel efficiency by car weight",
       x = "Weight (1000 lbs)",
       y = "Miles per gallon",
       color = "Cylinders") +
  theme_minimal()

p

# width and height are in inches by default.
# dpi is especially relevant for raster formats such as PNG.
ggsave("plot.png", plot = p, width = 6, height = 4, dpi = 300)

# PDF is often preferred for vector graphics, especially for papers and slides.
ggsave("plot.pdf", plot = p, width = 6, height = 4)
