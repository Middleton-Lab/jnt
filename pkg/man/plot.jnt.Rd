\name{plot.jnt}
\alias{plot.jnt}
\title{Plot jnt Object}
\usage{\method{plot}{jnt}(x, reg.lty=1, jnt.lty=2, col.1="black", col.2="gray",
    col.signif="red", plot.range=TRUE, ...)
}
\description{Plot jnt Object}
\details{Plot object returned by \code{jnt}.}
\author{Kevin Middleton (\email{kmm@csusb.edu})}
\keyword{univar}
\arguments{\item{x}{Object of class \code{jnt}}
\item{reg.lty}{Line type for regression lines. Defaults to 1.}
\item{jnt.lty}{Line type for range of insignificant differences. Defaults to 2.}
\item{col.1}{Color for series 1. Defaults to "black."}
\item{col.2}{Color for series 2. Defaults to "gray."}
\item{col.signif}{Color for bars denoting range of insignificance. Defaults to "red."}
\item{plot.range}{logical. If \code{TRUE} (the default) the range of insignificance is plotted.}
\item{...}{Additional parameters passed to plot (e.g., lwd, pch, xlab, ylab).}
}
\examples{example(jnt)}

