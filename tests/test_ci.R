exec.chunked.factored.running.mean <- function(n) {
    ## create a netcdf file
    varid <- 'tasmax'
    dims <- list(ncdim_def('x', '', 1:2), ncdim_def('y', '', 1:3), ncdim_def('t', '', 1:8))
    var <- ncvar_def(varid, 'degC', dims)
    nc <- nc_create(tempfile(fileext='.nc'), var)
    
    x <- array(rep(1:8, each=6), dim=c(2, 3, 8))
    ncvar_put(nc, varid, x, c(1, 1, 1), c(-1, -1, -1))

    f <- factor(rep(1:2, each=4))

    ## Chunks align with factor
    rv <- ClimDown:::chunked.factored.running.mean(nc, f, varid, nt.per.chunk=n)
    expected <- array(rep(c(2.5, 6.5), each=6), dim=c(2, 3, 2))
    checkEquals(rv, expected)
}

test.chunked.factored.running.mean.aligned <- function() {
    exec.chunked.factored.running.mean(2)
}

test.chunked.factored.running.mean.unaligned <- function() {
    exec.chunked.factored.running.mean(4)
}

test.chunked.factored.running.mean.dim.not.aligned <- function() {
    exec.chunked.factored.running.mean(7)
}

test.ci.netcdf.wrapper <- function() {
    out.nc <- tempfile(fileext='.nc')
    ClimDown::ci.netcdf.wrapper('./tiny_gcm.nc', './tiny_obs.nc', out.nc)
    unlink(out.nc)
    checkTrue(TRUE)
}

test.is.range.subset <- function() {
    f <- ClimDown:::is.range.subset
    checkTrue(f(c(1, 2), c(0, 3)))
    checkEquals(FALSE, f(c(1, 2), c(1, 3)))
    checkEquals(FALSE, f(c(1, 2), c(0, 2)))
    checkEquals(FALSE, f(c(0, 3), c(1, 2)))
    checkEquals(FALSE, f(c(1, 3), c(0, 2)))
    checkEquals(FALSE, f(c(1, 3), c(2, 4)))
    checkEquals(FALSE, f(NA, c(1, 2)))
}
