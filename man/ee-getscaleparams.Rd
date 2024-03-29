% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ee_Image.R, R/ee_ImageCollection.R
\name{ee-getscaleparams}
\alias{ee-getscaleparams}
\alias{ee_Image_getScaleParams}
\alias{ee_ImageCollection_getScaleParams}
\title{Retrieve scale parameter from EE Image and EE ImageCollection objects.}
\usage{
`ee$Image$Extra_getScaleParams(x)`

`ee$ImageCollection$Extra_getScaleParams(x)`
}
\arguments{
\item{x}{An ee$Image.or an ee$ImageCollection object.}
}
\value{
A list with the scale parameters for each band.
}
\description{
Earth Engine apply a simply lossless compression technique: IMG_Float_Values =
scale * IMG_Integer_Values + offset. ee$Image$getScaleParams and
ee$ImageCollection$getScaleParams retrieve the scale parameter
for each band of an ee$Image.
}
\examples{
\dontrun{
library(rgee)
library(rgeeExtra)

ee_Initialize()
extra_Initialize()

# Retrieve scale parameters from the first image in NASA IMERG V06 collection
scale_params <- ee$ImageCollection("NASA/GPM_L3/IMERG_V06")[[1]] \%>\%
  ee$Image$Extra_getScaleParams()

# Display scale parameters for each band in the image.
scale_params

# Retrieve scale parameters for the NASA IMERG V06 collection.
scale_params_ <- ee$ImageCollection("NASA/GPM_L3/IMERG_V06") \%>\%
  ee$Image$Extra_getScaleParams()

# Display scale parameters for each band in the image.
scale_params_
}
}
