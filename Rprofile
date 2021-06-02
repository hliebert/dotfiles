# vim r plugin
# if(interactive()){
   # library(colorout)
# }

# set repo mirrors
options(repos=c("http://stat.ethz.ch/CRAN/"))

# larger history
Sys.setenv(R_HISTSIZE = '100000')

# headtail function, show the first and last 10 items of an object
ht <- function(d) rbind(head(d,10), tail(d,10))

# Override q() to not save by default. Same as saying q("no").
q <- function (save = "no", ...) {
  quit(save = save, ...)
}

# User library path, hidden folder
Sys.unsetenv("R_LIBS_USER")
Sys.setenv(R_LIBS_USER = "~/.R/x86_64-pc-linux-gnu-library")
.libPaths( c("~/.R/x86_64-pc-linux-gnu-library", .libPaths()))

# enable bspm
suppressMessages(bspm::enable())
