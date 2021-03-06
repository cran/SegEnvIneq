% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/SegEnvIneq.R
\name{EDfunc}
\alias{EDfunc}
\title{A function to compute environmental dissimilarity index}
\usage{
EDfunc (x, a, vers = "standard", w = NULL, ar = NULL, per = NULL,
b = NULL, folder = NULL, shape = NULL, spatobj = NULL, queen = TRUE,
ptype = "int", K = 1, f = "exp", beta = 1)
}
\arguments{
\item{x}{- a vector of the population/group distribution across spatial units}

\item{a}{- a vector of the environmental variable spatial distribution}

\item{vers}{- the index version:
"standard" (by default) for aspatial environmental dissimilarity index (Duncan);
"contig" for adjusted index with a contiguity spatial interactions matrix (Morrill);
"bound" for adjusted index with a boundaries spatial interactions matrix (Wong);
"shape" for adjusted index with a boundaries and shape spatial interactions matrix (Wong);
"user" for adjusted index with any user spatial interactions matrix}

\item{w}{- an optional spatial weights matrix.
If necessary and not provided, it will be computed in the function}

\item{ar}{- an optional vector of spatial units area.
If necessary and not provided, it will be computed in the function}

\item{per}{- an optional vector of spatial units perimeter.
If necessary and not provided, it will be computed in the function.}

\item{b}{- an optional shared border matrix.
If necessary and not provided, it will be computed in the function.}

\item{folder}{- a character vector with the folder (directory) name
indicating where the shapefile with geographical info is located on the drive
if the interactions matrix is computed in the function}

\item{shape}{- a character vector with the name of the shapefile
(without the .shp extension)}

\item{spatobj}{- a spatial object (SpatialPolygonsDataFrame) with
geographic information as alternative for the shapefile,
if the interactions matrix is computed in the function}

\item{queen}{- logical parameter defining criteria used for contiguity matrix computation,
TRUE for queen (by default), FALSE  for rook}

\item{ptype}{- a string variable giving two options for perimeter calculation for  Wong's indices:
"int" to use only interior borders of spatial units and
"all" to use entire borders, including to the exterior of the area}

\item{K}{- the order of contiguity matrix if "contig" version is chosen (K = 1 by default)}

\item{f}{- spatial decay function of contiguity matrix when K > 1, with
f = "exp" (by default) for exponential function of contiguity "distance" exp(beta*(1-k))}

\item{beta}{- spatial decay intensity parameter (equal to 1 by default),
used only when the version with contiguity is chosen and K > 1}
}
\value{
The value of the environmental dissimilarity index
}
\description{
Environmental Dissimilarity index measures
the dissimilarity between the distribution of a population
group \emph{x} and the one of an environmental (dis-)amenity \emph{a}
among spatial units. The environmental dissimilarity index has several versions:
"standard" aspatial version based on Duncan & Duncan (1955) segregation index;
adjusted versions with spatial interactions matrices based on contiguities
(Morrill, 1991; Tivadar, 2019), boundaries, or shapes (Wong, 1998; Tivadar, 2019);
or defined by the user.
}
\examples{
data(segdata, package = "OasisR")
# segdata - theoretical distributions on a 10x10 grid map
# We consider A1 - population distribution and A2 - amenity distribution
EDfunc (segdata@data$A1, segdata@data$A2)
EDfunc (segdata@data$A1, segdata@data$A2, vers = "contig", spatobj =segdata, queen = FALSE)
EDfunc (segdata@data$A1, segdata@data$A2, vers = "contig", spatobj =segdata, queen = FALSE, K = 3)
EDfunc (segdata@data$A1, segdata@data$A2, vers = "bound", spatobj =segdata)
EDfunc (segdata@data$A1, segdata@data$A2, vers = "shape", spatobj =segdata, ptype = 'all')
}
\references{
Schaeffer Y. and Tivadar M. (2019)
Measuring Environmental Inequalities: Insights from the Residential
Segregation Literature. \emph{Ecological Economics}, 164, 106329

Tivadar M. (2019)
OasisR: An R Package to Bring Some Order to the World of Segregation Measurement.
\emph{Journal of Statistical Software},  89 (7), pp. 1-39

Duncan O. D. and Duncan B. (1955)
Residential Distribution and Occupational Stratification.
\emph{American Journal of Sociology}, 60 (5), pp. 493-503

Morrill B. (1991) On the measure of geographic
segregation. \emph{Geography research forum}, 11, pp. 25-36.

Wong D. W. S. (1998) Measuring multiethnic spatial
segregation. \emph{Urban Geography}, 19 (1), pp. 77-87.
}
\seealso{
\code{\link{ECfunc}}, \code{\link{EnvResampleTest}},
\code{\link{EnvResamplePlot}}
}
