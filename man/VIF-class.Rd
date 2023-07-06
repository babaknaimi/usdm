\name{VIF-class}

\docType{class}

\alias{VIF-class}

\alias{show,VIF-method}


\title{ VIF class}

\description{

An object of the \code{VIF} class contains information about collinearity in relavant variables. The object can be created with the following functions:  \code{\link[usdm]{vifcor}} and \code{\link[usdm]{vifstep}}.

}

\section{Slots}{
Slots for VIF object
	\describe{
    \item{\code{variables}:}{Character} 
    \item{\code{excluded}:}{character}
    \item{\code{corMatrix}:}{a correlation \code{matrix}}
    \item{\code{results}:}{\code{data.frame} including VIF values for the remained (not excluded) variables }
    }
}


\author{Babak Naimi \email{naimi.b@gmail.com}

\url{https://r-gis.net/}

\url{https://www.biogeoinformatics.org/}
}

\examples{
showClass("VIF")
}

\keyword{classes}
\keyword{spatial}
