% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/CI.R
\name{ci.netcdf.wrapper}
\alias{ci.netcdf.wrapper}
\title{High-level NetCDF wrapper for Climate Imprint (CI)}
\usage{
ci.netcdf.wrapper(gcm.file, obs.file, output.file, varname = "tasmax")
}
\arguments{
\item{gcm.file}{Filename of GCM simulations}

\item{obs.file}{Filename of high-res gridded historical observations}

\item{output.file}{Filename to create (or overwrite) with the climate imprint outputs}

\item{varname}{Name of the NetCDF variable to downscale (e.g. 'tasmax')}
}
\description{
CI performs several steps. For the GCM input it
calculates daily climate anomalies from a given calibration period
(default 1951-2005). These daily GCM anomalies are interpolated to
the high-resolution observational grid. These interpolated daily
anomalies constitute the "Climate Imprint". The high resolution
gridded observations are then grouped into months and a climatology
is calculated for each month. Finally the observed climatology is
added to the GCM-based climate imprint and the final result is
saved to output.file.
}
\references{
Hunter, R. D., & Meentemeyer, R. K. (2005). Climatologically aided mapping of daily precipitation and temperature. Journal of Applied Meteorology, 44(10), 1501-1510.

Ahmed, K. F., Wang, G., Silander, J., Wilson, A. M., Allen, J. M., Horton, R., & Anyah, R. (2013). Statistical downscaling and bias correction of climate model outputs for climate change impact assessment in the US northeast. Global and Planetary Change, 100, 320-332.
}

