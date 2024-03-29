% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ee_Image.R, R/ee_ImageCollection.R
\name{ee-getstac}
\alias{ee-getstac}
\alias{ee_Image_getSTAC}
\alias{ee_ImageCollection_getSTAC}
\title{Retrieve EE Image or EE ImageCollection STAC metadata}
\usage{
`ee$Image$Extra_getSTAC(x)`

`ee$ImageCollection$Extra_getSTAC(x)`
}
\arguments{
\item{x}{An ee$Image or an ee$ImageCollection object.}
}
\value{
Return STAC metadata for each band.
}
\description{
Get the STAC of an ee$Image or ee$ImageCollection object.
}
\examples{
\dontrun{
library(rgee)
library(rgeeExtra)

ee_Initialize()
extra_Initialize()

# Retrieve STAC metadata for the first image in NASA's GPM L3 IMERG V06 collection
stac_metadata <- ee$ImageCollection("NASA/GPM_L3/IMERG_V06")[[1]] \%>\%
  ee$Image$Extra_getSTAC()

stac_metadata

# Retrieve STAC metadata from NASA's IMERG V06 image collection.
stac_metadata_ <- ee$ImageCollection("NASA/GPM_L3/IMERG_V06") \%>\%
  ee$ImageCollection$Extra_getSTAC()

stac_metadata_
}
}
