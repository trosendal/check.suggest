% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/suggest.R
\name{suggest}
\alias{suggest}
\title{suggest}
\usage{
suggest(log, path)
}
\arguments{
\item{log}{A string containing the check log}

\item{path}{The path to the check log file}
}
\value{
invisible(NULL)
}
\description{
A function that reads the output from R CMD check and if it finds
some common patterns it suggests solutions.
}
