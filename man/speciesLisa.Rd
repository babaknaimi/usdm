\name{speciesLisa}

\alias{speciesLisa}
\alias{speciesLisa,Raster,SpatialPoints-method}
\alias{speciesLisa,Raster,SpatialPointsDataFrame-method}
\alias{speciesLisa,SpatRaster,SpatVector-method}

\title{LISA in predictors at species occurrence locations}

\description{
Given a level of positional uncertainty (defined as a distance), this function calculates different statistics of local indicator of spatial association (LISA) in predictors (explanatory variables, defined as a raster object) at each species occurrence location (defined as a SpatialPoints object). According to Naimi et al. 2012, this can be used to understand whether positional uncertainty at which species locations are likely to affect predictive performance of species distribution models.
}

\usage{
speciesLisa(x, y, uncertainty, statistic="K1",weights) 
}

\arguments{
  \item{x}{ explanatory variables (predictors), defined as a raster object (\code{RasterLayer} or \code{RasterStack} or \code{RasterBrick}) }
  \item{y}{ species occurrence points, defined as a \code{SpatialPoints} or \code{SpatialPointsDataFrame} object   }
  \item{uncertainty}{ level of positional uncertainty, defined as a number (distance)}
  \item{statistic}{ a character string specifying the LISA statistic that should be calculated. This can be one of "I", "c", "G", "G*", and "K1". Default is "K1" }
  \item{weights}{ a numeric vector specifying the relative importance of explanatory variables in species distribution models (the first value in the \code{weights}, is the importance of the first variable in \code{x}, and ...). These values will be used as weights to aggregate the LISAs in predictors at each location and calculate a single measure. The length of weights should be equal to the number of raster layers in \code{x}}
}
\details{
This function calculates a LISA statistic for each explanatory variable at each species point. Although several statistics including local Moran's I ("I"), local Geary's c ("c"), local G and G* ("G" and "G*"), and local K1 statistics, can be calculated, according to Naimi et al. (2012), "K1" statistic (default) is recommended.  This function returns a \code{speciesLISA} object, which includes species occurrence data, LISA statistic for each predictor at species locations, and an aggregated LISA statistic (a single LISA) at each species location, given the variable impotances. If weights in not specified, the equal weights (i.e. equal importance for explanatory variables) will be considered.
}

\value{
 \code{speciesLISA}
}


\references{

IF you used this method, please cite the following article for which this package is developed:

Naimi, B., Hamm, N.A.S., Groen, T.A., Skidmore, A.K., and Toxopeus, A.G. 
2014. Where is positional uncertainty a problem for species distribution modelling?, Ecography 37 (2): 191-203.
}

\author{Babak Naimi \email{naimi.b@gmail.com}

\url{https://r-gis.net/}

\url{https://www.biogeoinformatics.org/}
}

\seealso{ \code{\link[usdm]{lisa}}}

\examples{
\dontrun{
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
}


}

\keyword{spatial}
