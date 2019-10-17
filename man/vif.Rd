\name{vif}

\alias{vif}
\alias{vifcor}
\alias{vifstep}

\alias{vif,RasterStackBrick-method}
\alias{vif,data.frame-method}
\alias{vif,matrix-method}
\alias{vifcor,RasterStackBrick-method}
\alias{vifcor,data.frame-method}
\alias{vifcor,matrix-method}
\alias{vifstep,RasterStackBrick-method}
\alias{vifstep,data.frame-method}
\alias{vifstep,matrix-method}



\title{Variance Inflation Factor and test for multicollinearity}

\description{
Calculates variance inflation factor (VIF) for a set of variables and exclude the highly correlated variables from the set through a stepwise procedure. This method can be used to deal with multicollinearity problems when you fit statistical models}

\usage{
vif(x, ...)
vifcor(x,th=0.9, ...)
vifstep(x,th=10, ...)
}

\arguments{
  \item{x}{ explanatory variables (predictors), defined as a raster object (\code{RasterStack} or \code{RasterBrick}), or as a \code{matrix}, or as a \code{data.frame}. }
  \item{th}{ a number specifying the correlation threshold for vifcor and VIF threshold for vifstep (see details).   }
  \item{...}{additional arguments. see details.}
  }
\details{
VIF can be used to detect collinearity (Strong correlation between two or more predictor variables). Collinearity causes instability in parameter estimation in regression-type models. The VIF is based on the square of the multiple correlation coefficient resulting from regressing a predictor variable against all other predictor variables. If a variable has a strong linear relationship with at least one other variables, the correlation coefficient would be close to 1, and VIF for that variable would be large.  A VIF greater than 10 is a signal that the model has a collinearity problem. \code{vif} function calculates this statistic for all variables in \code{x}. \code{vifcor} and \code{vifstep} uses two different strategy to exclude highly collinear variable through a stepwise procedure. \code{vifcor}, first find a pair of variables which has the maximum linear correlation (greater than th), and exclude one of them which has greater VIF. The procedure is repeated untill no variable with a high corrrelation coefficient (grater than threshold) with other variables remains. \code{vifstep} calculate VIF for all variables, exclude one with highest VIF (greater than threshold), repeat the procedure untill no variables with VIF greater than \code{th} remains.

addtional arguments:
\code{method} default is "pearson", specifies the correlation method (one'pearson','kendall','spearman')
\code{maxobservations} a number (default=5000) specifying the maximum number of observations should be contributed in calculation of VIF. When the number of observations (cells in raster or rows in data.frame/matrix) is greater than \code{maxobservations}, then a random sample with a size of \code{maxobservations} is drawn to keep the calculation effecient.

}

\value{
 an object of class \code{VIF}
}

\references{Chatterjee, S. and Hadi, A. S. 2006. Regression analysis by example. John Wiley and Sons.;

Dormann, C. F. et al. 2012. Collinearity: A review of methods to Deal with it and a simulation study evaluating their performance. Ecography 35: 001-020.;

--------------

IF you used this method, please cite the following article for which this package is developed:

Naimi, B., Hamm, N.A.S., Groen, T.A., Skidmore, A.K., and Toxopeus, A.G. 
2014. Where is positional uncertainty a problem for species distribution modelling?, Ecography 37 (2): 191-203.
}

\author{Babak Naimi \email{naimi.b@gmail.com}

\url{http://r-gis.net}
}

\seealso{ \code{\link[usdm]{exclude}}}

\examples{
\dontrun{
file <- system.file("external/spain.grd", package="usdm")

r <- brick(file) # reading a RasterBrick object including 10 raster layers in Spain

r 

vif(r) # calculates vif for the variables in r

v1 <- vifcor(r, th=0.9) # identify collinear variables that should be excluded

v1

v2 <- vifstep(r, th=10) # identify collinear variables that should be excluded

v2
}
}

\keyword{spatial}
