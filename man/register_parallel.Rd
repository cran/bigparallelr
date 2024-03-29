% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/register-parallel.R
\name{register_parallel}
\alias{register_parallel}
\title{Register parallel}
\usage{
register_parallel(ncores, ...)
}
\arguments{
\item{ncores}{Number of cores to use. If using only one, then this function
uses \code{\link[foreach:registerDoSEQ]{foreach::registerDoSEQ()}}.}

\item{...}{Arguments passed on to \code{\link[=makeCluster]{makeCluster()}}.}
}
\description{
Register parallel in functions. Do \code{\link[=makeCluster]{makeCluster()}}, \code{\link[=registerDoParallel]{registerDoParallel()}}
and \code{\link[=stopCluster]{stopCluster()}} when the function returns.
}
\examples{
\dontrun{

test <- function(ncores) {
  register_parallel(ncores)
  foreach(i = 1:2) \%dopar\% i
}

test(2)  # only inside the function
foreach(i = 1:2) \%dopar\% i
}

}
