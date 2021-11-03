register <- jsonlite::fromJSON("../register.JSON")
#cat("\nMangas\n")
cliapp::cli_h1("Mangas")
register$nome
cat("\n")