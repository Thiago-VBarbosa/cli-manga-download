
source("utils/get_meta_data.r")
source("../docs/doc_insert.r")

args <- commandArgs(TRUE)
meta_data <- get_meta_data(args[2])

manga_meta_data <- data.frame(nome = args[1], cod = args[2], meta_data)

con <- DBI::dbConnect(RSQLite::SQLite(), "../db/mangas.s3db")
on.exit(DBI::dbDisconnect(con, add = TRUE))
DBI::dbWriteTable(con, "list_mangas", manga_meta_data, append = TRUE)
