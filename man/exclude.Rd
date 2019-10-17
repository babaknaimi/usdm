\name{exclude}

\alias{exclude}
\alias{exclude,RasterStack,VIF-method}
\alias{exclude,RasterBrick,VIF-method}
\alias{exclude,data.frame,VIF-method}
\alias{exclude,matrix,VIF-method}
\alias{exclude,RasterStack,missing-method}
\alias{exclude,RasterBrick,missing-method}
\alias{exclude,data.frame,missing-method}
\alias{exclude,matrix,missing-method}

\title{Excluding variables specified in a VIF object}

\description{
Phisically exclude the collinear variables which are identified using \code{vifcor} or \code{vifstep} from a set of variables.}

\usage{
exclude(x, vif, ...)
}

\arguments{
  \item{x}{ explanatory variables (predictors), defined as a raster object (\code{RasterStack} or \code{RasterBrick}), or as a \code{matrix}, or as a \code{data.frame}. }
  \item{vif}{ an object of class \code{VIF}, resulted from  \code{vifcor} or \code{vifstep} functions.}
  \item{...}{ additional argument as in \code{vifstep}}
  }
\details{
Before using this function, you should execute one of \code{vifstep} or \code{vifcor} which detect collinearity based on calculating variance inflation factor (VIF) statistics. If \code{vif} is missing, then \code{vifstep} is called.}

\value{
 an object of class same as \code{x} (i.e. \code{RasterStack} or \code{RasterBrick} or \code{data.frame} or \code{matrix})
}


\author{Babak Naimi \email{naimi.b@gmail.com}

\url{http://r-gis.net}
}


\references{

IF you used this method, please cite the following article for which this package is developed:

Naimi, B., Hamm, N.A.S., Groen, T.A., Skidmore, A.K., and Toxopeus, A.G. 
2014. Where is positional uncertainty a problem for species distribution modelling?, Ecography 37 (2): 191-203.
}

\seealso{ \code{\link[usdm]{vif}}}

\examples{
\dontrun{
file <- system.file("external/spain.grd", package="usdm")

r <- brick(file) # reading a RasterBrick object including 10 raster layers in Spain

r 

vif(r) # calculates vif for the variables in r

v1 <- vifcor(r, th=0.9) # identify collinear variables that should be excluded

v1

re1 <- exclude(r,v1) # exclude the collinear variables that were identified in 
# the previous step

re1

v2 <- vifstep(r, th=10) # identify collinear variables that should be excluded

v2

re2 <- exclude(r, v2) # exclude the collinear variables that were identified in 
# the previous step

re2

re3 <- exclude(r) # first, vifstep is called 


re3
}
}

\keyword{spatial}
