# 0.1.7

* Handle characters with invalid encoding by attempting conversion with `stringi::stri_trans_general`. This will result invalid characters being replaces by a missing char question mark. Previously these crashed out `{paint}`, failing in `{crayon}`.

# 0.1.6

* Compatibility with changes in {crayon}.

# 0.1.5

* Small changes for backward compatibility with R. Verified working on 3.6.0.

# 0.1.3

* Enhanced version of `ipaint()` for interactively scrollable painted output. It no longer fills the terminal with junk. It's a nice terminal-only competitor to `View()`