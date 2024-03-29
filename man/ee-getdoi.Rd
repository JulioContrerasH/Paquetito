% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ee_Image.R, R/ee_ImageCollection.R
\name{ee-getdoi}
\alias{ee-getdoi}
\alias{ee_image_getDOI}
\alias{ee_ImageCollection_getDOI}
\title{Get the Digital Object Identifier (DOI) of an EE object}
\usage{
`ee$Image$Extra_getDOI(x)`

`ee$ImageCollection$Extra_getDOI(x)`
}
\arguments{
\item{x}{An EE object to get the DOI from.}
}
\value{
A character with DOI information.
}
\description{
If it exists, retrieve the DOI of an EE object.
}
\examples{
\dontrun{
library(rgee)
library(rgeeExtra)

ee_Initialize()
extra_Initialize()

# Fetch DOI for first image in NASA IMERG V06 collection
doi <- ee$ImageCollection("NASA/GPM_L3/IMERG_V06")[[1]] \%>\%
  ee$Image$Extra_getDOI()

doi

# Retrieve and print the DOI for the NASA/GPM_L3/IMERG_V06 image collection.
doi_ <- ee$ImageCollection("NASA/GPM_L3/IMERG_V06") \%>\%
  ee$ImageCollection$Extra_getDOI()

doi_
}
}
