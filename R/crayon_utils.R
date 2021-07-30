lapply_safely <- function(lst, funs) {
	lapply(lst, function(x) {
		if ((!is.null(x) && !is.na(x)) && !is.infinite(x)) funs(x) else x
	})
}

strip_style_safely <- function(x) lapply_safely(x, crayon::strip_style) 
