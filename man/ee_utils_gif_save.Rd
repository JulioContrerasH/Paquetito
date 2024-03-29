% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ee_gif.R
\name{ee_utils_gif_save}
\alias{ee_utils_gif_save}
\title{Write a GIF}
\usage{
ee_utils_gif_save(
  image,
  path = NULL,
  format = NULL,
  quality = NULL,
  depth = NULL,
  density = NULL,
  comment = NULL,
  flatten = FALSE
)
}
\arguments{
\item{image}{magick image object returned by \link[magick:editing]{image_read}.}

\item{path}{path a file, url, or raster object or bitmap array.}

\item{format}{output format such as \code{"png"}, \code{"jpeg"}, \code{"gif"}, \code{"rgb"} or \code{"rgba"}.}

\item{quality}{number between 0 and 100 for jpeg quality. Defaults to 75.}

\item{depth}{color depth (either 8 or 16).}

\item{density}{resolution to render pdf or svg.}

\item{comment}{text string added to the image metadata for supported formats.}

\item{flatten}{should the image be flattened before writing? This also replaces
transparency with a background color.}
}
\value{
No return value, called to write a GIF file.
}
\description{
Write a magick-image object as a GIF file using the \code{magick} package. This
function is a wrapper around \link[magick:editing]{image_write}.
}
\examples{
\dontrun{
library(rgee)
library(rgeeExtra)

ee_Initialize()

col <- ee$ImageCollection("JRC/GSW1_1/YearlyHistory")$map(function(img) {
  year <- img$date()$get("year")
  yearImg <- img$gte(2)$multiply(year)
  despeckle <- yearImg$connectedPixelCount(15, TRUE)$eq(15)
  yearImg$updateMask(despeckle)$selfMask()$set("year", year)
})

appendReverse <- function(col) col$merge(col$sort('year', FALSE))

# -----------------------------------
# 1 Basic Animation - Ucayali Peru
# -----------------------------------

bgColor = "FFFFFF" # Assign white to background pixels.
riverColor = "0D0887" # Assign blue to river pixels.

## 1.1 Create the dataset
annualCol = col$map(function(img) {
  img$unmask(0)$
    visualize(min = 0, max = 1, palette = c(bgColor, riverColor))$
    set("year", img$get("year"))
})
basicAnimation <- appendReverse(annualCol)


## 1.2 Set video arguments
aoi <- ee$Geometry$Rectangle(-74.327, -10.087, -73.931, -9.327)
videoArgs = list(
  dimensions = 600, # Max dimension (pixels), min dimension is proportionally scaled.
  region = aoi,
  framesPerSecond = 10
)

## 1.2 Download, display and save the GIF!
animation <- ee_utils_gif_creator(basicAnimation, videoArgs, mode = "wb")
get_years <- basicAnimation$aggregate_array("year")$getInfo()
animation \%>\%
  ee_utils_gif_annotate("Ucayali, Peru") \%>\%
  ee_utils_gif_annotate(get_years, size = 15, location = "+90+40",
                        boxcolor = "#FFFFFF") \%>\%
  ee_utils_gif_annotate("created using {magick} + {rgee}",
                        size = 15, font = "sans",location = "+70+20") ->
  animation_wtxt
gc(reset = TRUE)
ee_utils_gif_save(animation_wtxt, path = paste0(tempfile(), ".gif"))
}
}
\seealso{
Other GIF functions: 
\code{\link{ee_utils_gif_annotate}()},
\code{\link{ee_utils_gif_creator}()}
}
\author{
Jeroen Ooms
}
\concept{GIF functions}
