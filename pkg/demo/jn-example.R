setwd('~/Dropbox/R/jnt')
source('R/jnt.R')
source('R/plot.jnt.R')

# Simulate data
set.seed(1234)

n <- 50

x1 <- rnorm(n)
y1 <- x1 + rnorm(n, sd = 0.2)

x2 <- rnorm(n)
y2 <- 1.25 * x2 + rnorm(n, sd = 0.2) 

plot(c(x1, x2), c(y1, y2), type = "n", xlab = "x", ylab = "y")
points(x1, y1, pch = 16, col = "grey")
points(x2, y2, pch = 1)

df1 <- data.frame(x = x1, y = y1)
df2 <- data.frame(x = x2, y = y2)

(jnt.out <- jnt(df1, df2))

plot(jnt.out)

df1.2 <- data.frame(x = c(x1, x2), y = c(y1, y2), 
	a = factor(rep(0:1, each = n)))
summary(testlm <- lm(y ~ x * a, dat = df1.2))

# Real data
# White
ser1 <- read.table("data/ser1_a.txt")
ser2 <- read.table("data/ser2_a.txt")

(jnt.out <- jnt(ser1, ser2))
plot(jnt.out)

# Real data
# Lavin et al. Small Intestine length
ser1 <- read.table("data/ser1_b.txt")
ser2 <- read.table("data/ser2_b.txt")

(jnt.out <- jnt(ser1, ser2))
plot(jnt.out)
