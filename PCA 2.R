setwd("C:/Users/USER/Documents/SCHOOL APPLICATION 2023/AALTO UNIVERSITY/COURSE MATERIALS/PERIOD III/Multivariate Statistical Analysis/Assignment 2")

#(a)

# Simulate 100 observations from the bivariate normal distribution with the following parameters:

mu = c(4, 7)
sigma = matrix(c(10, 6, 6, 8), byrow = TRUE, ncol = 2)

#This library contains the function "rmvnorm" which generates random samples from a multivariate normal distribution.
library(mvtnorm)

#Set the seed for generating the same sequence of random variables for n observations.
set.seed(123)
n = 100

#Use of function 'rmvnorm'
x = rmvnorm(n, mu, sigma)
head(x)
dim(x)
lbs = as.character(1:100)
plot(x, pch = 20, xlab = expression("X"[1]), ylab = expression("X"[2]),
     main = expression(paste("Sample from ", "N(", mu, ", ", Sigma, ")")), type="n")
text(x, labels = lbs, cex = 0.5)


#(b)

#Perform the covariance based PCA transformation to the data set

x_pca = princomp(x, cor = FALSE)
summary(x_pca)


#(c)

#Plot the score matrix
score = x_pca$scores
head(score)
lbss = as.character(1:100)
plot(score, pch = 20, xlab = expression("PC 1"), ylab = expression("PC 2"),
     xlim = c(-10,12), ylim = c(-6,5), main = "Score Matrix", type="n")
text(score, labels = lbss, cex = 0.5)


#(d)

#Compare the plots of a) and c) and describe the differences.

#The data points were rotated and the data was centered by the y-axis.


#(e) 

#Calculate the G and Y matrices without using any existing PCA functions.

n = nrow(x)
eig = eigen((n - 1) / n * cov(x))
G = eig$vectors #eigen vectors
Y = as.matrix(sweep(x, 2, colMeans(x), "-")) %*% G #score matrix


#(f)

#Verify that the estimated scores and the loadings are equal (up to signs) in parts b) and e).

all(abs(round(Y, 2)) == abs(round(score, 2)))


#(g)

#Plot the directions of the first and second principal components to the original data.

center = x_pca$center
load = x_pca$loadings[]
load
arrows_xy = 10 * load + rep(1, 2) %*% t(x_pca$center)

arrows_xy
plot(x, xlim = c(-5, 15), ylim = c(-5, 20), pch = 21, bg = "tomato", cex = 0.5,
     xlab = expression("X"[1]), ylab = expression("X"[1]))

arrows(center[1], center[2], arrows_xy[, 1], arrows_xy[, 2], lwd = 2, col = c("green", "orange"), length = 0.1)

legend("topright", legend = c("PC 1", "PC 2"), col = c("green", "orange"), pch = 15, bty = "n", cex = 0.8)
