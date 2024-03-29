% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ee_Image.R, R/ee_ImageCollection.R
\name{ee-citation}
\alias{ee-citation}
\alias{ee_image_getCitation}
\alias{ee_ImageCollection_getCitation}
\title{Citing EE objects in publications}
\usage{
`ee$Image$Extra_getCitation(x)`

`ee$ImageCollection$Extra_getCitation(x)`
}
\arguments{
\item{x}{An EE object to get the citation from.}
}
\value{
A character with citation information.
}
\description{
If it exists, retrieve the citation of an EE object.
}
\examples{
\dontrun{
library(rgee)
library(rgeeExtra)

ee_Initialize()
extra_Initialize()

# Retrieve citation for the first image in NASA's IMERG V06 collection
citation <- ee$ImageCollection("NASA/GPM_L3/IMERG_V06")[[1]] \%>\%
  ee$Image$Extra_getCitation()

# Display the citation
citation

# Fetching NASA/GPM_L3/IMERG_V06 image collection and retrieving its citation.
citation_ <- ee$ImageCollection("NASA/GPM_L3/IMERG_V06") \%>\%
  ee$ImageCollection$Extra_getCitation()

# Display the citation
citation_
}
}
