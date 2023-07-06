# usdm

## Uncertainty Analysis for Species Distribution Modelling

The usdm package provides a set of functions to support dealing with problematic situations in species distribution modelling (e.g., multicollinearity, positional uncertainty). 

To detect whether predictor variables are subjected to multicollinearity, you may use vif (variance inflation factor) metric, and some methods implemeted in this package including vifstep or vifcor (a stepwise procedure to identify collinear variables).

To detect whether positional uncertainty in species data may affect SDMs, different strategies are implemented through using either global or local spatial autocorrelation. You may check the following links for more information:


https://r-gis.net/?q=positional_uncertainty (using global spatial autocorrelation)

https://r-gis.net/?q=positional_uncertainty2 (using local spatial autocorrelation)



To develop species distribution models (SDMs), you may use the sdm package.
