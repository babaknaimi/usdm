\name{RasterVariogram-class}

\docType{class}

\alias{RasterVariogram-class}

\alias{show,RasterVariogram-method}

\title{ RasterVariogram class}

\description{

An object of the \code{RasterVariogram} class contains information about the empirical variogram of a raster data. The object can be created with the function:  \code{\link[usdm]{Variogram}}.

}

\section{Slots}{
Slots for speciesLISA object:
	\describe{
    \item{\code{lag}:}{a number specifying lag distance} 
    \item{\code{nlags}:}{a number specifying number of lags based on cutoff parameter}
    \item{\code{variogramCloud}:}{\code{matrix}, including semivariance for all pairs}
    \item{\code{variogram}:}{\code{data.frame}, including binned semivariance within each lag }
    }
}


\author{Babak Naimi \email{naimi@r-gis.net}

\url{https://r-gis.net/}

\url{https://www.biogeoinformatics.org/}
}

\examples{
showClass("speciesLISA")
}

\keyword{classes}
\keyword{spatial}
