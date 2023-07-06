\name{plot.RasterVariogram}

\docType{methods}

\alias{plot.RasterVariogram}
\alias{plot,RasterVariogram-method}

\title{Plot variogram or variogram cloud or boxplot based on variogram cloud}

\description{
Plot the variogram computed for raster data by \code{Variogram} function }

\usage{

\S4method{plot}{RasterVariogram}(x, ...)

}

\arguments{
  \item{x}{ an object of class \code{RasterVariogram}, which is the output of \code{\link[usdm]{Variogram}} function. }
  \item{...}{ additional argument (see details)}
  }
\details{
This function plot the empirical variogram, or variogram cloud if \code{cloud} set to \code{TRUE} or a boxplot of variogram cloud data if \code{box} set to \code{TRUE},

Below are additional arguments:

 \code{cloud} logical. If \code{TRUE}, the function plots variogram cloud. 
 \code{box} logical. If \code{TRUE}, the function plots boxplot of variogram cloud.
 \code{...} \code{xlab}, \code{ylab} and \code{main} and other arguments are same as the base \code{plot} function.
}

\value{
 plots the variogram.
}


\author{Babak Naimi \email{naimi.b@gmail.com}

\url{https://r-gis.net/}
\url{https://www.biogeoinformatics.org/}
}

\seealso{ \code{\link[usdm]{Variogram}}}

\examples{
file <- system.file("external/spain.tif", package="usdm")

r <- rast(file) # reading a RasterBrick including 5 rasters (predictor variables)

r 

plot(r[[1]]) # visualize the raster layers

v1 <- Variogram(r[[1]]) # compute variogram for the first raster


plot(v1)

plot(v1,cloud=TRUE)

plot(v1,box=TRUE)

}

\keyword{methods}
\keyword{spatial}
