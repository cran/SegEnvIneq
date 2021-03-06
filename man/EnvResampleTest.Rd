% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/SegEnvIneq.R
\name{EnvResampleTest}
\alias{EnvResampleTest}
\title{A function to test environmental inequality indices by resampling}
\usage{
EnvResampleTest(x, a = NULL, fun, simtype = "MonteCarlo",
nsim = NULL, sampleunit = "unit", proba = NULL, setseed = FALSE,
perc = c(.05, .95), outl = FALSE, outmeth = "bp", sdtimes = 2, IQRrange = 1.5,
spatobj = NULL, folder = NULL, shape = NULL,
spatobj1 = NULL, folder1 = NULL, shape1 = NULL,
spatobj2 = NULL, folder2 = NULL, shape2 = NULL,
distmin = NULL, dist = NULL, K = NULL, kdist = NULL,
vers = "standard", w = NULL, b = NULL, ar = NULL, per = NULL,
queen = TRUE, ptype = "int", f = "exp", beta = 1)
}
\arguments{
\item{x}{-  a vector of the population/group distribution across spatial units for EDfunc or
a matrix with the groups distributions across spatial units for ECfunc}

\item{a}{- a vector of the environmental variable spatial distribution for EDfunc}

\item{fun}{- a character vector with the function to be tested, fun = "EDfunc" or fun = "ECfunc"}

\item{simtype}{- a character vector with the type of simulation.
If simtype = 'MonteCarlo' (by default), the function produces a randomization test
using Monte Carlo simulations. If simtype = 'Jack', the function generates jackknife replications}

\item{nsim}{- the number of simulations (equal to the number of observations for jackknife)}

\item{sampleunit}{- for jackknife replicant, the resampling is made only on spatial units.
For Monte Carlo simulations, the user can choose between "unit" for spatial units
resampling and "ind" for population resampling.}

\item{proba}{- for Monte Carlo simulations on population, proba is a vector with location probabilities.
If proba = NULL, the vector is equiprobable. If outliers are determined with jackknife technique,
proba indicates the probability (confidence interval) for scoring tests.}

\item{setseed}{- if TRUE (by default), specify zero seed for repetead simulation}

\item{perc}{- percentille values for jackknife simulations}

\item{outl}{- logical parameter for jackknife simulations, if TRUE the function
provides the outliers obtained by jackknife iterations}

\item{outmeth}{- a character vector designing the outliers detection method:
outmeth = 'bp' (by default) for boxplot method; outmeth = 'sd' for standard deviation method;
outmeth = 'z' for normal scores method; outmeth = 't' for t Student scores method;
outmeth = 'chisq' for chi-squared scores method; outmeth = 'mad' for median absolute deviation
method. The estimations based on scoring methods are obtained using outliers package}

\item{sdtimes}{- multiplication factor of the standard deviation used for
outliers detection with jackknife simulations (2 by default)}

\item{IQRrange}{- determines the boxplot thresholds (1.5 by default) as multiplication of IQR (Inter Quartile Range)}

\item{spatobj}{- a spatial object (SpatialPolygonsDataFrame) for EDfunc geographic functions}

\item{folder}{- a character vector with the folder (directory) containing the shapefile for EDfunc}

\item{shape}{- a character vector with the name of the shapefile for EDfunc as alternative to spatobj}

\item{spatobj1}{- polygons spatial objects for population distribution to compute distances matrix for ECfunc}

\item{folder1}{- a character vector with the folder (directory) containing the shape1 for ECfunc}

\item{shape1}{- a character vector with the name of the shapefile for ECfunc as alternative to spatobj1}

\item{spatobj2}{- points spatial objects for (dis-)amenity location to compute distances matrix for ECfunc}

\item{folder2}{- a character vector with the folder (directory) containing the shape2 for ECfunc}

\item{shape2}{- a character vector with the name of the shapefile for ECfunc as alternative to spatobj2}

\item{distmin}{- an optional vector for ECfunc with the minimal distance between each spatial
unit and all the environmental localisations}

\item{dist}{- an optional matrix for ECfunc with the distance between all spatial units
and environmental localisations.}

\item{K}{- the order of contiguity matrix if "contig" version of EDfunc is chosen (K = 1 by default)}

\item{kdist}{- if provided, the version of the index constrained to  the nearest neighbors
within a distance of kdist}

\item{vers}{- the EDfunc version:
"standard" (by default) for aspatial environmental dissimilarity index (Duncan);
"contig" for adjusted index with a contiguity spatial interactions matrix (Morrill);
"bound" for adjusted index with a boundaries spatial interactions matrix (Wong);
"shape" for adjusted index with a boundaries and shape spatial interactions matrix (Wong);
"user" for adjusted index with any user spatial interactions matrix}

\item{w}{- an optional spatial weights matrix for EDfunc.}

\item{b}{- an optional shared border matrix for EDfunc.}

\item{ar}{- an optional vector of spatial units area for EDfunc.}

\item{per}{- an optional vector of spatial units perimeter for EDfunc.}

\item{queen}{- logical parameter for EDfunc defining criteria used for contiguity matrix computation,
TRUE for queen (by default), FALSE  for rook}

\item{ptype}{- a string variable for EDfunc giving two options for perimeter calculation for  Wong's indices:
"int" to use only interior borders of spatial units and
"all" to use entire borders, including to the exterior of the area}

\item{f}{- spatial decay function of contiguity matrix for EDfunc when K > 1, with
f = "exp" (by default) for exponential function of contiguity "distance"}

\item{beta}{- spatial decay intensity parameter for EDfunc (equal to 1 by default),
used only when the version with contiguity is chosen and K > 1}
}
\value{
A list with:
- index's name
- simulation type
- statistics summary of the simulations
- simulated index distribution
- simulated population distribution
- matrix with outliers (jackknife)
- list with outliers values (jackknife)
}
\description{
Resampling tests for environmental inequality indexes.
}
\examples{
data(segdata, package = "OasisR")
# segdata - theoretical distributions on a 10x10 grid map
# We consider A1 - population distribution and A2 - amenity distribution
testoutput <- EnvResampleTest (x = segdata@data$A1, a = segdata@data$A2, spatobj = segdata,
fun = "EDfunc", vers = "contig", queen = FALSE)
testoutput$Summary
hist(testoutput$IndexDist)
}
\references{
Schaeffer Y. and Tivadar M. (2019)
Measuring Environmental Inequalities: Insights from the Residential
Segregation Literature. \emph{Ecological Economics}, 164, 106329

Tivadar M. (2019)
OasisR: An R Package to Bring Some Order to the World of Segregation Measurement.
\emph{Journal of Statistical Software},  89 (7), pp. 1-39
}
\seealso{
\code{\link{EDfunc}}, \code{\link{ECfunc}},
\code{\link{EnvResamplePlot}}
}
