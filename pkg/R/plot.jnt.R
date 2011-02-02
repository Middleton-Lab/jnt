#' Plot jnt Object
#' 
#' Plot object returned by \code{jnt}.
#' 
#' 
#' @method plot jnt
#' 
#' @param x Object of class \code{jnt}
#' @param reg.lty Line type for regression lines. Defaults to 1.
#' @param jnt.lty Line type for range of significance. Defaults to 2.
#' @param plot.range logical. If \code{TRUE} (the default) the range of significance is plotted.
#' @param ... Additional parameters passed to plot
#' 
#' @author Kevin Middleton (kmm@@csusb.edu)
#' 
#' @keywords univar
#' 
#' @examples
#' 
#' example(jnt)
#' 
plot.jnt <- function(x, reg.lty = 1, jnt.lty = 2, plot.range = TRUE, ...){
  reg.lty <- 1
  jnt.lty <- 2

  x1 <- x$dat1$x
  x2 <- x$dat2$x
  y1 <- x$dat1$y
  y2 <- x$dat2$y

  plot(c(x1, x2), c(y1, y2), type = "n", xlab = "x", ylab = "y")

  if (plot.range) {
    abline(v = x$lower, lty = jnt.lty, col = "red", ...)
    abline(v = x$upper, lty = jnt.lty, col = "red", ...)
  }

  abline(x$int1, x$slope1, lty = reg.lty)
  abline(x$int2, x$slope2, lty = reg.lty)

  points(x1, y1, pch = 16, col = "grey")
  points(x2, y2, pch = 16)	
}