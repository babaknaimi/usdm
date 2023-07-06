# Author: Babak Naimi, naimi.b@gmail.com
# Date :  Sep 2012
# Version 1.0
# Licence GPL v3

#setClassUnion("spoint", c("SpatVector","SpatialPoints")) 

setClass("speciesLISA",
         representation(species="SpatVector",
                        data="data.frame",
                        LISAs="matrix",
                        weights="numeric",
                        statistic="character",
                        LISA="numeric")
         )

setClass("VIF",
         representation(variables="character",
                        excluded="character",
                        corMatrix="matrix",
                        results="data.frame")
)

setClass("RasterVariogram",
         representation(lag="numeric",
                        nlags="numeric",
                        variogramCloud="matrix",
                        variogram="data.frame")
)
