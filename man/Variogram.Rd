\name{Variogram}

\alias{Variogram}
\alias{Variogram,RasterLayer-method}


\title{Empirical variogram for raster data}

\description{
Compute sample (empirical) variogram from raster data. The function returns a binned variogram and a variogram cloud.
}

\usage{
Variogram(x, lag, cutoff, cells, size=100) 
}

\arguments{
  \item{x}{ a raster object (\code{RasterLayer}) }
  \item{lag}{ the lag size (width of subsequent distance intervals) into which cell pairs are grouped for semivariance estimates. If missing, the cell size (raster resolution) is assigned. }
  \item{cutoff}{ spatial separation distance up to which cell pairs are included in semivariance estimates; as a default, the length of the diagonal of the box spanning the data is divided by three. }
  \item{cells}{ numeric (optional). A vector of cell numbers in the Raster object. This forces the function to only consider these cells (and their neighbours) to compute the variogram.}
  \item{size}{ positive integer specifying the number of cells to be drawn from raster object. If the number of cells in the raster object is large, a sample with the specified size is drawn to make the computation more efficient. }
}
\details{
Variograms are widely used for exploring spatial structure in a single variable. Formally, it is defined as half the expected squared difference (half the variance of the difference) in the variable value at a specific geographical separation. A variogram summarizes the spatial relations in the data, and can be used to understand within what range (distance) the data is spatially autocorrelated. Naimi et al. (2011) linked this range to the impact of positional uncertainty on the performance of species distribution models (SDMs). Based on that study, examining variogram to find the effective autocorrelation range in predictors gives insight into whether predictions by SDMs are likely to be affected by the uncertainty in the sample locations (see Naimi et al. 2011, for more information).
}

\value{
\item{RasterVariogram}{}
}

\references{
Naimi, B., Skidmore, A.K, Groen, T.A., Hamm, N.A.S. 2011. Spatial autocorrelation in predictors reduces the impact of positional uncertainty in occurrence data on species
distribution modelling, Journal of biogeography. 38: 1497-1509.

Naimi, B., Hamm, N.A.S., Groen, T.A., Skidmore, A.K., and Toxopeus, A.G. 
2014. Where is positional uncertainty a problem for species distribution modelling?, Ecography 37 (2): 191-203.

}


\author{Babak Naimi \email{naimi.b@gmail.com}

\url{http://r-gis.net}
}


\examples{
\dontrun{
file <- system.file("external/spain.grd", package="usdm")

r <- brick(file) # reading a RasterBrick object including 10 raster layers in Spain

r 

plot(r[[1]]) # plot the first RasterLayer in r

v1 <- Variogram(r[[1]]) # compute the sample variogram for the first layer in r

v2 <- Variogram(r[[1]],lag=25000,cutoff=100000) # specify the lag and cutoff parameters
}

}

\keyword{spatial}
