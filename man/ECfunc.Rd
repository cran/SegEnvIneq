% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/SegEnvIneq.R
\name{ECfunc}
\alias{ECfunc}
\title{A function to compute environmental centralization index}
\usage{
ECfunc (x, distmin = NULL, dist = NULL, K = NULL, kdist = NULL,
spatobj1 = NULL, folder1 = NULL, shape1 = NULL,
spatobj2 = NULL, folder2 = NULL, shape2 = NULL)
}
\arguments{
\item{x}{- a matrix with the groups distributions across spatial units}

\item{distmin}{- an optional vector with the minimal distance between each spatial
unit and all the environmental localisations. If not provided, it will be computed
in the function}

\item{dist}{- an optional matrix with the distance between all spatial units
and environmental localisations. If not provided, it will be computed in the function}

\item{K}{- if provided, the version of the index constrained to the K nearest neighbors}

\item{kdist}{- if provided, the version of the index constrained to  the nearest neighbors
within a distance of kdist}

\item{spatobj1}{- polygons spatial objects for population distribution to compute distances matrix
(necessary if distance not provided).}

\item{folder1}{- a character vector with the folder (directory) name
indicating where the shapefile with geographical info of population distribution is located
on the drive (necessary if distance and spatial object are not provided).}

\item{shape1}{- a character vector with the name of the shapefile
(without the .shp extension) with geographical info of population distribution}

\item{spatobj2}{- points spatial objects for (dis-)amenity location to compute distances matrix
(necessary if distance not provided).}

\item{folder2}{- a character vector with the folder (directory) name
indicating where the shapefile with geographical info of (dis-)amenity distribution is located
on the drive (necessary if distance and spatial object are not provided).}

\item{shape2}{- a character vector with the name of the shapefile
(without the .shp extension) with geographical info of (dis-)amenity spatial location}
}
\value{
The matrix with environmental centralization index values
}
\description{
Environmental Centralization index compares the spatial distribution of two
 social groups around a specific environmental (dis-)amenity, located at one or more points.
}
\examples{
data(segdata, package = "OasisR")
# segdata - theoretical distributions on a 10x10 grid map
# We consider A1 and A2 - two populations distribution and
# the amenities are located in the grid center
distance <- sf::st_distance(sf::st_centroid(sf::st_as_sf(segdata)),
sf::st_centroid(sf::st_union(sf::st_as_sf(segdata))))
ECfunc (segdata@data[,3:4], dist = distance)
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

Folch D.C and Rey S. J (2016) The centralization index:
A measure of local spatial segregation. \emph{Papers in Regional
Science}, 95 (3), pp. 555-576
}
\seealso{
\code{\link{EDfunc}}, \code{\link{EnvResampleTest}},
\code{\link{EnvResamplePlot}}
}
