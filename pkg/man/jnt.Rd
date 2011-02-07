\name{jnt}
\alias{jnt}
\title{Johnson-Neyman Technique...}
\usage{jnt(dat1, dat2, which.is.fact, alpha=0.05, total.comp=1)
}
\description{Johnson-Neyman Technique}
\details{This function performs the Johnson-Neyman Technique on data contained in two
\code{data.frame}s.}
\alias{jnt}
\alias{jnt.data.frame}
\alias{print.jnt}
\value{A list of type \code{jnt} containing:
\item{dat1}{Data set 1}
\item{dat2}{Data set 2}
\item{alpha}{Alpha level}
\item{slope1}{Slope for data set 1}
\item{int1}{intercept for data set 1}
\item{slope2}{Slope for data set 2}
\item{int2}{intercept for data set 2}
\item{lower}{Lower edge  of range of no significant different in slopes}
\item{upper}{Upper edge of range of no significant different in slopes}}
\author{Kevin Middleton (\email{kmm@csusb.edu})}
\references{Johnson PO, Neyman J (1936) Tests of certain linear hypotheses
and their application to some educational problems. \emph{Statistical
Research Memoirs} 1: 57-93.

Hunka S, Leighton J (1997) Defining Johnson-Neyman regions of significance
in three-covariate ANCOVA using mathematica. \emph{Journal of Educational
and Behavioral Statistics} 22: 361-387.

White CR (2003) Allometric analysis beyond heterogenous regression slopes:
Use of the Johnson-Neyman Technique in comparative biology. \emph{Physiol
Biochem Zool} 76: 135-140.

\emph{Examples:}

White CR (2003) The influence of foraging mode and arid adaptation on the
basal metabolic rates of burrowing mammals. \emph{Physiol Biochem Zool}
76: 122-134.

Lavin SR, Karasov WH, Ives AR, Middleton KM, Garland T (2008) Morphometrics
of the avian small intestine compared with that of nonflying mammals: A
phylogenetic approach. \emph{Physiol Biochem Zool} 81: 526-550.}
\keyword{univar}
\arguments{\item{dat1}{\code{data.frame} containing data set 1}
\item{dat2}{\code{data.frame} containing data set 2}
\item{which.is.fact}{Currently not implemented}
\item{alpha}{Desired alpha level for comparison}
\item{total.comp}{Total number of comparisons}
}
\examples{# Simulate data
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

plot(jnt.out)}

