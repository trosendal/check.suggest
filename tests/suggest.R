library("check.suggest")

path <- system.file("extdata/examples/0001check.log", package = "check.suggest")
suggest(path = path)

path <- system.file("extdata/examples/0002check.log", package = "check.suggest")
suggest(path = path)

path <- system.file("extdata/examples/0003check.log", package = "check.suggest")
suggest(path = path)

ob <- tools::assertError(suggest(log = "", path = path))[[1]]$message
ex <- paste("Only one of log or path must be supplied to suggest")
stopifnot(length(grep(ex, ob)) == 1L)

ob <- tools::assertError(suggest())[[1]]$message
ex <- paste("One of log or path must be supplied to suggest")
stopifnot(length(grep(ex, ob)) == 1L)

suggest(log = "")
