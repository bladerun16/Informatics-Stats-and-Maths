data("iris")
head(iris)
summary(iris)
plot(iris[,-5],col=factor(iris$Species), main="Iris dataset - colors represent Species")
species <- table(iris$Species)
pie(species)
hist(iris$Sepal.Length,
     col='steelblue',
     main='Histogram',
     xlab='Length',
     ylab='Frequency')
boxplot(Sepal.Length~Species,
        data=iris,
        main='Sepal Length by Species',
        xlab='Species',
        ylab='Sepal Length',
        col='steelblue',
        border='black')