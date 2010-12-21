\name{Lavin.1}
\alias{Lavin.1}
\docType{data}
\title{Data from Lavin et al., 2008}

\description{
Data set 1 from Lavin et al., 2008
}

\usage{data(Lavin.1)}

\format{
  A data frame with 64 observations on the following 2 variables.
  \describe{
    \item{\code{V1}}{a numeric vector}
    \item{\code{V2}}{a numeric vector}
  }
}

%\details{
%%  ~~ If necessary, more details than the __description__ above ~~
%}

\source{
Lavin SR, Karasov WH, Ives AR, Middleton KM, Garland T (2008) Morphometrics of the avian small intestine compared with that of nonflying mammals: A phylogenetic approach. \emph{Physiol Biochem Zool} 81:526-550.
}

%\references{
%%  ~~ possibly secondary sources and usages ~~
%}

\examples{
data(Lavin.1)
str(Lavin.1)
data(Lavin.2)
str(Lavin.2)

(Lavin <- jnt(Lavin.1, Lavin.2))
plot(Lavin)
}

\keyword{datasets}
