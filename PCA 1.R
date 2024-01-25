#Set the working directory
setwd("C:/Users/USER/Documents/SCHOOL APPLICATION 2023/AALTO UNIVERSITY/COURSE MATERIALS/PERIOD III/Multivariate Statistical Analysis/Assignment 2")

#(a)
#Load the data.
#The data used in this covariance based Principal Component Analysis contains results of 48 decathletes from 1973.
data = read.table("decathlon.txt", header = TRUE, sep = "\t", row.names = 1)
head(data)

#Look at the data.
View(data)

#Check the size of the data matrix.
dim(data)

#We want to conduct the analyses without the variables points, height and weight. 
#So we remove these from the data.
colnames(data)
data_rem = data[ , -c(1, 12, 13)]
View(data_rem)

#What does the function 'princomp' do?
#It performs a principal components analysis on a given numerical data.
help("princomp")

#Visualizing the original data with a pairwise scatterplot
pairs(data_rem, gap = 0, upper.panel = NULL) 

#Difficult to make sense of above plot
#Visualizing just one of the scatterplots where the data points are replaced with the names of the decathletes.
plot(data_rem$R100m, data_rem$R400m, xlab = "Running 100m", ylab = "Running 400m", type="n")
text(data_rem$R100m, data_rem$R400m, labels = rownames(data_rem), cex = 0.5)


#(b)
#How much of the variation of the original data is explained by the k principal components?

#Perform covariance matrix based Principal Component Analysis(PCA) using the 'princomp' function
#Set argument 'cor' to FALSE to show that we perform the PCA with the covariance matrix
data_pca = princomp(data_rem, cor = FALSE )
names(data_pca) #Function princomp returns an object of class princomp, that is essentially a list of objects.

#'scores' 
#are transformed variables
score = data_pca$scores
class(score)
head(score)
#The function 'princomp' uses divisor n instead of n−1 while calculating the sample covariance.
#Thus we can calculate scores manually in the following way.
n = nrow(data_rem)
e = eigen((n - 1) / n * cov(data_rem))
score_manual = as.matrix(sweep(data_rem, 2, colMeans(data_rem), "-")) %*% e$vectors
#'as.matrix' is a conversion function that takes an object of some other class (e.g., a data frame, a list, or a vector) and converts it into a matrix.

#'sdev'
#Standard deviations of each principal component. 
#these are the square roots of eigenvalues(represent variance) of the sample covariance matrix corresponding
#to the original data set.
data_pca$sdev
sqrt(e$values)

#'Loadings'
#is eigenvector matrix corresponding to the sample covariance matrix. 
#that this is not a matrix object but a special object of class 'loadings'. 
#Values very close to zero are shown as empty when the object is printed.
load = data_pca$loadings
class(load)
load

#Elements of a loadings object can be accessed similarly to a matrix
load[1, 1]

#One can transform a loadings object to a matrix
load_mat = load[]
class(load_mat)

#'center'
#is the mean vector corresponding to the original data set
data_pca$center

#'scales'
#Scales are relevant when cor = TRUE. 
#In the case cor = TRUE, scales are equal to the standard deviations of the original variables x(j), j ∈ {1, . . . , d}. 
#This is due to the fact that (sample) correlation matrix is equal to the (sample) covariance matrix of
#standardized variables x(j)/std(x(j)).
princomp(data_rem, cor = TRUE)$scale #sample correlation matrix
sqrt((n - 1) / n * apply(data_rem, 2, var)) #sample covariance matrix

#'quantity'
#trace: gives one way to measure multivariate scatter.
#Then proportion of the total variation explained by the first k principal components
#measures amount of information retained in keeping k first principal components.

#Proportion of the total variation explained by the first k principal can be seen straight away
#with the summary function. 
#See the Cumulative Proportion row in the summary.
summary(data_pca)

#We can also calculate proportions of variation explained by the first k principal components manually.
vars = data_pca$sdev^2
var_prop = vars / sum(vars)
var_prop_cum = cumsum(var_prop)

var_prop #Proportion of variance
var_prop_cum #Cumulative proportion


#We show the 'scree plot' of the principal components. 
#Scree plot can be used as a tool for choosing sufficient number of components.
plot(data_pca, las = 2, main = "Scree Plot")

#The following plot can be also useful for choosing how many principal components to use.
plot(var_prop_cum, type = "b", pch = 21, lty = 3, bg = "skyblue", cex = 1.5,
     ylim = c(0, 1), xlab = "Principal component",
     ylab = "Cumulative proportion of variance explained",
     xaxt = "n", yaxt = "n")
axis(1, at = 1:10)
axis(2, at = 0:10 / 10, las = 2)

#There are many more or less heuristic methods for choosing number of principal components,
#for example,
#• include enough components to explain x% of total variation, where x% can chosen to be,
#e.g. 90%,
#• Kaiser criterion: include those principal components whose eigenvalues are larger than
#average,
#• elbow method,


#(c)

#We choose the first four principal components and try to interpret them. 
#Together the first four components explain approximately 70% of the variation in the original data.

#Biplot of scores and loadings
#We plot the first two principal components and the corresponding loadings.
#There are two coordinate systems, one for the principal components and other for the loadings.

pc12 = score[, 1:2]
load12 = load[, 1:2]
pc_axis = c(-max(abs(pc12)), max(abs(pc12)))
ld_axis = c(-0.8, 0.8)

plot(pc12, xlim = pc_axis, ylim = pc_axis, pch = 21, bg = "tomato", cex = 1.25,
     xlab = paste0("PC 1 (", round(100 * var_prop[1], 2), "%)"),
     ylab = paste0("PC 2 (", round(100 * var_prop[2], 2), "%)"))
par(new = TRUE)
plot(load12, axes = FALSE, type = "n", xlab = "", ylab = "", xlim = ld_axis,
     ylim = ld_axis)
axis(3)
axis(4)
arrows(0, 0, load12[, 1], load12[, 2], length = 0.05)
text(load12[, 1], load12[, 2], rownames(load12), pos = 3, cex = 0.5)
abline(h = 0, lty = 3)
abline(v = 0, lty = 3)

#The 'biplot' function gives similar results
biplot(data_pca)

#Loadings and biplots are used to interpret principal components. 
#We want to find the variables that contribute to the principal components

#From the above plot, variables Discus_throw and Shot_put have the most significant 
#positive contributions to the first principal component(PC 1)
#On the other hand R1500m has significant negative contribution to the first component.
#Therefore the first principal components tells that the decathletes who are good at running 
#long distances are very different compared to the decathletes who are good at discus throw and shot put.
#Consequently we could interpret first principal component as strength/bulkiness.

#For the second component, the variables such as R100m, Hurdles and R400m have significant positive
#contributions to the second principal component.
#Whereas the variables High_jump, R1500m and Javelin have significant negative contributions to the second component.
#Thus the second component can be interpreted as speed.


#We plot the second two principal components and the corresponding loadings.
pc34 = score[, 3:4]
load34 = load[, 3:4]
pc_axis = c(-max(abs(pc34)), max(abs(pc34)))
ld_axis = c(-0.8, 0.8)

plot(pc34, xlim = pc_axis, ylim = pc_axis, pch = 21, bg = "tomato", cex = 1.25,
     xlab = paste0("PC 3 (", round(100 * var_prop[3], 2), "%)"),
     ylab = paste0("PC 4 (", round(100 * var_prop[4], 2), "%)"))
par(new = TRUE)
plot(load34, axes = FALSE, type = "n", xlab = "", ylab = "", xlim = ld_axis,
     ylim = ld_axis)
axis(3)
axis(4)
arrows(0, 0, load34[, 1], load34[, 2], length = 0.05)
text(load34[, 1], load34[, 2], rownames(load34), pos = 3, cex = 0.5)
abline(h = 0, lty = 3)
abline(v = 0, lty = 3)

#(d)

#Mean vector corresponding to principal components is a zero vector.
round(colMeans(score), 2)

#Principal components are uncorrelated, thus the sample covariance matrix is a diagonal matrix.
round(cov(score), 2)







