##' suggest
##'
##' A function that reads the output from R CMD check and if it finds
##' some common patterns it suggests solutions.
##'
##' @param log A string containing the check log
##' @param path The path to the check log file
##' @export
##' @return invisible(NULL)
suggest <- function(log, path) {
    x <- system.file("extdata/patterns.json",
                     package = "check.suggest")
    x <- rjson::fromJSON(file = x)

    ml <- missing(log)
    mp <- missing(path)

    if (ml) {
        if (mp) {
            stop("One of log or path must be supplied to suggest")
        }
        log <- readLines(path)
    }
    if (!ml && !mp) {
        stop("Only one of log or path must be supplied to suggest")
    }

    for (i in seq_along(x)) {
        message <- NULL
        if (any(grepl(x[[i]]["pattern"], log)))
            message <- paste0(strwrap(x[[i]]["suggestion"]), "\n")
        cat(message, "\n")
    }

    invisible(NULL)
}
