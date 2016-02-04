##' Plot jnt Object
##'
##' Plot object returned by \code{jnt}.
##'
##' @title Plot jnt Object
##'
##' @method plot jnt
##'
##' @param x Object of class \code{jnt}
##' @param reg_lty Line type for regression lines. Defaults to 1.
##' @param jnt_lty Line type for range of insignificant differences.
##' Defaults to 2.
##' @param col_signif Color for bars denoting range of insignificance.
##' Defaults to "red."
##' @param plot_range logical. If \code{TRUE} (the default) the range
##' of insignificance is plotted.
##' @param ... Additional parameters passed to ggplot (e.g., lwd, pch,
##' xlab, ylab).
##'
##' @author Kevin Middleton \email{middletonk@@missouri.edu}
##'
##' @keywords univar
##'
##' @export
##'
##' @examples
##'
##' example(jnt)
##'
plot.jnt <- function(x,
                     reg_lty = 1,
                     jnt_lty = 2,
                     col_signif = "red",
                     plot_range = TRUE,
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

  M <- data.frame(x = c(x1, x2),
                  y = c(y1, y2),
                  Group = factor(c(rep(1, length(x1)),
                                   rep(2, length(x2)))))

  p <- ggplot(M, aes_string(x = "x", y = "y", color = "Group")) +
    geom_smooth(method = "lm", se = FALSE, lty = reg_lty) +
    geom_point(pch = pch) +
    xlab(xlab) +
    ylab(ylab)

  if (plot_range) {
    p <- p +
      geom_vline(xintercept = x$lower, color = col_signif, lty = jnt_lty) +
      geom_vline(xintercept = x$upper, color = col_signif, lty = jnt_lty)
  }
  return(p)
}
