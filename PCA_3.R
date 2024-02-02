setwd("C:/Users/USER/Documents/SCHOOL APPLICATION 2023/AALTO UNIVERSITY/COURSE MATERIALS/PERIOD III/Multivariate Statistical Analysis/Assignment 3/Week 3-20240126")

decat = read.table("decathlon.txt", header = TRUE, sep = "\t", row.names = 1)
head(decat)

decat_r = decat[ , -c(1, 12, 13)]
head(decat_r)

#Visualizing the correlation matrix.
#The correlation matrix can be visualized with a heat map.
#Here blue indicates positive correlation and red indicates negative correlation
#install.packages("corrgram")
library(corrgram)
corrgram(decat_r, upper.panel = NULL)

#A pie chart can be used to visualize the correltaion matrix instead of the heat map.
#Here red indicates positive correlation and blue indicates negative correltaion.
colours = c("blue4","blue3", "blue2", "blue1", "blue", "red", "red1",  "red2",  "red3", "red4")
corrgram(decat_r, lower.panel = panel.pie, diag.panel = panel.minmax, upper.panel = NULL, col.regions = colorRampPalette(colours))

#Base R can also be used for plotting a heatmap
heatmap(cor(decat_r), Rowv = NA, Colv = NA, symm = TRUE, col = colorRampPalette(c("red", "white", "blue"))(50)) 

#Correlation matrix based PCA
decat_pca = princomp(decat_r, cor = TRUE)
summary(decat_pca)

#We want to find out how much variation is explained by k principal components.
#The summary tells us this information in the row "Proportion of Variance".
#We can also show a visualization of how much variation is explained by k principal components.

var = decat_pca$sdev^2
var_prop = var / sum(var) #Proportion of variance
var_prop_cum = cumsum(var_prop) #Cumulative proportion

plot(var_prop_cum, type = "b", pch = 21, lty = 3, bg = "skyblue", cex = 1.5,
     ylim = c(0, 1), xlab = "Principal Components",
     ylab = "Cumulative Proportion of Variance Explained",
     xaxt = "n", yaxt = "n")

axis(1, at = 1:10)
axis(2, at = 0:10/10, las = 2)

#We wish to interpret the first four principal components because combined, the represent close to 70% of the variance.
#We first show a Biplot of the scores and loadings.
pc12 <- decat_pca$scores[, 1:2]
load12 <- decat_pca$loadings[, 1:2]
pc_axis <- c(-max(abs(pc12)), max(abs(pc12)))
ld_axis <- c(-0.8, 0.8)
plot(pc12, xlim = pc_axis, ylim = pc_axis, pch = 21, bg = 8, cex = 1.25,
     xlab = paste0("PC 1 (", round(100 * var_prop[1], 2), "%)"),
     ylab = paste0("PC 2 (", round(100 * var_prop[2], 2), "%)"))
par(new = TRUE)
plot(load12, axes = FALSE, type = "n", xlab = "", ylab = "", xlim = ld_axis,
     ylim = ld_axis)
axis(3, col = 2)
axis(4, col = 2)
arrows(0, 0, load12[, 1], load12[, 2], length = 0.1, col = 2)
text(load12[, 1], load12[, 2], rownames(load12), pos = 3)
abline(h = 0, lty = 3)
abline(v = 0, lty = 3)

#We can interpret the principal components by looking at the loadings.
round(decat_pca$loadings[, 1:4], 2)

#Possible interpretation for the first component is strength.***


#We wish to add one clear outlier into the data set and use PCA and try to detect the outlier.
q = 9
decat_r[49, ] = c(rep(1200, q), rep(18000, 10 - q))
rownames(decat_r)[49] = "outlier"

#Visualize the new data which contains the outlier using a pairwise scatter plot
pairs(decat_r, gap = 0, upper.panel = NULL, pch = c(rep(1, 48), 16),
      col = c(rep("black", 48), "red"))

#Perform PCA
decat_pca_b = princomp(decat_r, cor = TRUE)
vars = decat_pca$sdev^2
var_prop = vars / sum(vars)

#From the biplot we can see that the first principal component detects outlier very well
pc12 = decat_pca_b$scores[, 1:2]
load12 = decat_pca_b$loadings[, 1:2]
pc_axis = c(-max(abs(pc12)), max(abs(pc12)))
ld_axis = c(-0.8, 0.8)

plot(pc12, xlim = pc_axis, ylim = pc_axis, pch = 21, bg = c(rep(8, 48), 1),
     cex = 1.25, xlab = paste0("PC 1 (", round(100 * var_prop[1], 2), "%)"),
     ylab = paste0("PC 2 (", round(100 * var_prop[2], 2), "%)"))
par(new = TRUE)
plot(load12, axes = FALSE, type = "n", xlab = "", ylab = "", xlim = ld_axis,
     ylim = ld_axis)
axis(3, col = 2)
axis(4, col = 2)
arrows(0, 0, load12[, 1], load12[, 2], length = 0.1, col = 2)
text(load12[, 1], load12[, 2], rownames(load12), pos = 3)
abline(h = 0, lty = 3)
abline(v = 0, lty = 3)


#On the other hand, the outlier is not as well detected by the 2nd or 3rd principal components.
pc23 = decat_pca_b$scores[, 2:3]
load23 = decat_pca_b$loadings[, 2:3]
pc_axis = c(-max(abs(pc23)), max(abs(pc23)))
ld_axis = c(-0.8, 0.8)

plot(pc23, xlim = pc_axis, ylim = pc_axis, pch = 21, bg = c(rep(8, 48), 1),
     cex = 1.25, xlab = paste0("PC 2 (", round(100 * var_prop[2], 2), "%)"),
     ylab = paste0("PC 3 (", round(100 * var_prop[3], 2), "%)"))
par(new = TRUE)
plot(load23, axes = FALSE, type = "n", xlab = "", ylab = "", xlim = ld_axis,
     ylim = ld_axis)
axis(3, col = 2)
axis(4, col = 2)
arrows(0, 0, load23[, 1], load23[, 2], length = 0.1, col = 2)
text(load23[, 1], load23[, 2], rownames(load23), pos = 3)
abline(h = 0, lty = 3)
abline(v = 0, lty = 3)

#Also, it can be seen that PCA is quite a nonrobust method. That is, outliers have significant effect to the results of
#PCA.



