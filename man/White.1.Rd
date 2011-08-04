\docType{data}
\name{White.1}
\alias{White.1}
\alias{White.2}
\title{Data from White, 2003}
\format{A data frame with 50 observations on the following 2 variables.
\describe{
\item{\code{V1}}{a numeric vector}
\item{\code{V2}}{a numeric vector}
}}
\description{
  Data set 1 from from White, 2003
}
\examples{
str(White.1)
str(White.2)

(White <- jnt(White.1, White.2))
plot(White)
}
\references{
  White CR (2003) Allometric analysis beyond heterogenous
  regression slopes: Use of the Johnson-Neyman Technique in
  comparative biology. \emph{Physiol Biochem Zool} 76:
  135-140.
}
\keyword{datasets}

