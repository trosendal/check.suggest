##' suggest
##'
##' A function that reads the output from R CMD check and if it finds
##' some common patterns it suggests solutions.
##'
##' @param path The path to the check log file
##' @importFrom rjson fromJSON
##' @export
##' @return invisible(NULL)
suggest <- function(path) {
    x <- system.file("extdata/patterns.json",
                     package = "check.suggest")
    x <- rjson::fromJSON(file = x)
    y <- readLines(path)
    for (i in seq_along(x)) {
        message <- NULL
        if (any(grepl(x[[i]]["pattern"], y)))
            message <- paste0(strwrap(x[[i]]["suggestion"]), "\n")
        cat(message, "\n")
    }

    invisible(NULL)
}
