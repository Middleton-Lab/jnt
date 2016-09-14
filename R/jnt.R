##' Johnson-Neyman Technique
##'
##' This function performs the Johnson-Neyman Technique on data
##' contained in two \code{data.frame}s. Currently only the method for
##' \code{data.frame}s is implemented.
##'
##' @title Johnson-Neyman Technique
##'
##' @param dat1 \code{data.frame} containing data set 1
##' @param dat2 \code{data.frame} containing data set 2
##' @param which.is.fact Currently not implemented
##' @param alpha Desired alpha level for comparison
##' @param total.comp Total number of comparisons
##' @param use_sma Boolean; use standardized major axis regression
##'
##' @return A list of type \code{jnt} containing:
##' \item{dat1}{Data set 1}
##' \item{dat2}{Data set 2}
##' \item{alpha}{Alpha level}
##' \item{slope1}{Slope for data set 1}
##' \item{int1}{intercept for data set 1}
##' \item{slope2}{Slope for data set 2}
##' \item{int2}{intercept for data set 2}
##' \item{lower}{Lower edge of range of no significant different in
##' slopes}
##' \item{upper}{Upper edge of range of no significant different in
##' slopes}
##'
##' @author Kevin Middleton (\email{middletonk@@missouri.edu})
##'
##' @references Johnson PO and Neyman J (1936) Tests of certain linear
##'   hypotheses and their application to some educational problems.
##'   \emph{Statistical Research Memoirs} 1: 57-93.
##'
##' Hunka S and Leighton J (1997) Defining Johnson-Neyman regions of
##' significance in three-covariate ANCOVA using Mathematica.
##' \emph{Journal of Educational and Behavioral Statistics} 22:
##' 361-387.
##'
##' White CR (2003) Allometric analysis beyond heterogenous regression
##' slopes: Use of the Johnson-Neyman Technique in comparative
##' biology. \emph{Physiol Biochem Zool} 76: 135-140.
##'
##' \emph{Examples:}
##'
##' White CR (2003) The influence of foraging mode and arid adaptation
##' on the basal metabolic rates of burrowing mammals. \emph{Physiol
##' Biochem Zool} 76: 122-134.
##'
##' Lavin SR, Karasov WH, Ives AR, Middleton KM, Garland T (2008)
##' Morphometrics of the avian small intestine compared with that of
##' nonflying mammals: A phylogenetic approach. \emph{Physiol Biochem
##' Zool} 81: 526-550.
##'
##' @keywords univar
##'
##' @examples
##'
##' # Simulate data
##' set.seed(1234)
##'
##' n <- 50
##'
##' x1 <- rnorm(n)
##' y1 <- x1 + rnorm(n, sd = 0.2)
##'
##' x2 <- rnorm(n)
##' y2 <- 1.25 * x2 + rnorm(n, sd = 0.2)
##'
##' df1 <- data.frame(x = x1, y = y1)
##' df2 <- data.frame(x = x2, y = y2)
##'
##' (jnt.out <- jnt(df1, df2))
##'
##' plot(jnt.out)
##'
##' @export
##'
jnt <- function(dat1,
                dat2 = NULL,
                which.is.fact = NULL,
                alpha = 0.05,
                total.comp = 1,
                use_sma = FALSE) {

  if (use_sma) {
    message("Fitting with SMA.")
    fit_method <- "SMA"
  } else {
    message("Fitting with OLS")
    fit_method <- "OLS"
  }

  # Convert to data.frames to avoid problems with tbl_df
  dat1 <- as.data.frame(dat1)
  dat2 <- as.data.frame(dat2)

  # Rename column variables to x and y
  message("Assuming x variable is column 1, and y is column 2.")
  names(dat1) <- c("x", "y")
  names(dat2) <- c("x", "y")

  ## Test for significant slope difference
  not.signif <- precheck(dat1, dat2)
  if (not.signif) {
    stop("The slopes are not significantly different.
         You probably should reconsider using
         the Johnson-Neyman Technique.")
  }
  fm2 <- sma(y ~ x, data = dat2, method = fit_method)
  fm1 <- lm(dat1$y ~ dat1$x)
  fm2 <- lm(dat2$y ~ dat2$x)

  a1 <- as.numeric(coef(fm1))[1]
  b1 <- as.numeric(coef(fm1))[2]

  a2 <- as.numeric(coef(fm2))[1]
  b2 <- as.numeric(coef(fm2))[2]

  n1 <- nrow(dat1)
  n2 <- nrow(dat2)
  N <- n1 + n2
  f_crit <- qf((1 - alpha / 2), 1, N - 4)

  ss_resid <- sum(residuals(fm1) ^ 2) + sum(residuals(fm2) ^ 2)
  ss_x1 <- sum((dat1$x - mean(dat1$x)) ^ 2)
  ss_x2 <- sum((dat2$x - mean(dat2$x)) ^ 2)

  A <- ((-f_crit / (N - 4)) * ss_resid * (1/ss_x1 + 1/ss_x2)) + (b1 - b2) ^ 2
  B <- ((f_crit / (N - 4)) * ss_resid * (mean(dat1$x)/ss_x1 + mean(dat2$x/ss_x2))) +
    ((a1 - a2) * (b1 - b2))
  C <- (-f_crit / (N - 4)) * ss_resid *
    (((N / (n1 * n2)) +
        (mean(dat1$x) ^ 2 / ss_x1) +
        (mean(dat2$x) ^ 2 / ss_x2))) + ((a1 - a2) ^ 2)

  # Check that the comparison makes sense
  if (is.nan(tryCatch(sqrt(B^2 - A * C)))) {
    stop("No Difference Can Be Detected at this Level of Significance")
  }

  if ((-1 * B + sqrt(B ^ 2 - C * A) ) / A <
      ((-1 * B - sqrt(B ^ 2 - A * C)) / A)) {
    stop("No Difference Can Be Detected at this Level of Significance")
  }

  lower <- (-B - sqrt((B ^ 2) - (A * C))) / A
  upper <- (-B + sqrt((B ^ 2) - (A * C))) / A

  jntobj <- list("dat1" = data.frame(x = dat1$x, y = dat1$y),
                 "dat2" = data.frame(x = dat2$x, y = dat2$y),
                 "alpha" = alpha,
                 "slope1" = b1,
                 "int1" = a1,
                 "slope2" = b2,
                 "int2" = a2,
                 "lower" = lower,
                 "upper" = upper)
  class(jntobj) <- "jnt"
  return(jntobj)
}

##' @export
print.jnt <- function(x, digits = 4, ...){
  cat("\n")
  cat("Johnson-Neyman Technique\n")
  cat("\n")
  cat("Alpha = ", x$alpha, "\n")
  cat("\n")
  cat("Data 1:\n")
  cat("\tSlope\t\t", format(x$slope1, digits = digits), "\n")
  cat("\tIntercept\t", format(x$int1, digits = digits), "\n")
  cat("\n")
  cat("Data 2:\n")
  cat("\tSlope\t\t", format(x$slope2, digits = digits), "\n")
  cat("\tIntercept\t", format(x$int2, digits = digits), "\n")
  cat("\n")
  cat("Region of non-significant slope difference\n")
  cat("\tLower:", format(x$lower, digits = digits), "\n")
  cat("\tUpper:", format(x$upper, digits = digits), "\n\n")
}

## Check for no slope difference
precheck <- function(dat1, dat2){
  dat1.n <- nrow(dat1)
  dat2.n <- nrow(dat2)
  dd <- data.frame(x = c(dat1[, 1], dat2[, 1]),
                   y = c(dat1[, 2], dat2[, 2]),
                   A = as.factor(c(rep(1, times = dat1.n),
                                   rep(2, times = dat2.n))))
  fm <- lm(y ~ x * A, data = dd)
  fm.summary <- coef(summary(fm))
  if (fm.summary[4, 4] < 0.05) {
    not.signif <- FALSE
  } else {
    not.signif <- TRUE
  }
  return(not.signif)
}
