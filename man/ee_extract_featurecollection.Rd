% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ops-subsetting-fc.R
\name{ee_extract_featurecollection}
\alias{ee_extract_featurecollection}
\alias{[[.ee.featurecollection.FeatureCollection}
\title{Extract parts of and EE FeatureCollection}
\usage{
\method{[[}{ee.featurecollection.FeatureCollection}(x, index)
}
\arguments{
\item{x}{ee$FeatureCollection.}

\item{index}{Integer. Index specifying elements to extract or replace.}
}
\value{
An ee$FeatureCollection
}
\description{
Extract parts of and EE FeatureCollection
}
\examples{
\dontrun{
library(rgee)
library(rgeeExtra)
library(sf)

ee_Initialize(gcs = TRUE, drive = TRUE)
extra_Initialize()

# Define a Image or ImageCollection: Terraclimate
fc_tiger <- ee$FeatureCollection('TIGER/2016/Roads')
fc_tiger_subset <- fc_tiger[[1:100]]
Map$centerObject(fc_tiger_subset)
Map$addLayer(fc_tiger_subset)
}
}
