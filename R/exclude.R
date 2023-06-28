# Author: Babak Naimi, naimi.b@gmail.com
# Date :  July. 2015
# Last update: June 2023
# Version 1.6
# Licence GPL v3

if (!isGeneric("exclude")) {
  setGeneric("exclude", function(x,vif,...)
    standardGeneric("exclude"))
}  

setMethod ('exclude' ,signature(x='RasterStack', vif='VIF'),
           function (x,vif,...) {
             n <- names(x)
             #for (i in 1:length(vif@results[,1])) if (!as.character(vif@results[i,1]) %in% n) stop("One or all variables in VIF are not in the Raster object")
             if (length(vif@excluded) > 0) {
               .ex <- vif@excluded %in% n
               if (all(!.ex)) {
                 stop('None of the variables in the Raster object are among those variables specified in the VIF object to be excluded!')
               } else if (any(!.ex)) {
                 warning(paste0('The variables (',paste(vif@excluded[!.ex],collapse = ', '),') are not available in the Raster object!'))
               }
               j <- which(n %in% vif@excluded)
               x <- x[[-j]]
             } else {
               warning('No variable to exclude!')
             }
             x
            }
           )


setMethod ('exclude' ,signature(x='RasterBrick', vif='VIF'),
           function (x,vif,...) {
             n <- names(x)
             
             if (length(vif@excluded) > 0) {
               .ex <- vif@excluded %in% n
               if (all(!.ex)) {
                 stop('None of the variables in the Raster object are among those variables specified in the VIF object to be excluded!')
               } else if (any(!.ex)) {
                 warning(paste0('The variables (',paste(vif@excluded[!.ex],collapse = ', '),') are not available in the Raster object!'))
               }
               j <- which(n %in% vif@excluded)
               x <- x[[-j]]
             } else {
               warning('No variable to exclude!')
             }
             x
           }
)
#-----
setMethod ('exclude' ,signature(x='SpatRaster', vif='VIF'),
           function (x,vif,...) {
             n <- names(x)
             
             if (length(vif@excluded) > 0) {
               .ex <- vif@excluded %in% n
               if (all(!.ex)) {
                 stop('None of the variables in the Raster object are among those variables specified in the VIF object to be excluded!')
               } else if (any(!.ex)) {
                 warning(paste0('The variables (',paste(vif@excluded[!.ex],collapse = ', '),') are not available in the Raster object!'))
               }
               j <- which(n %in% vif@excluded)
               x <- x[[-j]]
             } else {
               warning('No variable to exclude!')
             }
             x
           }
)

setMethod ('exclude' ,signature(x='data.frame', vif='VIF'),
           function (x,vif, ...) {
             n <- colnames(x)
             
             if (length(vif@excluded) > 0) {
               .ex <- vif@excluded %in% n
               if (all(!.ex)) {
                 stop('None of the variables in the Raster object are among those variables specified in the VIF object to be excluded!')
               } else if (any(!.ex)) {
                 warning(paste0('The variables (',paste(vif@excluded[!.ex],collapse = ', '),') are not available in the Raster object!'))
               }
               j <- which(n %in% vif@excluded)
               x <- x[,-j,drop=FALSE]
             } else {
               warning('No variable to exclude!')
             }
             x
             
           }
)

setMethod ('exclude' ,signature(x='matrix', vif='VIF'),
           function (x,vif, ...) {
             n <- colnames(x)
             
             if (length(vif@excluded) > 0) {
               .ex <- vif@excluded %in% n
               if (all(!.ex)) {
                 stop('None of the variables in the Raster object are among those variables specified in the VIF object to be excluded!')
               } else if (any(!.ex)) {
                 warning(paste0('The variables (',paste(vif@excluded[!.ex],collapse = ', '),') are not available in the Raster object!'))
               }
               j <- which(n %in% vif@excluded)
               x <- x[,-j,drop=FALSE]
             } else {
               warning('No variable to exclude!')
             }
             x
             
           }
)

setMethod ('exclude' ,signature(x='RasterStack', vif='missing'),
           function (x,vif,th,...) {
             n <- names(x)
             if(missing(th)) th <- 10
             vif <- vifstep(x,...)
             print(vif)
             # if (length(vif@excluded) > 0) x[[as.character(vif@results[,1])]]
             # else x
             exclude(x,vif)
           }
)

setMethod ('exclude' ,signature(x='RasterBrick', vif='missing'),
           function (x,vif, th,...) {
             n <- names(x)
             if(missing(th)) th <- 10
             vif <- vifstep(x,th=th,...)
             print(vif)
             exclude(x,vif)
           }
)


setMethod ('exclude' ,signature(x='SpatRaster', vif='missing'),
           function (x,vif, th,...) {
             n <- names(x)
             if(missing(th)) th <- 10
             vif <- vifstep(x,th=th,...)
             print(vif)
             exclude(x,vif)
           }
)

setMethod ('exclude' ,signature(x='data.frame', vif='missing'),
           function (x,vif, th,...) {
             n <- colnames(x)
             if(missing(th)) th <- 10
             vif <- vifstep(x,th=th,...)
             print(vif)
             exclude(x,vif)
           }
)

setMethod ('exclude' ,signature(x='matrix', vif='missing'),
           function (x,vif, th,...) {
             n <- colnames(x)
             if(missing(th)) th <- 10
             vif <- vifstep(x,th=th,...)
             print(vif)
             exclude(x,vif)
           }
)
