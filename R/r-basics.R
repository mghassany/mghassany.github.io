## R basics
## Addition de library
install.packages("rmcd")
library("rmcd")
rmcd()
## L'aide
help(lm)
?lm
??lm
help(vignette)
vignette(all = TRUE)
library(xtable)
vignette("xtableGallery")
library(zoo)
vignette("zoo")
demo(graphics)
## Autoapprantissage
install.packages("swirl")
library("swirl")
swirl()
## Simple computations
## These are some simple operations
## The console can act as a simple calculator
1.0 + 1.1
2 * 2
3/2
2^3
1/0
0/0
## Use ; for performing several operations in the same line
(1 + 3) * 2 - 1; 1 + 3 * 2 - 1
## Mathematical functions
sqrt(2); 2^0.5
sqrt(-1)
exp(1)
log(10); log10(10); log2(10)
sin(pi); cos(0); asin(0)
## Remember to complete the expressions
1 + 2
(1 + 3)
#### Basic Commands
x <- c(1,3,2,5)
x
x = c(1,6,2)
x
y = c(1,4,3)
length(x)
length(y)
ls()
rm(x)
ls()
## Variables and assignment
a <- 1
a
a <- 1 + 1
a 
A
A <- 3
a; A
ls()
rm(a)
a
#### Vectors
c(1, 3)
c(1.5, 0, 5, -3.4)
## Sequence from 1 to 5
1:5 
## Storing some vectors
myData <- c(1, 2)
myData2 <- c(-4.12, 0, 1.1, 1, 3, 4)
myData
myData2
myData + 1 
myData^2
## position of a vector
myData[1]
myData2[6]
myData[1] <- 0
myData
## If you want to access all the elements except a position, use [-position]
myData
myData2[-1]
myData2[-2]
## Also with vectors as indexes
myData2[1:2]
myData2[myData]
myData2[-c(1, 2)]
myData2[c(-1, 2)]
###### Matrices, data frames and lists
A <- matrix(1:4, nrow = 2, ncol = 2)
A
B <- matrix(1, nrow = 2, ncol = 2, byrow = TRUE)
B
## Binding by rows or columns
rbind(1:3, 4:6)  ## row bind
cbind(1:3, 4:6)  ## column bind
## Entry-wise operations
A + 1
A * B
## Accessing elements
A[2, 1] ## Element (2, 1)
A[1, ] ## First row
A[, 2] ## First column
## data frame (matrix containing different data types)
myDf <- data.frame(var1 = 1:2, var2 = 3:4)
myDf
## You can change names
names(myDf)
names(myDf) <- c("newname1", "newname2")
myDf
myDf$newname1
myDf$lastColumn <- c(5,6)
myDf
## A list is a collection of arbitrary variables
myList <- list(myData = myData, A = A, myDf = myDf) 
## Access elements by names
myList$myData
myList$A
myList$myDf
## Reveal the structure of an object
str(myList)
str(myDf)
typeof(myList)
typeof(myDf)
#### Graphics, plot
help(plot)
x <- rnorm(100)
y <- rnorm(100)
plot(x,y)
plot(x,y,xlab="this is the x-axis",ylab="this is the y-axis",
main="Plot of X vs Y")
#### Distributions
?Distributions
help(rnorm)
## Sampling from a Normal - 100 random points from a N(0, 1)
rnorm(n = 10, mean = 0, sd = 1)
rnorm(n = 10, mean = 0, sd = 1)
rnorm(n = 10, mean = 0, sd = 1)
set.seed(45678)
rnorm(n = 10, mean = 0, sd = 1)
set.seed(45678)
rnorm(n = 10, mean = 0, sd = 1)
set.seed(45678)
rnorm(n = 10, mean = 0, sd = 1)
## Plotting the density of a N(0, 1) - the Gauss bell
x <- seq(-4, 4, l = 100)
y <- dnorm(x = x, mean = 0, sd = 1)
plot(x, y, type = "l")
## Plotting the distribution function of a N(0, 1)
x <- seq(-4, 4, l = 100)
y <- pnorm(q = x, mean = 0, sd = 1)
plot(x, y, type = "l", lwd = 3, main="The distribution function of a N(0, 1)")
#### Working directory
getwd()
help(setwd)
#### Loading Data
help(datasets)
library(help = "datasets")
help(read.table)
help(write.table)


