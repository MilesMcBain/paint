is_scalar <- function (x) NROW(x) == 1 && NCOL(x) == 1

sanitise_text <- function(x) {
  gsub("\n|\r|\t", " ", x)
}
