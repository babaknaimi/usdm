\name{plot.speciesLISA}

\docType{methods}

\alias{plot.speciesLISA}
\alias{plot,speciesLISA,missing-method}
\alias{plot,speciesLISA,SpatialPolygons-method}
\alias{plot,speciesLISA,SpatialPolygonsDataFrame-method}
\alias{plot,speciesLISA,SpatVector-method}

\title{Plot positional uncertainty based on LISA}

\description{
Plot the values of LISAs at species occurrence locations, which can be used to identify the locations that need positional uncertainty treatment. }

\usage{

\S4method{plot}{speciesLISA,missing}(x, y, ...)
\S4method{plot}{speciesLISA,SpatialPolygons}(x, y, ...)
\S4method{plot}{speciesLISA,SpatialPolygonsDataFrame}(x, y, ...)

}

\arguments{
  \item{x}{ an object of class \code{speciesLISA}, which is the output of \code{\link[usdm]{speciesLisa}} function. }
  \item{y}{ optional. Boundary map of the study area, an object of class \code{SpatialPolygons}.}
  \item{...}{ additional argument (see details)}
  }
\details{
This function generates a map (i.e. a bubble plot) in which the species points present the magnitude of LISA in predictors at the location as open or filled circles with different sizes.

Below are additional arguments:

 \code{cex} the maximum symbol size (circle) in the plot. 
 \code{levels} specifies the number of LISA levels at which the points are presented .
 \code{xyLegend} a vector with two numbers, specifying the coordinates of the legend. If missing, the function tries to find the appropriate location for it.
 \code{...} \code{xlab}, \code{ylab} and \code{main} same as the base \code{plot} function.
}

\value{
 plots the bubble plot.
}


\author{Babak Naimi \email{naimi.b@gmail.com}

\url{https://r-gis.net/}

\url{https://www.biogeoinformatics.org/}
}

\seealso{ \code{\link[usdm]{speciesLisa}}, \code{\link[usdm]{lisa}}}

\examples{
file <- system.file("external/predictors.tif", package="usdm")

r <- rast(file) # reading a RasterBrick object including 4 rasters in the Netherlands

r 

plot(r) # visualize the raster layers

sp.file <- system.file("external/species_nl.shp", package="usdm")
sp <- vect(sp.file)


splisa <- speciesLisa(x=r,y=sp,uncertainty=15000,weights=c(0.22,0.2,0.38,0.2))

splisa

plot(splisa)

bnd.file <- system.file("external/boundary.shp", package="usdm")
bnd <- vect(bnd.file) # reading the boundary map

plot(splisa,bnd)

#plot(splisa,bnd,levels=c(2,4,6,8))

#plot(splisa,bnd,levels=c(-5,-3,0,3,5))

}

\keyword{methods}
\keyword{spatial}
