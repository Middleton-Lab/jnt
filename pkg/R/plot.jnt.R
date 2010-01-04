plot.jnt <- function(jnt.obj, reg.lty = 1, jnt.lty = 2, ...){

x1 <- jnt.obj$dat1$x
x2 <- jnt.obj$dat2$x
y1 <- jnt.obj$dat1$y
y2 <- jnt.obj$dat2$y

plot(c(x1, x2), c(y1, y2), type = "n", xlab = "x", ylab = "y")

abline(v = jnt.obj$lower, lty = jnt.lty, col = "red", ...)
abline(v = jnt.obj$upper, lty = jnt.lty, col = "red", ...)

abline(jnt.obj$int1, jnt.obj$slope1, lty = reg.lty)
abline(jnt.obj$int2, jnt.obj$slope2, lty = reg.lty)

points(x1, y1, pch = 16, col = "grey")
points(x2, y2, pch = 16)	
}