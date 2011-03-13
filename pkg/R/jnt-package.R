##' Johnson-Neyman Technique
##' 
##' Carry out the Johnson-Neyman Technique
##' 
##' \tabular{ll}{
##' Package: \tab jnt\cr
##' Type: \tab Package\cr
##' Version: \tab 0.1-6\cr
##' Date: \tab 2011-03-12\cr
##' License: \tab GPL-2\cr
##' LazyLoad: \tab yes\cr
##' LazyData: \tab yes\cr
##' }
##' 
##' @name jnt-package
##' 
##' @docType package
##' 
##' @author Kevin Middleton (kmm@@csusb.edu)
##' 
##' Maintainer: Kevin Middleton (kmm@@csusb.edu)
##'
##' @references Johnson PO, Neyman J (1936) Tests of certain linear hypotheses
##' and their application to some educational problems. \emph{Statistical
##' Research Memoirs} 1:57-93.
##' 
##' Hunka S, Leighton J (1997) Defining Johnson-Neyman regions of significance
##' in three-covariate ANCOVA using mathematica. \emph{Journal of Educational
##' and Behavioral Statistics} 22: 361-387.
##' 
##' White CR (2003) Allometric analysis beyond heterogenous regression slopes:
##' Use of the Johnson-Neyman Technique in comparative biology. \emph{Physiol
##' Biochem Zool} 76: 135-140.
##' 
##' \emph{Examples:}
##' 
##' White CR (2003) The influence of foraging mode and arid adaptation on the
##' basal metabolic rates of burrowing mammals. \emph{Physiol Biochem Zool}
##' 76: 122-134.
##' 
##' Lavin SR, Karasov WH, Ives AR, Middleton KM, Garland T, Jr (2008) Morphometrics
##' of the avian small intestine compared with that of nonflying mammals: A
##' phylogenetic approach. \emph{Physiol Biochem Zool} 81: 526-550.
##'
##' @keywords package
##'
##' @examples
##' 
##' example(jnt)
##' 
NULL





##' Data from Lavin et al., 2008
##' 
##' Data set 1 from Lavin et al., 2008
##' 
##' 
##' @name Lavin.1
##'
##' @docType data
##'
##' @format A data frame with 64 observations on the following 2 variables.
##' \describe{
##' \item{\code{V1}}{a numeric vector}
##' \item{\code{V2}}{a numeric vector}
##' }
##'
##' @references Lavin SR, Karasov WH, Ives AR, Middleton KM, Garland T, Jr (2008)
##' Morphometrics of the avian small intestine compared with that of nonflying
##' mammals: A phylogenetic approach. \emph{Physiol Biochem Zool} 81: 526-550.
##'
##' @keywords datasets
##'
##' @examples
##' 
##' str(Lavin.1)
##' str(Lavin.2)
##' 
##' (Lavin <- jnt(Lavin.1, Lavin.2))
##' plot(Lavin)
##' 
NULL





##' Data from Lavin et al., 2008
##' 
##' Data set 2 from Lavin et al., 2008
##' 
##' 
##' @name Lavin.2
##' 
##' @docType data
##'
##' @format A data frame with 220 observations on the following 2 variables.
##' \describe{
##' \item{\code{V1}}{a numeric vector}
##' \item{\code{V2}}{a numeric vector}
##' }
##'
##' @references Lavin SR, Karasov WH, Ives AR, Middleton KM, Garland T, Jr (2008)
##' Morphometrics of the avian small intestine compared with that of nonflying
##' mammals: A phylogenetic approach. \emph{Physiol Biochem Zool} 81: 526-550.
##'
##' @keywords datasets
##'
##' @examples
##' 
##' str(Lavin.1)
##' str(Lavin.2)
##' 
##' (Lavin <- jnt(Lavin.1, Lavin.2))
##' plot(Lavin)
##' 
NULL





##' Data from White, 2003
##' 
##' Data set 1 from from White, 2003
##' 
##' 
##' @name White.1
##' 
##' @docType data
##'
##' @format A data frame with 50 observations on the following 2 variables.
##' \describe{
##' \item{\code{V1}}{a numeric vector}
##' \item{\code{V2}}{a numeric vector}
##' }
##'
##' @references White CR (2003) Allometric analysis beyond heterogenous regression
##' slopes: Use of the Johnson-Neyman Technique in comparative biology.
##' \emph{Physiol Biochem Zool} 76: 135-140.
##'
##' @keywords datasets
##'
##' @examples
##' 
##' str(White.1)
##' str(White.2)
##' 
##' (White <- jnt(White.1, White.2))
##' plot(White)
##' 
NULL





##' Data from White, 2003
##' 
##' Data set 2 from from White, 2003
##' 
##' 
##' @name White.2
##'
##' @docType data
##'
##' @format A data frame with 50 observations on the following 2 variables.
##' \describe{
##' \item{\code{V1}}{a numeric vector}
##' \item{\code{V2}}{a numeric vector}
##' }
##'
##' @references White CR (2003) Allometric analysis beyond heterogenous regression
##' slopes: Use of the Johnson-Neyman Technique in comparative biology.
##' \emph{Physiol Biochem Zool} 76: 135-140.
##'
##' @keywords datasets
##'
##' @examples
##' 
##' str(White.1)
##' str(White.2)
##' 
##' (White <- jnt(White.1, White.2))
##' plot(White)
##' 
NULL



