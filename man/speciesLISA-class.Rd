\name{speciesLISA-class}

\docType{class}

\alias{speciesLISA-class}
\alias{spoint-class}

\alias{print,speciesLISA-method}

\title{ speciesLISA class}


\description{

An object of the \code{speciesLISA} class contains information about a local indicator of spatial association (LISA) statistic in predictor variables at the location of species occurrences. The object can be created with the function:  \code{\link[usdm]{speciesLisa}}.
}

\section{Slots}{
Slots for speciesLISA object:
	\describe{
    \item{\code{species}:}{object of class \code{SpatialPoints}} 
    \item{\code{data}:}{\code{data.frame}, attribute table of species points}
    \item{\code{LISAs}:}{\code{matrix}, LISA statistics for different predictors}
    \item{\code{weights}:}{\code{numeric}, the variable importance }
    \item{\code{statistic}:}{\code{character}, the name of LISA statistic }
    \item{\code{LISA}:}{\code{numeric}, aggregated LISAs at each species location }
    }
}


\author{Babak Naimi \email{naimi.b@gmail.com}

\url{https://r-gis.net/}

\url{https://www.biogeoinformatics.org/}
}

\examples{
showClass("speciesLISA")
}

\keyword{classes}
\keyword{spatial}
