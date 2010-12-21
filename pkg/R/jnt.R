# Written by Kevin Middleton (kmm@csusb.edu)

jnt <- function(dat1, dat2 = NULL, which.is.fact = NULL, alpha = 0.05, total.comp = 1)
{
  UseMethod("jnt")
}

jnt.data.frame <- function(dat1, dat2 = NULL, which.is.fact = NULL, alpha = 0.05, total.comp = 1)
{
dat1.n <- nrow(dat1)
dat2.n <- nrow(dat2)
total.n <- dat1.n + dat2.n			# Total n for both groups
indiv.res.df <- total.n - 4			# Individual residual df
within.res.df <- total.n - 2 - 1	# Within residual df

dat1.x <- dat1[,1]
dat1.y <- dat1[,2]
dat1.xbar <- mean(dat1.x)
dat1.ybar <- mean(dat1.y)
dat1.x.sd <- sd(dat1[,1])
dat1.sum.x <- sum(dat1.x)
dat1.sum.y <- sum(dat1.y)
dat1.sum.x2 <- sum(dat1.x^2) - (dat1.sum.x^2 / dat1.n)
dat1.sum.y2 <- sum(dat1.y^2) - (dat1.sum.y^2 / dat1.n)
dat1.sum.xy <- sum(dat1.x * dat1.y) - sum(dat1.x) * sum(dat1.y) / dat1.n
dat1.X <- matrix(c(rep(1, times = dat1.n), dat1.x), ncol = 2)
dat1.fit <- (solve(t(dat1.X) %*% dat1.X)) %*% (t(dat1.X) %*% dat1[,2])
dat1.int <- dat1.fit[1]
dat1.slope <- dat1.fit[2]

dat2.x <- dat2[,1]
dat2.y <- dat2[,2]
dat2.xbar <- mean(dat2.x)
dat2.ybar <- mean(dat2.y)
dat2.x.sd <- sd(dat2[,1])
dat2.sum.x <- sum(dat2.x)
dat2.sum.y <- sum(dat2.y)
dat2.sum.x2 <- sum(dat2.x^2) - (dat2.sum.x^2 / dat2.n)
dat2.sum.y2 <- sum(dat2.y^2) - (dat2.sum.y^2 / dat2.n)
dat2.sum.xy <- sum(dat2.x * dat2.y) - sum(dat2.x) * sum(dat2.y) / dat2.n
dat2.X <- matrix(c(rep(1, times = dat2.n), dat2.x), ncol = 2)
dat2.fit <- (solve(t(dat2.X) %*% dat2.X)) %*% (t(dat2.X) %*% dat2[,2])
dat2.int <- dat2.fit[1]
dat2.slope <- dat2.fit[2]

f.crit <- qf((1-alpha / total.comp / 2), 1, indiv.res.df)

SSresi <- ((dat1.sum.y2 - ((dat1.sum.xy^2 / dat1.sum.x2)))) + 
	((dat2.sum.y2 - ((dat2.sum.xy^2 / dat2.sum.x2))))

SSresw <- (dat1.sum.y2 + dat2.sum.y2) - 
	((dat1.sum.xy + dat2.sum.xy)^2 / (dat1.sum.x2 + dat2.sum.x2))

total.ss <- sum(c(sum(dat1.y^2), sum(dat2.y^2))) - sum(c(dat1.y, dat2.y))^2 / total.n

sum.xys <- sum(c(dat1.x * dat1.y, dat2.x * dat2.y))
sum.xs <- sum(c(dat1.x, dat2.x))
sum.ys <- sum(c(dat1.y, dat2.y))
sum.x2s <- sum(c(dat1.x^2, dat2.x^2))

SSrest <- total.ss - (((sum.xys - sum.xs * sum.ys / total.n)^2) / (sum.x2s - (sum.xs^2 / total.n)))

SSregw <- (dat1.sum.xy + dat2.sum.xy)^2 / (dat1.sum.x2 + dat2.sum.x2)

bw <- (dat1.sum.xy + dat2.sum.xy) / (dat1.sum.x2 + dat2.sum.x2)

A.val <- (-f.crit / indiv.res.df) * SSresi * ((1/dat1.sum.x2) + (1/dat2.sum.x2)) + 
	(dat1.slope - dat2.slope)^2

B.val <- (f.crit / indiv.res.df) * SSresi * ((dat1.xbar/dat1.sum.x2) + (dat2.xbar/dat2.sum.x2)) +
	(dat1.int - dat2.int) * (dat1.slope - dat2.slope)

C.val <- (-f.crit/indiv.res.df) * SSresi * (total.n / (dat1.n * dat2.n) + dat1.xbar^2/dat1.sum.x2 +
	dat2.xbar^2 / dat2.sum.x2) + (dat1.int - dat2.int)^2

lower <- (-B.val - sqrt(B.val^2 - A.val*C.val))/A.val
upper <- (-B.val + sqrt(B.val^2 - A.val*C.val))/A.val

jntobj <- list("dat1" = data.frame(x = dat1.x, y = dat1.y), "dat2" = data.frame(x = dat2.x, y = dat2.y), 
	"alpha" = alpha, "slope1" = dat1.slope, "int1" = dat1.int, "slope2" = dat2.slope, "int2" = dat2.int,
	"lower" = lower, "upper" = upper)
class(jntobj) <- 'jnt'
jntobj
}
