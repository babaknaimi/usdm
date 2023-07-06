\name{lisa}

\alias{lisa}
\alias{lisa,Raster,missing-method}
\alias{lisa,SpatRaster,missing-method}
\alias{lisa,SpatRaster,SpatVector-method}
\alias{lisa,Raster,SpatialPoints-method}
\alias{lisa,Raster,SpatialPointsDataFrame-method}

\title{Local indicators of spatial association}

\description{
Calculate different statistics of local indicator of spatial association (LISA) for each cell in a raster data.
}

\usage{
lisa(x, y, d1=0, d2, cell, statistic="I") 
}

\arguments{
  \item{x}{ a raster object (\code{RasterLayer} or \code{RasterStack} or \code{RasterBrick}) }
  \item{y}{ a \code{SpatialPoints} object (optional)   }
  \item{d1}{ numeric. A number (distance), specifies local neighborhood size. Default is 0, means that the local neighborhood starts from the cell (distance = 0) and ends to a distance = d2 }
  \item{d2}{ numeric. A number (distance), specifies local neighborhood size. It specifies the distance to which should be considered as a local neighborhood around a cell}
  \item{cell}{ numeric (optional). A cell number or a vector of cell numbers in the Raster object, at which LISA should be calculated}
  \item{statistic}{ a character string specifying the LISA statistic that should be calculated. This can be one of "I", "c", "G", "G*", and "K1" }
}
\details{
This function can calculate different LISA statistics at each grid cell in Raster object. The statistics, implemented in this function, include local Moran's I ("I"), local Geary's c ("c"), local G and G* ("G" and "G*"), and local K1 statistics. This function returns standardized value (Z) for Moran, G and G*, and K1 statistics. If a \code{SpatialPoints} or a vector of numbers is defined for \code{y} or \code{cell}, the LISA is calculated only for the specified locations by points or cells.

Note: A set of similar functions have been implemented in the \code{elsa} package by the author of this package, and since the computation part of elsa is written in C programming language, the function in elsa is much faster.

}

\value{
\item{RasterLayer}{if \code{x} is a \code{RasterLayer} and both \code{y} and \code{cell} are missed}
\item{RasterBrick}{if \code{x} is a \code{RasterStack} or a \code{RasterBrick} and both \code{y} and \code{cell} are missed}
\item{numeric vector}{if \code{y} or \code{cell} is specified}
}

\references{

Anselin, L. 1995. Local indicators of spatial association, Geographical Analysis, 27, 93--115;

Getis, A. and Ord, J. K. 1996 Local spatial statistics: an overview. In P. Longley and M. Batty (eds) \emph{Spatial analysis: modelling in a GIS environment} (Cambridge: Geoinformation International), 261--277.

Naimi, B., Hamm, N.A.S., Groen, T.A., Skidmore, A.K., and Toxopeus, A.G. 
2014. Where is positional uncertainty a problem for species distribution modelling?, Ecography 37 (2): 191-203.


}


\author{Babak Naimi \email{naimi.b@gmail.com}

\url{https://r-gis.net/}

\url{https://www.biogeoinformatics.org/}
}


\examples{
\dontrun{


file <- system.file("external/spain.tif", package="usdm")

r <- rast(file) # reading a RasterBrick object including 10 rasters in Spain

r

plot(r) # visualize the raster layers

plot(r[[1]]) # visualize the first raster layer

r.I <- lisa(x=r[[1]],d1=0,d2=25000,statistic="I") # local Moran's I

plot(r.I)

# entering r instead of r[[1]], givees the indicator for each layer:
r.I <- lisa(x=r,d1=0,d2=25000,statistic="I")
plot(r.I)

r.c <- lisa(x=r[[1]],d1=0,d2=25000,statistic="c") # local Geary's c

plot(r.c)

r.g <- lisa(x=r[[1]],d1=0,d2=25000,statistic="G") # G statistic

plot(r.g)

r.g2 <- lisa(x=r[[1]],d1=0,d2=25000,statistic="G*") # G* statistic

plot(r.g2)

r.K1 <- lisa(x=r[[1]],d1=0,d2=30000,statistic="K1") # gives K1 statistic for each layer

plot(r.K1)

lisa(x=r,d1=0,d2=30000,cell=2000,statistic="I") # gives local Moran's I at cell number 2000
#for each raster layer in r

lisa(x=r,d1=0,d2=30000,cell=c(2000,2002,2003),statistic="c") # calculates local Moran's I
# at cell numbers of 2000,2002, and 2003 for each raster layer in r

sp <- sampleRandom(r[[1]],20,sp=TRUE) # draw 20 random points from r, 
# and returns a SpatialPointsDataFrame

plot(r[[1]])

points(sp)

lisa(x=r,y=sp,d1=0,d2=30000,statistic="I") # calculates the local Moran's I at 
# point locations in sp for each raster layer in r
}


}

\keyword{spatial}
