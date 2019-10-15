#' Run an infinite loop (for no obvious reason)
#'
#' @export

#' @examples
#' infinite_loop()
#'

infinite_loop <- function() {
  x <- TRUE

  while (x == TRUE) {
    i <- 1 + 3
  }
}
