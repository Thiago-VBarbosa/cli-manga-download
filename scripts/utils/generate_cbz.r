generate_cbz <- function(path, name, list_files) {
    zip::zipr(zipfile = cbz_file <- file.path(path, glue::glue("{name}.CBZ")),
    files = list_files)
    return(
        invisible(cbz_file)
        )
}