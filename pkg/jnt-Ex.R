pkgname <- "jnt"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('jnt')

assign(".oldSearch", search(), pos = 'CheckExEnv')
cleanEx()
nameEx("Lavin.1")
### * Lavin.1

flush(stderr()); flush(stdout())

### Name: Lavin.1
### Title: Data from Lavin et al., 2008
### Aliases: Lavin.1
### Keywords: datasets

### ** Examples

data(Lavin.1)
str(Lavin.1)
data(Lavin.2)
str(Lavin.2)

(Lavin <- jnt(Lavin.1, Lavin.2))
plot(Lavin)



cleanEx()
nameEx("Lavin.2")
### * Lavin.2

flush(stderr()); flush(stdout())

### Name: Lavin.2
### Title: Data from Lavin et al., 2008
### Aliases: Lavin.2
### Keywords: datasets

### ** Examples

data(Lavin.1)
str(Lavin.1)
data(Lavin.2)
str(Lavin.2)

(Lavin <- jnt(Lavin.1, Lavin.2))
plot(Lavin)



cleanEx()
nameEx("White.1")
### * White.1

flush(stderr()); flush(stdout())

### Name: White.1
### Title: Data from White, 2003
### Aliases: White.1
### Keywords: datasets

### ** Examples

data(White.1)
str(White.1)
data(White.2)
str(White.2)

(White <- jnt(White.1, White.2))
plot(White)



cleanEx()
nameEx("White.2")
### * White.2

flush(stderr()); flush(stdout())

### Name: White.2
### Title: Data from White, 2003
### Aliases: White.2
### Keywords: datasets

### ** Examples

data(White.1)
str(White.1)
data(White.2)
str(White.2)

(White <- jnt(White.1, White.2))
plot(White)



cleanEx()
nameEx("jnt-package")
### * jnt-package

flush(stderr()); flush(stdout())

### Name: jnt-package
### Title: Johnson-Neyman technique
### Aliases: jnt-package
### Keywords: package

### ** Examples

example(jnt)



cleanEx()
nameEx("jnt")
### * jnt

flush(stderr()); flush(stdout())

### Name: jnt
### Title: Johnson-Neyman Technique
### Aliases: jnt jnt.data.frame plot.jnt
### Keywords: univar

### ** Examples

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



### * <FOOTER>
###
cat("Time elapsed: ", proc.time() - get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
