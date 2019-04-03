#' Display time graphically
#'
#' @param military Logical (default = FALSE)
#'
#' @export

#' @examples
#' timebars()
#' timebars(military = TRUE)
#'

timebars <- function(military = FALSE) {
  t <- Sys.time()
  df <- data.frame(
    hours = lubridate::hour(t),
    minutes = lubridate::minute(t),
    seconds = lubridate::second(t))

  hourmax <- 24

  if (!military & (df$hours > 12)) {
    df$hours <- df$hours - 12
    hourmax <- 12
  }

  df %>%
    tidyr::gather() %>%
    dplyr::mutate(max = paste("max =", c(hourmax, 60, 60))) %>%
    dplyr::mutate(key = forcats::fct_rev(key))  %>%
    ggplot2::ggplot(ggplot2::aes(key, value)) +

    ggplot2::geom_col(ggplot2::aes(y = readr::parse_number(max)), fill = "khaki1") +
    ggplot2::geom_col(fill = "cornflowerblue") +
    ggplot2::scale_y_continuous(expand = c(0,0)) +
    ggplot2::coord_flip() +
    ggplot2::facet_wrap(~max, ncol = 1, scales = "free") +
    ggplot2::ggtitle("Current Time") +
    ggplot2::theme_classic(16) +
    ggplot2::labs(x = "", y = "")

}
