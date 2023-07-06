\name{vif}

\alias{vif}
\alias{vifcor}
\alias{vifstep}

\alias{vif,RasterStackBrick-method}
\alias{vif,SpatRaster-method}
\alias{vif,data.frame-method}
\alias{vif,matrix-method}
\alias{vifcor,RasterStackBrick-method}
\alias{vifcor,SpatRaster-method}
\alias{vifcor,data.frame-method}
\alias{vifcor,matrix-method}
\alias{vifstep,RasterStackBrick-method}
\alias{vifstep,SpatRaster-method}
\alias{vifstep,data.frame-method}
\alias{vifstep,matrix-method}



\title{Variance Inflation Factor and test for multicollinearity}

\description{
Calculates variance inflation factor (VIF) for a set of variables and exclude the highly correlated variables from the set through a stepwise procedure. This method can be used to deal with multicollinearity problems when you fit statistical models}

\usage{
vif(x, size, ...)
vifcor(x, th = 0.9, keep = NULL, size, method = 'pearson', ...)
vifstep(x, th = 10, keep = NULL, size, method = 'pearson', ...)
}

\arguments{
  \item{x}{ Numeric explanatory variables (predictors), defined as a raster object (\code{RasterStack} or \code{RasterBrick} or \code{SpatRaster}), or as a \code{matrix}, or as a \code{data.frame}. }
  \item{th}{ a numeric value specifying the correlation threshold for vifcor, and VIF threshold for vifstep (see details).}
  \item{keep}{A character vector with the name of variables that should not be excluded even if they are collinear, e.g., because of ecological reasons}
  \item{size}{When the data is big, a random sample of the records (cells from raster or rows from data.frame) with the specified size is selected; default is 5000.}
  \item{method}{a chatacter (one of c("pearson","spearman","kendall")) specifies the method to calculate a pairwise correlation; deafult="pearson".}
  \item{...}{not implemented.}
  }
\details{
VIF can be used to detect collinearity (Strong correlation between two or more predictor variables). Collinearity causes instability in parameter estimation in regression-type models. The VIF is based on the square of the multiple correlation coefficient resulting from regressing a predictor variable against all other predictor variables. If a variable has a strong linear relationship with at least one other variables, the correlation coefficient would be close to 1, and VIF for that variable would be large.  A VIF greater than 10 is a signal that the model has a collinearity problem. \code{vif} function calculates this statistic for all variables in \code{x}. \code{vifcor} and \code{vifstep} uses two different strategy to exclude highly collinear variable through a stepwise procedure. 

- \code{vifcor}, first finds a pair of variables which has the maximum linear correlation (greater than the threshold; th), and exclude the one with a greater VIF. The procedure is repeated untill no pair of variables with a high corrrelation coefficient (grater than the threshold) remains. 

- \code{vifstep} calculates VIF for all variables, excludes the one with the highest VIF (if it is greater than the threshold), repeat the procedure untill no variables with a VIF greater than \code{th} remains.

addtional arguments:

\code{method} default is "pearson", specifies the correlation method (one'pearson','kendall','spearman')

\code{size} a number (default=5000) specifying the maximum number of observations should be contributed in calculation of VIF. When the number of observations (cells in raster or rows in data.frame/matrix) is greater than \code{size}, then a random sample with a size of \code{size} is drawn to keep the calculation effecient.

\code{keep}: sometimes we may have strong biological/ecological justification to keep some variables in the model even if the statistical calculations suggest otherwise. In that case, the \code{keep} argument can help to introduce the name of such variables (or the number specifying which columns in data.frame or which layers in raster object should be kept) to the functions, then the stepwise procedure take them into account to find which variables should be excluded.


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

\url{https://r-gis.net/}

\url{https://www.biogeoinformatics.org/}
}

\seealso{ \code{\link[usdm]{exclude}}}

\examples{
\dontrun{
file <- system.file("external/spain.tif", package="usdm")

r <- rast(file) # reading a SpatRaster object including 10 raster layers in Spain

r 

vif(r) # calculates vif for the variables in r

v1 <- vifcor(r, th=0.9) # identify collinear variables that should be excluded

v1

v2 <- vifstep(r, th=10) # identify collinear variables that should be excluded

v2

v3 <- vifstep(r, th=10, keep = c('Bio4','Bio10')) 

v3

}
}

\keyword{spatial}
