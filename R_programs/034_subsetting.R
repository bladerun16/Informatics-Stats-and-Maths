rm(list=ls())
mtcars
# mtcars[-1:4, ]
mtcars[mtcars$cyl == 4, ]

#mtcars[-1:4, ]
mtcars[1:4]
# exclude first column
mtcars[-1]
# exclude first row
mtcars[-1,]
#
# mtcars[mtcars$cyl <= 5]
mtcars[mtcars$cyl <= 5,]
mtcars[(mtcars$cyl == 4) | (mtcars$cyl == 6), ]

nrow(mtcars[mtcars$cyl == 4 | 6, ])
nrow(mtcars[(mtcars$cyl == 4) | (mtcars$cyl == 6), ])

mtcars[mtcars$gear == 5 & mtcars$cyl == 4, ]
