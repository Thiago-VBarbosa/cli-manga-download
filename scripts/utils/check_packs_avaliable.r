list_packages <- c("xml2","httr","fs","magick","magrittr","tibble", "glue",
    "dplyr","stringr","jsonlite","bookdown","zip","cliapp","docopt",
    "purrr", "DBI", "RSQLite")

install_missing_packages <- function(pack) {
    if(!(pack %in% rownames(installed.packages()))){
        install.packages(pack, repos = "https://cran-r.c3sl.ufpr.br/")
    }
}

invisible(sapply(list_packages, install_missing_packages))