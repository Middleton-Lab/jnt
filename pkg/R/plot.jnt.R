##' Plot jnt Object
##' 
##' Plot object returned by \code{jnt}.
##' 
##' @method plot jnt
##' 
##' @param x Object of class \code{jnt}
##' @param reg.lty Line type for regression lines. Defaults to 1.
##' @param jnt.lty Line type for range of insignificant differences. Defaults to 2.
##' @param col.1 Color for series 1. Defaults to "black."
##' @param col.2 Color for series 2. Defaults to "gray."
##' @param col.signif Color for bars denoting range of insignificance. Defaults to "red."
##' @param plot.range logical. If \code{TRUE} (the default) the range of insignificance is plotted.
##' @param ... Additional parameters passed to plot (e.g., lwd, pch, xlab, ylab).
##' 
##' @author Kevin Middleton (\email{kmm@@csusb.edu})
##' 
##' @keywords univar
##' 
##' @examples
##' 
##' example(jnt)
##' 
plot.jnt <- function(x,
                     reg.lty = 1,
                     jnt.lty = 2,
                     col.1 = "black",
                     col.2 = "gray",
                     col.signif = "red",
                     plot.range = TRUE,
                     ...){
  if (!inherits(x, "jnt")) {
    stop('object "x" is not of class "jnt".')
  }

  # Parse ...
  dots <- list(...)
  if("lwd" %in% names(dots)) {lwd <- dots$lwd} else {lwd <- 1}
  if("pch" %in% names(dots)) {pch <- dots$pch} else {pch <- 16}
  if("xlab" %in% names(dots)) {xlab <- dots$xlab} else {xlab <- "x"}
  if("ylab" %in% names(dots)) {ylab <- dots$ylab} else {ylab <- "y"}
  
  x1 <- x$dat1$x
  x2 <- x$dat2$x
  y1 <- x$dat1$y
  y2 <- x$dat2$y

  plot(c(x1, x2), c(y1, y2), type = "n", xlab = xlab, ylab = ylab, ...)

  if (plot.range) {
    abline(v = x$lower, lty = jnt.lty, col = col.signif, lwd = lwd)
    abline(v = x$upper, lty = jnt.lty, col = col.signif, lwd = lwd)
  }

  abline(x$int1, x$slope1, lty = reg.lty, lwd = lwd)
  abline(x$int2, x$slope2, lty = reg.lty, lwd = lwd)

  points(x1, y1, pch = pch, col = col.1)
  points(x2, y2, pch = pch, col = col.2)	
}
