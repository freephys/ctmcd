\name{gmci.default}
\alias{gmci.default}
\title{
Confidence / Credibility Intervals for Generator Matrix Objects
}
\description{
Default function to derive confidence / credibility intervals for "EM" or "GS" based generator matrix objects
}
\usage{
\method{gmci}{default}(gm, alpha, eps = 1e-04, cimethod="SdR", expmethod = "PadeRBS", ...)
}
\arguments{
  \item{gm}{
a "EM" or "GS" generator matrix object
}
  \item{alpha}{
significance level
}
  \item{eps}{
threshold for which generator matrix parameters are assumed to be fixed at zero (if "EM" object)
}
 \item{cimethod}{
"SdR" for using the analytical expressions of Smith and dos Reis, 2017 or "BS" for the numerical expressions of Bladt and Soerensen, 2009 (if "EM" object)
}
  \item{expmethod}{
method to compute matrix exponentials (see \code{?expm} from \code{expm} package for more information)
}
  \item{\dots}{
additional arguments
}
}
\details{
If gm is based on the "EM" method (expectation-maximization algorithm), the function computes a Wald confidence interval based on the method of Oakes, 1999. IF gm is based on the "GS" method (Gibbs sampler), the function computes an equal-tailed credibility interval.
}

\references{

M. Bladt and M. Soerensen. Efficient Estimation of Transition Rates Between Credit Ratings from Observations at Discrete Time Points. Quantitative Finance, 9(2):147-160, 2009

D. Oakes. Direct calculation of the information matrix via the EM algorithm. Journal of the Royal Statistical Society: Series B (Statistical Methodology), 61(2):479-482, 1999

G. Smith and G. dos Reis. Robust and Consistent Estimation of Generators in Credit Risk. Quantitative Finance (To Appear), 2017
}
\author{
Marius Pfeuffer
}

\seealso{
\code{\link{ciEMSdR}}, \code{\link{ciEMBS}}, \code{\link{ciGS}}
}
\examples{
\dontrun{
data(tm_abs)

## Maximum Likelihood Generator Matrix Estimate
gm0=matrix(1,8,8)
diag(gm0)=0
diag(gm0)=-rowSums(gm0)
gm0[8,]=0

gmem=gm(tm_abs,te=1,method="EM",gmguess=gm0)

## Oakes Confidence Interval
ciem=gmci(gmem,alpha=0.05)
ciem
}
}