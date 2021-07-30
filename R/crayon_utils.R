lapply_safely <- function(lst, funs) {
	lapply(lst, function(x) {
		if (is.null(x)) return(x)
		if (length(x) == 1) {
      if (is.na(x) || is.infinite(x)) return(x)
		}
		funs(x)
	})
}

strip_style_safely <- function(x) lapply_safely(x, crayon::strip_style) 
